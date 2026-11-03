"""Genera los Bounded Context Canvas (versión V5 de ddd-crew) como HTML y los exporta a PNG con Chrome.

Uso:  python docs/bounded-context-canvas/v5/generate.py
      CHROME=/ruta/a/chrome python docs/bounded-context-canvas/v5/generate.py
Salida: assets/img/artifacts/bounded-context-canvas/<contexto>.png (1920 x 1080)

Antes de exportar se ejecutan dos verificaciones y el script se detiene si alguna falla:
  1. Simetría: todo mensaje que un canvas declara en Outbound hacia otro contexto debe aparecer
     en el Inbound de ese contexto, con la misma relación, y viceversa.
  2. Desborde: ninguna sección del canvas puede cortar texto.

Convención de relaciones (se repite igual en los dos canvases de cada integración):
  Open Host Service            consultas a la fachada ACL del contexto upstream
  Open Host Service + events   Care Relationship: consultas del vínculo y eventos del vínculo
  Published Language           Active Targets, el contrato reducido de Nutritional Care
  Published Language + events  Active Targets más los eventos clínicos que consume Monitoring
  Published Language → Conformist  claim de rol de IAM dentro del token
  Customer/Supplier            el downstream negocia qué datos le garantiza el upstream
  Domain events                notificación sin dependencia de datos
  Anticorruption Layer         catálogos externos
Read Models, las apps y el módulo de IA no son bounded contexts: no entran en la verificación.
"""
import html
import os
import pathlib
import re
import shutil
import subprocess
import sys

ROOT = pathlib.Path(__file__).resolve().parents[3]
OUT = ROOT / 'assets' / 'img' / 'artifacts' / 'bounded-context-canvas'
SRC = pathlib.Path(__file__).resolve().parent / 'html'
CHROME_CANDIDATES = [
    os.environ.get('CHROME', ''),
    r'C:\Program Files\Google\Chrome\Application\chrome.exe',
    shutil.which('google-chrome') or '',
    shutil.which('chromium') or '',
]

C, Q, E = 'command', 'query', 'event'

IB, MA, NC, CR, FC, IAM = ('Intake & Body Response', 'Monitoring & Adherence', 'Nutritional Care',
                           'Care Relationship', 'Food Catalog', 'IAM')
PATIENT_APP = 'Patient app (Android)'
PRACTITIONER_APP = 'Practitioner app (Android, Flutter)'
READ_MODELS = 'Read Models (API composition)'
AI = 'Shared AI module (Gemini)'

OHS, OHS_EV = 'Open Host Service', 'Open Host Service + events'
PL, PL_EV, PL_CONF = 'Published Language', 'Published Language + events', 'Published Language → Conformist'
CS, EVENTS, ACL = 'Customer/Supplier', 'Domain events', 'Anticorruption Layer'
NOT_BC = 'not a bounded context'

ROLE_CLAIM = [(Q, 'Role Claim (session token)')]

