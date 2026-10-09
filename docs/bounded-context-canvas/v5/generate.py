"""Genera los Bounded Context Canvas (versión V5 de ddd-crew) como HTML y los exporta a PNG con Chrome.

Uso:  python docs/bounded-context-canvas/v5/generate.py
Salida: assets/img/artifacts/bounded-context-canvas/<contexto>.png (1920 x 1080)
"""
import html
import pathlib
import subprocess

ROOT = pathlib.Path(__file__).resolve().parents[3]
OUT = ROOT / 'assets' / 'img' / 'artifacts' / 'bounded-context-canvas'
SRC = pathlib.Path(__file__).resolve().parent / 'html'
CHROME = r'C:\Program Files\Google\Chrome\Application\chrome.exe'

C, Q, E = 'command', 'query', 'event'

CONTEXTS = {
    'intake-body-response': dict(
        name='Intake & Body Response',
        purpose='Capture faithfully what the patient eats and how their body responds, without judging it. Patients log meals (by photo or by hand) and weigh-ins with little effort, even offline; practitioners read trustworthy data between visits through read models.',
        cls=('Core', 'Engagement', 'Custom built'),
        roles=['Execution: records meals and weigh-ins.', 'Draft: a photo estimate is a proposal until the patient confirms it.'],
        inbound=[
            ('Patient app (REST)', '', [(C, 'Log Meal By Photo'), (C, 'Log Meal Manually'), (C, 'Confirm / Adjust Estimate'), (C, 'Record Self Weigh-In'), (C, 'Sync Pending Entries'), (Q, 'Get Diary Entries'), (Q, 'Get Weight Trend')]),
            ('Nutritional Care', 'Published Language', [(E, 'Active Targets Updated')]),
            ('Monitoring & Adherence', 'Customer/Supplier', [(Q, 'Get Diary Entries For Day'), (Q, 'Get Weight Trend')]),
            ('Read Models', 'Open Host Service', [(Q, 'Get Intake Facts For Patient Record')]),
        ],
        outbound=[
            ('Monitoring & Adherence', 'Customer/Supplier', [(E, 'Meal Logged'), (E, 'Estimate Confirmed By Patient'), (E, 'Weight Trend Recalculated'), (E, 'Entry Synchronized')]),
            ('Care Relationship', 'Open Host Service', [(Q, 'Is Care Link Active')]),
            ('Food Catalog', 'Customer/Supplier', [(Q, 'Search Reference Foods'), (Q, 'Resolve Foods By Name'), (C, 'Create AI-Estimated Food')]),
            ('AI module (Shared)', 'technical', [(Q, 'Recognize Meal Photo')]),
        ],
        ul=[('Diary Entry', 'a meal record; never deleted'), ('Provenance', 'how an entry was captured (photo or manual)'), ('Proposed Estimate', 'what the AI thinks was eaten; a proposal, never a fact'), ('Self Weigh-In', 'a weight recorded following the protocol'), ('Weight Trend', 'the smoothed series; the daily value is never a headline')],
        bd=['A diary entry is never deleted', 'Provenance and local timestamp are mandatory', 'A photo estimate is stored as a proposal with its confidence', 'Declaring plan adherence carries no penalty', 'Only protocol-compliant weigh-ins smooth the trend', 'Offline entries are synced idempotently'],
        assumptions=['Patients keep logging when declaring costs them almost nothing', 'A photo estimate is close enough to confirm or adjust in one step', 'Practitioners trust the trend more than any single day'],
        metrics=['Estimates confirmed without adjustment (%)', 'Days logged per patient per week', 'Offline entries synced without duplicates (%)'],
        questions=['Is a 48 h retroactive window enough?', 'Should AI-estimated foods carry a mark?', 'Who owns the weigh-in protocol?'],
    ),
    'monitoring-adherence': dict(
        name='Monitoring & Adherence',
        purpose='Compare what was prescribed with what was actually logged and interpret the difference over time. It tells patients how their day went, raises a signal when a pattern needs attention, and keeps the practitioner in charge of every decision.',
        cls=('Core', 'Engagement', 'Custom built'),
        roles=['Analysis: turns logged data into compliance and signals.', 'Specification: evaluates against rules and thresholds.'],
        inbound=[
            ('Care Relationship', 'Open Host Service', [(E, 'Care Link Established'), (E, 'Care Link Revoked'), (E, 'AI Processing Consent Changed')]),
            ('Nutritional Care', 'Events', [(E, 'Active Targets Updated'), (E, 'Clinical Measurement Taken'), (E, 'Consultation Completed')]),
            ('Intake & Body Response', 'Customer/Supplier', [(E, 'Meal Logged'), (E, 'Estimate Confirmed By Patient'), (E, 'Weight Trend Recalculated'), (E, 'Entry Synchronized')]),
            ('Practitioner app (REST)', '', [(C, 'Schedule Follow-Up'), (C, 'Reschedule / Cancel Follow-Up'), (C, 'Record Referral'), (Q, 'Get Monitoring Panel'), (Q, 'Get Monitoring Summary')]),
            ('Patient app (REST)', '', [(C, 'Submit Pre-Visit Check-In'), (Q, 'Get Daily Compliance'), (Q, 'Get Consistency Index'), (Q, 'Get Weekly Summary')]),
        ],
        outbound=[
            ('Nutritional Care', 'Events only', [(E, 'Sustained Deviation Detected'), (E, 'Alert Escalated To Practitioner')]),
            ('Intake & Body Response', 'Customer/Supplier', [(Q, 'Get Diary Entries For Day'), (Q, 'Get Weight Trend')]),
            ('Care Relationship', 'Open Host Service', [(Q, 'Is Care Link Active')]),
            ('AI module (Shared)', 'technical', [(Q, 'Generate Weekly Summary'), (Q, 'Suggest Check-In Questions'), (Q, 'Summarize Monitoring')]),
        ],
        ul=[('Evaluation Window', 'the days over which a patient is judged'), ('Daily Compliance', 'met, exceeded or short against that day\'s targets'), ('Deviation', 'a sustained gap from the prescribed targets'), ('Logging Gap', 'days without records; never a deviation'), ('Consistency Index', 'a signal of unreliable records, shown to the patient first')],
        bd=['Each day is evaluated against that day\'s targets snapshot', 'No deviation is computed under a 7-day window', 'A deviation is sustained only if it persists across the window', 'A logging gap never escalates', 'Consistency alerts prompt the patient first; escalation only after 3 weeks', 'A signal notifies; it never modifies the plan'],
        assumptions=['Seven days are enough to tell a deviation from noise', 'Patients check a consistency prompt before the practitioner sees it', 'Practitioners prefer few, well-evidenced signals'],
        metrics=['Signals resolved without plan change (%)', 'Prompts acknowledged by the patient (%)', 'Days evaluated per active patient'],
        questions=['Is three weeks the right time to escalate?', 'How long should a missed visit stay open?', 'Should check-ins ever raise a signal?'],
    ),
    'care-relationship': dict(
        name='Care Relationship',
        purpose='Decide who can see whom and under which consent. A practitioner invites a patient; the patient grants, withdraws or moves their consent; the relationship closes when treatment ends. Every other context asks this one before touching patient data.',
        cls=('Supporting', 'Compliance', 'Custom built'),
        roles=['Gateway: gates access to patient data.', 'Enforcer: keeps the practitioner/patient asymmetry.'],
        inbound=[
            ('Practitioner app (REST)', '', [(C, 'Issue Invitation'), (C, 'Discharge Patient'), (Q, 'Get Patient Roster')]),
            ('Patient app (REST)', '', [(C, 'Redeem Invitation'), (C, 'Grant Consent'), (C, 'Withdraw Consent'), (C, 'Set AI Processing Consent'), (C, 'Acknowledge Active Targets'), (Q, 'Get Active Care Link')]),
            ('Nutritional Care', 'Events only', [(E, 'Active Targets Updated')]),
            ('Nutritional Care, Intake, Monitoring', 'Open Host Service', [(Q, 'Is Care Link Active')]),
            ('IAM', 'Conformist', [(Q, 'Role claim (session token)')]),
        ],
        outbound=[
            ('Monitoring & Adherence', 'Events', [(E, 'Care Link Established'), (E, 'Care Link Revoked'), (E, 'Treatment Discharged')]),
            ('Intake, Monitoring, Nutritional Care', 'Events', [(E, 'AI Processing Consent Changed')]),
        ],
        ul=[('Invitation', 'single-use code that starts a link'), ('Care Link', 'the relationship between one patient and one practitioner'), ('Consent', 'the patient\'s permission to share data'), ('Discharge', 'clinical closure of the link'), ('Targets Pending Acknowledgement', 'new targets the patient has not yet read')],
        bd=['Invitations are single use and expire', 'A patient cannot link themselves', 'A link starts inactive until consent is granted', 'Consent is always revocable, with no justification', 'A patient can switch practitioner only by confirming it', 'A discharged link is never reactivated'],
        assumptions=['Patients link with one practitioner at a time', 'A QR code is the easiest way to link during a visit', 'Withdrawing consent must also switch off AI'],
        metrics=['Invitations redeemed before expiring (%)', 'Links with consent granted (%)', 'Consent withdrawals per month'],
        questions=['Should a practitioner be able to revoke a link?', 'How long are discharged links kept?', 'Can two practitioners share a patient?'],
    ),
    'nutritional-care': dict(
        name='Nutritional Care',
        purpose='Support the complete clinical act: assessment, diagnosis, prescription and plan adjustment between visits. The practitioner runs a guided consultation, publishes a plan, and reviews the signals that arrive between visits.',
        cls=('Supporting', 'Compliance', 'Custom built'),
        roles=['Execution: carries out the clinical act.', 'Specification: publishes the Active Targets contract.'],
        inbound=[
            ('Practitioner app (REST)', '', [(C, 'Record Baseline'), (C, 'Start Consultation'), (C, 'Take Clinical Measurement'), (C, 'Issue Diagnosis'), (C, 'Prescribe Targets'), (C, 'Publish Nutrition Plan'), (C, 'Resolve Review Item'), (Q, 'Get Review Inbox')]),
            ('Patient app (REST)', '', [(Q, 'Get Active Targets'), (Q, 'Get Plan Versions')]),
            ('Monitoring & Adherence', 'Events only', [(E, 'Sustained Deviation Detected'), (E, 'Alert Escalated To Practitioner')]),
            ('Care Relationship', 'Open Host Service', [(Q, 'Is Care Link Active')]),
            ('IAM', 'Conformist', [(Q, 'Role claim (session token)')]),
        ],
        outbound=[
            ('Intake, Monitoring, Care Relationship', 'Published Language', [(E, 'Active Targets Updated')]),
            ('Monitoring & Adherence', 'Events', [(E, 'Clinical Measurement Taken'), (E, 'Consultation Completed')]),
            ('AI module (Shared)', 'technical', [(Q, 'Suggest Diagnosis'), (Q, 'Suggest Guidelines'), (Q, 'Propose Plan For Deviation')]),
        ],
        ul=[('Consultation', 'a guided visit in four steps'), ('Clinical Measurement', 'what the practitioner measures today'), ('Nutritional Diagnosis', 'a coded diagnosis with its rationale'), ('Active Targets', 'the reduced contract the patient sees'), ('Review Item', 'a signal waiting in the practitioner\'s inbox')],
        bd=['A closed assessment is immutable; a correction creates a new one', 'No plan without an active diagnosis', 'Overriding a proposal requires a reason', 'Every adjustment requires a reason; old versions are kept', 'Diagnosis and calculation basis never leave the context', 'A review item never modifies the plan automatically'],
        assumptions=['Four guided steps cover a typical consultation', 'Practitioners accept AI suggestions only as a starting point', 'Patients need the result of the plan, not its procedure'],
        metrics=['Consultations published without leaving (%)', 'Suggestions accepted or edited (%)', 'Review items resolved per week'],
        questions=['Should patients see why a target changed?', 'Is one active diagnosis enough?', 'When should the baseline be refreshed?'],
    ),
    'iam': dict(
        name='Identity & Access Management (IAM)',
        purpose='Authenticate users and issue the role claim. People create an account as patient or practitioner, sign in, renew their session and sign out. The role travels inside the session token, so no other context needs to ask who someone is.',
        cls=('Generic', 'Compliance', 'Commodity'),
        roles=['Gateway: the only entry point for credentials.', 'Issues the role claim that every other context trusts.'],
        inbound=[
            ('Patient and practitioner apps (REST)', '', [(C, 'Register Account'), (C, 'Sign In'), (C, 'Refresh Session'), (C, 'Sign Out'), (C, 'Set Preferred Language'), (Q, 'Get Navigation Shell'), (Q, 'Get User')]),
            ('Other contexts', 'Open Host Service', [(Q, 'Is Patient'), (Q, 'Is Practitioner'), (Q, 'Get User By Id')]),
        ],
        outbound=[
            ('Other contexts', 'Conformist', [(Q, 'Role claim (session token)')]),
        ],
        ul=[('User', 'an account with a role'), ('User Session', 'a signed-in period with its token'), ('Role Claim', 'patient or practitioner, carried in the token'), ('Navigation Shell', 'the set of screens that match the role'), ('Preferred Language', 'Spanish or English')],
        bd=['Email is unique; a strong password is required', 'The role is declared at registration', 'The role is immutable per session', 'Five failed attempts lock the account for 15 minutes', 'Registering grants access to nothing without a care link', 'Passwords are stored only as hashes'],
        assumptions=['One sign-in screen serves both roles', 'Owning the authentication is simpler than integrating a provider', 'A 15-minute lockout deters guessing without frustrating users'],
        metrics=['Sign-ins rejected as locked (%)', 'Sessions renewed without asking for credentials (%)', 'Registrations completed per role'],
        questions=['Is password recovery needed before launch?', 'Should a person hold both roles?', 'When should a session expire?'],
    ),
    'food-catalog': dict(
        name='Food Catalog',
        purpose='Translate external nutritional catalogs into the domain and keep them available locally. Patients and practitioners search foods by name, even offline, and practitioners can add the Peruvian dishes that external catalogs lack.',
        cls=('Generic', 'Cost reduction', 'Product'),
        roles=['Gateway: the only door to external catalogs.', 'Interchange: translates foreign taxonomies into the domain.'],
        inbound=[
            ('Patient app (REST)', '', [(Q, 'Search Reference Foods'), (Q, 'Get Local Food Catalog')]),
            ('Practitioner app (REST)', '', [(Q, 'Search Reference Foods'), (C, 'Create Local Override')]),
            ('Intake & Body Response', 'Customer/Supplier', [(Q, 'Search Reference Foods'), (Q, 'Resolve Foods By Name'), (C, 'Create AI-Estimated Food')]),
        ],
        outbound=[
            ('Open Food Facts', 'Anticorruption Layer', [(Q, 'Search Products'), (Q, 'Import Catalog Snapshot')]),
            ('USDA FoodData Central', 'Anticorruption Layer', [(Q, 'Search Foods'), (Q, 'Import Catalog Snapshot')]),
        ],
        ul=[('Reference Food', 'a food with its nutrients per 100 g'), ('Local Override', 'a practitioner-added food that imports never overwrite'), ('Local Food Catalog', 'the copy kept on the patient\'s phone'), ('Source Hash', 'fingerprint used to detect upstream changes')],
        bd=['No external id enters the domain', 'Taxonomy translation is mandatory', 'The source hash is stored to detect upstream changes', 'Search falls back to the local cache offline', 'Local overrides are practitioner-only and permanent', 'An AI-estimated food is stored like any other food'],
        assumptions=['External catalogs miss most prepared Peruvian dishes', 'Local first search is fast enough for logging a meal', 'Two external sources cover most staple foods'],
        metrics=['Searches answered from the local catalog (%)', 'Searches with no result (%)', 'Local overrides created per month'],
        questions=['Who verifies foods estimated by the AI?', 'How often should snapshots be imported?', 'Should patients be able to suggest foods?'],
    ),
}