CONTEXTS = {
    'intake-body-response': dict(
        name=IB,
        purpose='Capture faithfully what the patient eats and how their body responds, without judging it. Patients log meals (by photo or by hand) and weigh-ins with little effort, even offline; other contexts read these data through queries and never write them.',
        cls=('Core', 'Engagement', 'Custom built'),
        roles=['Execution: records meals and weigh-ins.', 'Draft: a photo estimate is a proposal until the patient confirms it.'],
        inbound=[
            (PATIENT_APP, '', [(C, 'Analyze Meal Photo'), (C, 'Log Meal By Photo'), (C, 'Log Meal Manually'), (C, 'Confirm / Adjust Estimate'), (C, 'Record Self Weigh-In'), (C, 'Sync Pending Entries'), (C, 'Request Meal Ideas'), (Q, 'Get Diary Entries'), (Q, 'Get Daily Intake'), (Q, 'Get Weight Trend'), (Q, 'Get Plan Fit'), (Q, 'Get Active Targets')]),
            (NC, PL, [(E, 'Active Targets Updated')]),
            (CR, OHS_EV, [(E, 'AI Processing Consent Changed'), (E, 'AI Preferences Changed')]),
            (MA, CS, [(Q, 'Get Daily Intake Summary'), (Q, 'Get Diary Entry Moments'), (Q, 'Get Weight Trend')]),
            (NC, CS, [(Q, 'Get Diary Entry Moments'), (Q, 'Get Weight Trend')]),
            (READ_MODELS, OHS, [(Q, 'Get Diary Entries'), (Q, 'Get Diary Export'), (Q, 'Get Self Weigh-Ins')]),
            (IAM, PL_CONF, ROLE_CLAIM),
        ],
        outbound=[
            (MA, CS, [(E, 'Meal Logged'), (E, 'Meal Group Logged'), (E, 'Off-Plan Entry Logged'), (E, 'Estimate Confirmed By Patient'), (E, 'Weight Trend Recalculated'), (E, 'Entry Synchronized'), (E, 'Diary Batch Synchronized')]),
            (FC, CS, [(Q, 'Get Reference Foods By Id'), (Q, 'List Verified Foods'), (Q, 'Resolve Foods By Name'), (C, 'Create AI-Estimated Food')]),
            (CR, OHS_EV, [(Q, 'Get Active Care Link')]),
            (IAM, OHS, [(Q, 'Get Preferred Language')]),
            (AI, NOT_BC, [(Q, 'Recognize Meal Photo'), (Q, 'Suggest Meal Ideas')]),
        ],
        ul=[('Diary Entry', 'a meal record; never deleted'), ('Provenance', 'how an entry was captured (photo or manual)'), ('Proposed Estimate', 'what the AI thinks was eaten; a proposal, never a fact'), ('Self Weigh-In', 'a weight recorded following the protocol'), ('Weight Trend', 'the smoothed series; the daily value is never a headline'), ('Plan Fit', 'how a day\'s intake sits against the active targets, shown without a verdict')],
        bd=['A diary entry is never deleted', 'Provenance and local timestamp are mandatory', 'A photo estimate is stored as a proposal with its confidence', 'Declaring plan adherence carries no penalty', 'Only protocol-compliant weigh-ins smooth the trend', 'Offline entries are synced idempotently', 'AI features run only with AI processing consent'],
        assumptions=['Patients keep logging when declaring costs them almost nothing', 'A photo estimate is close enough to confirm or adjust in one step', 'Practitioners trust the trend more than any single day'],
        metrics=['Estimates confirmed without adjustment (%)', 'Days logged per patient per week', 'Offline entries synced without duplicates (%)'],
        questions=['Is a 48 h retroactive window enough?', 'Who owns the weigh-in protocol?', 'Should plan fit be shown before a meal is confirmed?'],
    ),
    'monitoring-adherence': dict(
        name=MA,
        purpose='Compare what was prescribed with what was actually logged and interpret the difference over time. It tells patients how their day went, raises a signal when a pattern needs attention, and keeps the practitioner in charge of every decision.',
        cls=('Core', 'Engagement', 'Custom built'),
        roles=['Analysis: turns logged data into compliance and signals.', 'Specification: evaluates against rules and thresholds.'],
        inbound=[
            (CR, OHS_EV, [(E, 'Care Link Established'), (E, 'Care Link Revoked'), (E, 'Treatment Discharged'), (E, 'AI Processing Consent Changed'), (E, 'AI Preferences Changed')]),
            (NC, PL_EV, [(E, 'Active Targets Updated'), (E, 'Clinical Measurement Taken'), (E, 'Consultation Completed')]),
            (IB, CS, [(E, 'Meal Logged'), (E, 'Meal Group Logged'), (E, 'Off-Plan Entry Logged'), (E, 'Estimate Confirmed By Patient'), (E, 'Weight Trend Recalculated'), (E, 'Entry Synchronized'), (E, 'Diary Batch Synchronized')]),
            (NC, CS, [(Q, 'Get Compliance Range'), (Q, 'Get Compliance Summary'), (Q, 'Get Latest Check-In')]),
            (PRACTITIONER_APP, '', [(C, 'Schedule / Reschedule Follow-Up'), (C, 'Record / Close Referral'), (Q, 'Get Deviations'), (Q, 'Get Monitoring Summary'), (Q, 'Get Suggested Questions')]),
            (PATIENT_APP, '', [(C, 'Submit Pre-Visit Check-In'), (C, 'Acknowledge Consistency Prompt'), (Q, 'Get Daily Compliance'), (Q, 'Get Consistency Index'), (Q, 'Get Weekly Summary')]),
            (READ_MODELS, OHS, [(Q, 'Get Compliance Series'), (Q, 'Get Follow-Up History')]),
            (IAM, PL_CONF, ROLE_CLAIM),
        ],
        outbound=[
            (NC, EVENTS, [(E, 'Sustained Deviation Detected'), (E, 'Alert Escalated To Practitioner')]),
            (NC, PL_EV, [(Q, 'Get Active Targets'), (Q, 'Get Last Completed Consultation'), (Q, 'Has Consistency Escalation')]),
            (IB, CS, [(Q, 'Get Daily Intake Summary'), (Q, 'Get Diary Entry Moments'), (Q, 'Get Weight Trend')]),
            (CR, OHS_EV, [(Q, 'Is Care Link Active'), (Q, 'Get Active Care Link')]),
            (IAM, OHS, [(Q, 'Get Users By Id'), (Q, 'Get Preferred Language')]),
            (AI, NOT_BC, [(Q, 'Generate Weekly Summary'), (Q, 'Suggest Check-In Questions'), (Q, 'Summarize Monitoring')]),
        ],
        ul=[('Evaluation Window', 'the days over which a patient is judged'), ('Daily Compliance', 'met, exceeded or short against that day\'s targets'), ('Deviation', 'a sustained gap from the prescribed targets'), ('Logging Gap', 'days without records; never a deviation'), ('Consistency Index', 'a signal of unreliable records, shown to the patient first')],
        bd=['Each day is evaluated against that day\'s targets snapshot', 'No deviation is computed under a 7-day window', 'A deviation is sustained only if it persists across the window', 'A logging gap never escalates', 'Consistency alerts prompt the patient first; escalation only after 3 weeks', 'A signal notifies; it never modifies the plan'],
        assumptions=['Seven days are enough to tell a deviation from noise', 'Patients check a consistency prompt before the practitioner sees it', 'Practitioners prefer few, well-evidenced signals'],
        metrics=['Signals resolved without plan change (%)', 'Prompts acknowledged by the patient (%)', 'Days evaluated per active patient'],
        questions=['Is three weeks the right time to escalate?', 'How long should a missed visit stay open?', 'Should check-ins ever raise a signal?'],
    ),
    'care-relationship': dict(
        name=CR,
        purpose='Decide who can see whom and under which consent. A practitioner invites a patient; the patient grants, withdraws or moves their consent and chooses which AI features to allow; the relationship closes when treatment ends. Every other context asks this one before touching patient data.',
        cls=('Supporting', 'Compliance', 'Custom built'),
        roles=['Gateway: gates access to patient data.', 'Enforcer: keeps the practitioner/patient asymmetry.'],
        inbound=[
            (PRACTITIONER_APP, '', [(C, 'Issue Invitation'), (C, 'Discharge Patient'), (Q, 'Get Patient Roster'), (Q, 'Get Targets Read Status')]),
            (PATIENT_APP, '', [(C, 'Redeem Invitation'), (C, 'Grant Consent'), (C, 'Withdraw Consent'), (C, 'Set AI Processing Consent'), (C, 'Set AI Preferences'), (C, 'Acknowledge Active Targets'), (Q, 'Get Active Care Link')]),
            (NC, EVENTS, [(E, 'Active Targets Updated')]),
            (f'{MA}, {NC}', OHS_EV, [(Q, 'Is Care Link Active'), (Q, 'Get Active Care Link')]),
            (IB, OHS_EV, [(Q, 'Get Active Care Link')]),
            (IAM, PL_CONF, ROLE_CLAIM),
            (READ_MODELS, OHS, [(Q, 'Get Roster Care Links'), (Q, 'Get Care Link History')]),
        ],
        outbound=[
            (MA, OHS_EV, [(E, 'Care Link Established'), (E, 'Care Link Revoked'), (E, 'Treatment Discharged'), (E, 'AI Processing Consent Changed'), (E, 'AI Preferences Changed')]),
            (IB, OHS_EV, [(E, 'AI Processing Consent Changed'), (E, 'AI Preferences Changed')]),
            (NC, OHS_EV, [(E, 'AI Processing Consent Changed')]),
            (IAM, OHS, [(Q, 'Is Practitioner')]),
        ],
        ul=[('Invitation', 'single-use code that starts a link'), ('Care Link', 'the relationship between one patient and one practitioner'), ('Consent', 'the patient\'s permission to share data'), ('AI Preferences', 'which AI features the patient allows, beyond the processing consent'), ('Discharge', 'clinical closure of the link'), ('Targets Pending Acknowledgement', 'new targets the patient has not yet read')],
        bd=['Invitations are single use and expire', 'A patient cannot link themselves', 'A link starts inactive until consent is granted', 'Consent is always revocable, with no justification', 'A patient can switch practitioner only by confirming it', 'A discharged link is never reactivated'],
        assumptions=['Patients link with one practitioner at a time', 'A QR code is the easiest way to link during a visit', 'Withdrawing consent must also switch off AI'],
        metrics=['Invitations redeemed before expiring (%)', 'Links with consent granted (%)', 'Consent withdrawals per month'],
        questions=['Should a practitioner be able to revoke a link?', 'How long are discharged links kept?', 'Can two practitioners share a patient?'],
    ),
    'nutritional-care': dict(
        name=NC,
        purpose='Support the complete clinical act: assessment, diagnosis, prescription and plan adjustment between visits. The practitioner runs a guided consultation, publishes a plan, and reviews the signals that arrive between visits with the intake and compliance evidence at hand.',
        cls=('Supporting', 'Compliance', 'Custom built'),
        roles=['Execution: carries out the clinical act.', 'Specification: publishes the Active Targets contract.'],
        inbound=[
            (PRACTITIONER_APP, '', [(C, 'Record Baseline'), (C, 'Start Consultation'), (C, 'Take Clinical Measurement'), (C, 'Issue Diagnosis'), (C, 'Prescribe Targets'), (C, 'Publish Nutrition Plan'), (C, 'Adjust Nutrition Plan'), (C, 'Accept Plan Proposal'), (C, 'Resolve Review Item'), (Q, 'Get Review Inbox'), (Q, 'Get Clinical Record')]),
            (PATIENT_APP, '', [(Q, 'Get Active Targets'), (Q, 'Get Plan Versions')]),
            (MA, EVENTS, [(E, 'Sustained Deviation Detected'), (E, 'Alert Escalated To Practitioner')]),
            (MA, PL_EV, [(Q, 'Get Active Targets'), (Q, 'Get Last Completed Consultation'), (Q, 'Has Consistency Escalation')]),
            (CR, OHS_EV, [(E, 'AI Processing Consent Changed')]),
            (IAM, PL_CONF, ROLE_CLAIM),
            (READ_MODELS, OHS, [(Q, 'Get Clinical Evaluations'), (Q, 'Get Active Diagnosis'), (Q, 'Get Plan Version History')]),
        ],
        outbound=[
            (IB, PL, [(E, 'Active Targets Updated')]),
            (MA, PL_EV, [(E, 'Active Targets Updated'), (E, 'Clinical Measurement Taken'), (E, 'Consultation Completed')]),
            (CR, EVENTS, [(E, 'Active Targets Updated')]),
            (IB, CS, [(Q, 'Get Diary Entry Moments'), (Q, 'Get Weight Trend')]),
            (MA, CS, [(Q, 'Get Compliance Range'), (Q, 'Get Compliance Summary'), (Q, 'Get Latest Check-In')]),
            (CR, OHS_EV, [(Q, 'Is Care Link Active'), (Q, 'Get Active Care Link')]),
            (IAM, OHS, [(Q, 'Is Practitioner'), (Q, 'Get Users By Id'), (Q, 'Get Preferred Language')]),
            (AI, NOT_BC, [(Q, 'Suggest Diagnosis'), (Q, 'Suggest Guidelines'), (Q, 'Propose Plan For Deviation')]),
        ],
        ul=[('Consultation', 'a guided visit in four steps'), ('Clinical Measurement', 'what the practitioner measures today'), ('Nutritional Diagnosis', 'a coded diagnosis with its rationale'), ('Active Targets', 'the reduced contract the patient sees'), ('Review Item', 'a signal waiting in the practitioner\'s inbox')],
        bd=['A closed assessment is immutable; a correction creates a new one', 'No plan without an active diagnosis', 'Overriding a proposal requires a reason', 'Every adjustment requires a reason; old versions are kept', 'Diagnosis and calculation basis are never an integration contract; only the patient record reads them', 'A review item never modifies the plan automatically'],
        assumptions=['Four guided steps cover a typical consultation', 'Practitioners accept AI suggestions only as a starting point', 'Patients need the result of the plan, not its procedure'],
        metrics=['Consultations published without leaving (%)', 'Suggestions accepted or edited (%)', 'Review items resolved per week'],
        questions=['Should patients see why a target changed?', 'Is one active diagnosis enough?', 'When should the baseline be refreshed?'],
    ),
    'iam': dict(
        name='Identity & Access Management (IAM)',
        purpose='Authenticate users and issue the role claim. People create an account as patient or practitioner, sign in, renew their session, recover their password and sign out. The role travels inside the session token, so no other context needs to ask who someone is.',
        cls=('Generic', 'Compliance', 'Commodity'),
        roles=['Gateway: the only entry point for credentials.', 'Issues the role claim that every other context trusts.'],
        inbound=[
            ('Patient and practitioner apps', '', [(C, 'Register Account'), (C, 'Sign In'), (C, 'Refresh Session'), (C, 'Reset Password'), (C, 'Sign Out'), (C, 'Set Preferred Language'), (Q, 'Get Navigation Shell'), (Q, 'Get User'), (Q, 'Get Sessions')]),
            (NC, OHS, [(Q, 'Is Practitioner'), (Q, 'Get Users By Id'), (Q, 'Get Preferred Language')]),
            (MA, OHS, [(Q, 'Get Users By Id'), (Q, 'Get Preferred Language')]),
            (IB, OHS, [(Q, 'Get Preferred Language')]),
            (CR, OHS, [(Q, 'Is Practitioner')]),
            (READ_MODELS, OHS, [(Q, 'Get Account Profile'), (Q, 'Get Users By Id')]),
        ],
        outbound=[
            (f'{CR}, {NC}, {IB}, {MA}', PL_CONF, ROLE_CLAIM),
        ],
        ul=[('User', 'an account with a role'), ('User Session', 'a signed-in period with its token'), ('Role Claim', 'patient or practitioner, carried in the token'), ('Navigation Shell', 'the set of screens that match the role'), ('Preferred Language', 'Spanish or English')],
        bd=['Email is unique; a strong password is required', 'The role is declared at registration', 'The role is immutable per session', 'Five failed attempts lock the account for 15 minutes', 'A reused refresh token ends the session', 'Registering grants access to nothing without a care link', 'Passwords are stored only as hashes'],
        assumptions=['One sign-in screen serves both roles', 'Owning the authentication is simpler than integrating a provider', 'A 15-minute lockout deters guessing without frustrating users'],
        metrics=['Sign-ins rejected as locked (%)', 'Sessions renewed without asking for credentials (%)', 'Password resets completed (%)'],
        questions=['Should practitioners sign in with a second factor?', 'Should a person hold both roles?', 'When should a session expire?'],
    ),
    'food-catalog': dict(
        name=FC,
        purpose='Translate external nutritional catalogs into the domain and keep them available locally. Patients and practitioners search foods by name, even offline, and practitioners can add the Peruvian dishes that external catalogs lack.',
        cls=('Generic', 'Cost reduction', 'Product'),
        roles=['Gateway: the only door to external catalogs.', 'Interchange: translates foreign taxonomies into the domain.'],
        inbound=[
            (PATIENT_APP, '', [(Q, 'Search Reference Foods'), (Q, 'Get Reference Food'), (Q, 'Get Local Food Catalog')]),
            (PRACTITIONER_APP, '', [(Q, 'Search Reference Foods'), (C, 'Create Local Override')]),
            ('Catalog import scheduler', '', [(C, 'Import Catalog Snapshot')]),
            (IB, CS, [(Q, 'Get Reference Foods By Id'), (Q, 'List Verified Foods'), (Q, 'Resolve Foods By Name'), (C, 'Create AI-Estimated Food')]),
        ],
        outbound=[
            ('Open Food Facts', ACL, [(Q, 'Search Products'), (Q, 'Import Catalog Snapshot')]),
            ('USDA FoodData Central', ACL, [(Q, 'Search Foods'), (Q, 'Import Catalog Snapshot')]),
        ],
        ul=[('Reference Food', 'a food with its nutrients per 100 g'), ('Local Override', 'a practitioner-added food that imports never overwrite'), ('Local Food Catalog', 'the copy kept on the patient\'s phone'), ('Source Hash', 'fingerprint used to detect upstream changes')],
        bd=['No external id enters the domain', 'Taxonomy translation is mandatory', 'The source hash is stored to detect upstream changes', 'Search falls back to the local cache offline', 'Local overrides are practitioner-only and permanent', 'An AI-estimated food is stored with its source marked as AI'],
        assumptions=['External catalogs miss most prepared Peruvian dishes', 'Local first search is fast enough for logging a meal', 'Two external sources cover most staple foods'],
        metrics=['Searches answered from the local catalog (%)', 'Searches with no result (%)', 'Local overrides created per month'],
        questions=['Who verifies foods estimated by the AI?', 'How often should snapshots be imported?', 'Should patients be able to suggest foods?'],
    ),
}


CSS = """
*{box-sizing:border-box;margin:0;padding:0}
body{position:relative;width:1920px;height:1080px;overflow:hidden;font-family:'Segoe UI','Open Sans',Arial,sans-serif;color:#000;background:#fff}
.canvas{position:absolute;inset:0;border:6px solid #000;display:grid;grid-template-columns:870px 607px 1fr;grid-template-rows:92px 192px 598px 1fr}
.cell{border:2px solid #000;padding:12px 18px;overflow:hidden}
h2{font-size:34px;font-weight:700;line-height:1.15;margin-bottom:8px}
.head{grid-column:1/4;display:flex;justify-content:space-between;align-items:center;padding:0 22px}
.head h1{font-size:44px}
.ver{font-size:20px;color:#555}
p,li{font-size:20px;line-height:1.35}
ul{list-style:none}
.purpose p{font-size:20px}
.cls{display:flex;gap:26px}
.cls div span{display:block;font-size:19px;color:#666}
.cls div b{font-size:27px}
.roles li{font-size:18px;margin-bottom:4px}
.row3{grid-column:1/4;display:grid;grid-template-columns:750px 520px 1fr;border:2px solid #000;position:relative}
.row3>.side{padding:12px 18px;overflow:hidden}
.center{border:2px solid #000;margin:14px 0;padding:12px 20px;overflow:hidden}
.center h2{font-size:32px}
.center ul li{font-size:16.5px;line-height:1.28;margin-bottom:4px}
.center .bd{margin-top:14px}
.grp{margin-bottom:7px}
.grp.inline{display:flex;align-items:center;gap:10px;flex-wrap:wrap}
.grp.inline .chips{margin-top:0}
.grp .who{font-size:18px;font-weight:700;line-height:1.25}
.grp .who i{font-weight:400;color:#555;font-style:normal}
.chips{display:flex;flex-wrap:wrap;gap:5px;margin-top:3px}
.chip{font-size:14.5px;padding:2px 8px;border-radius:3px;border:1.5px solid}
.command{background:#cfe3ff;border-color:#7ba7e6}
.query{background:#dcefb0;border-color:#9bc23f}
.event{background:#fbeaa6;border-color:#d6b73c}
.legend{font-size:14px;color:#555;margin-top:10px}
.legend .chip{font-size:13px;padding:1px 6px}
.small li{font-size:18px;margin-bottom:4px}
.row4 .cell h2{font-size:30px}
"""