CSS = """
*{box-sizing:border-box;margin:0;padding:0}
body{width:1920px;height:1080px;font-family:'Segoe UI','Open Sans',Arial,sans-serif;color:#000;background:#fff}
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
.row3{grid-column:1/4;display:grid;grid-template-columns:690px 540px 1fr;border:2px solid #000;position:relative}
.row3>.side{padding:12px 18px;overflow:hidden}
.center{border:2px solid #000;margin:14px 0;padding:12px 20px;overflow:hidden}
.center h2{font-size:32px}
.center ul li{font-size:17px;line-height:1.3;margin-bottom:5px}
.center .bd{margin-top:14px}
.grp{margin-bottom:9px}
.grp .who{font-size:19px;font-weight:700}
.grp .who i{font-weight:400;color:#555;font-style:normal}
.chips{display:flex;flex-wrap:wrap;gap:6px;margin-top:4px}
.chip{font-size:15.5px;padding:3px 9px;border-radius:3px;border:1.5px solid}
.command{background:#cfe3ff;border-color:#7ba7e6}
.query{background:#dcefb0;border-color:#9bc23f}
.event{background:#fbeaa6;border-color:#d6b73c}
.legend{font-size:14px;color:#555;margin-top:2px}
.small li{font-size:18px;margin-bottom:4px}
.row4 .cell h2{font-size:30px}
"""