CHECK_JS = """<script>
const r=[];document.querySelectorAll('.cell,.side,.center').forEach(el=>{
  const h=el.querySelector('h2'), name=h?h.textContent:el.className;
  const box=el.getBoundingClientRect();
  el.querySelectorAll('li,.grp,.legend,p,.cls').forEach(c=>{const b=c.getBoundingClientRect();
    if(b.bottom>box.bottom-2||b.right>box.right-2) r.push(name+': '+c.textContent.slice(0,40));});
});
const p=document.createElement('pre');p.id='OVERFLOW';p.textContent=r.join('\\n');document.body.appendChild(p);</script>"""


def e(t):
    return html.escape(t)


def groups(gs):
    out = []
    for who, rel, msgs in gs:
        r = f' <i>· {e(rel)}</i>' if rel else ''
        chips = ''.join(f'<span class="chip {t}">{e(m)}</span>' for t, m in msgs)
        inline = ' inline' if len(msgs) == 1 else ''  # un solo mensaje: va en la misma línea que el colaborador
        out.append(f'<div class="grp{inline}"><div class="who">{e(who)}{r}</div><div class="chips">{chips}</div></div>')
    return ''.join(out)


def page(d):
    ul = ''.join(f'<li><b>{e(t)}:</b> {e(x)}</li>' for t, x in d['ul'])
    bd = ''.join(f'<li>{e(x)}</li>' for x in d['bd'])
    lst = lambda xs: ''.join(f'<li>– {e(x)}</li>' for x in xs)
    roles = ''.join(f'<li>{e(x)}</li>' for x in d['roles'])
    dom, bm, ev = d['cls']
    return f"""<!doctype html><html><head><meta charset="utf-8"><style>{CSS}</style></head><body><div class="canvas">
<div class="cell head"><h1>Name: {e(d['name'])}</h1><span class="ver">V5 · github.com/ddd-crew/bounded-context-canvas</span></div>
<div class="cell purpose"><h2>Purpose</h2><p>{e(d['purpose'])}</p></div>
<div class="cell"><h2>Strategic Classification</h2><div class="cls"><div><span>Domain</span><b>{e(dom)}</b></div><div><span>Business Model</span><b>{e(bm)}</b></div><div><span>Evolution</span><b>{e(ev)}</b></div></div></div>
<div class="cell"><h2>Domain Roles</h2><ul class="roles">{roles}</ul></div>
<div class="row3">
<div class="side"><h2>Inbound Communication</h2>{groups(d['inbound'])}</div>
<div class="center"><h2>Ubiquitous Language</h2><ul>{ul}</ul><div class="bd"><h2>Business Decisions</h2><ul>{bd}</ul></div></div>
<div class="side"><h2>Outbound Communication</h2>{groups(d['outbound'])}<div class="legend">Messages: <span class="chip command">command</span> <span class="chip query">query</span> <span class="chip event">event</span></div></div>
</div>
<div class="cell small"><h2>Assumptions</h2><ul>{lst(d['assumptions'])}</ul></div>
<div class="cell small"><h2>Verification Metrics</h2><ul>{lst(d['metrics'])}</ul></div>
<div class="cell small"><h2>Open Questions</h2><ul>{lst(d['questions'])}</ul></div>
</div></body></html>"""


def check_symmetry():
    """Devuelve la lista de diferencias entre lo que un canvas envía y lo que el otro dice recibir."""
    bcs = {d['name'] if k != 'iam' else IAM for k, d in CONTEXTS.items()}
    own = {k: (d['name'] if k != 'iam' else IAM) for k, d in CONTEXTS.items()}

    def targets(who):
        return [p.strip() for p in who.split(',') if p.strip() in bcs]

    sent, received = set(), set()
    for k, d in CONTEXTS.items():
        me = own[k]
        for who, rel, msgs in d['outbound']:
            for t in targets(who):
                sent |= {(me, t, rel, ty, m) for ty, m in msgs}
        for who, rel, msgs in d['inbound']:
            for s in targets(who):
                received |= {(s, me, rel, ty, m) for ty, m in msgs}
    errors = [f'enviado sin recibir: {x}' for x in sorted(sent - received)]
    errors += [f'recibido sin enviar: {x}' for x in sorted(received - sent)]
    return errors


def find_chrome():
    for c in CHROME_CANDIDATES:
        if c and pathlib.Path(c).exists():
            return c
    sys.exit('No se encontró Chrome. Define la variable CHROME con su ruta.')


def chrome(exe, *args):
    return subprocess.run([exe, '--headless=new', '--no-sandbox', '--disable-gpu', '--hide-scrollbars',
                           '--window-size=1920,1080', *args], check=True, capture_output=True, text=True)


def main():
    errors = check_symmetry()
    if errors:
        sys.exit('Canvases inconsistentes:\n  ' + '\n  '.join(errors))
    exe = find_chrome()
    SRC.mkdir(parents=True, exist_ok=True)
    OUT.mkdir(parents=True, exist_ok=True)
    tmp = SRC / '_overflow_check.html'
    try:
        for key, d in CONTEXTS.items():
            h = page(d)
            tmp.write_text(h.replace('</body>', CHECK_JS + '</body>'), encoding='utf-8')
            dom = chrome(exe, '--dump-dom', tmp.as_uri()).stdout
            m = re.search(r'<pre id="OVERFLOW">(.*?)</pre>', dom, re.S)
            if m is None or m.group(1).strip():
                sys.exit(f'{key}: texto cortado\n{html.unescape(m.group(1)) if m else "sin resultado"}')
            f = SRC / f'{key}.html'
            f.write_text(h, encoding='utf-8')
            png = OUT / f'{key}.png'
            chrome(exe, f'--screenshot={png}', f.as_uri())
            print(png)
    finally:
        tmp.unlink(missing_ok=True)


if __name__ == '__main__':
    main()