def e(t):
    return html.escape(t)


def groups(gs):
    out = []
    for who, rel, msgs in gs:
        r = f' <i>· {e(rel)}</i>' if rel else ''
        chips = ''.join(f'<span class="chip {t}">{e(m)}</span>' for t, m in msgs)
        out.append(f'<div class="grp"><div class="who">{e(who)}{r}</div><div class="chips">{chips}</div></div>')
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
<div class="side"><h2>Inbound Communication</h2>{groups(d['inbound'])}<div class="legend">Messages: command · query · event</div></div>
<div class="center"><h2>Ubiquitous Language</h2><ul>{ul}</ul><div class="bd"><h2>Business Decisions</h2><ul>{bd}</ul></div></div>
<div class="side"><h2>Outbound Communication</h2>{groups(d['outbound'])}</div>
</div>
<div class="cell small"><h2>Assumptions</h2><ul>{lst(d['assumptions'])}</ul></div>
<div class="cell small"><h2>Verification Metrics</h2><ul>{lst(d['metrics'])}</ul></div>
<div class="cell small"><h2>Open Questions</h2><ul>{lst(d['questions'])}</ul></div>
</div></body></html>"""


def main():
    SRC.mkdir(parents=True, exist_ok=True)
    OUT.mkdir(parents=True, exist_ok=True)
    for key, d in CONTEXTS.items():
        f = SRC / f'{key}.html'
        f.write_text(page(d), encoding='utf-8')
        png = OUT / f'{key}.png'
        subprocess.run([CHROME, '--headless=new', '--disable-gpu', '--hide-scrollbars', '--window-size=1920,1080',
                        f'--screenshot={png}', f.as_uri()], check=True, capture_output=True)
        print(png)


if __name__ == '__main__':
    main()
