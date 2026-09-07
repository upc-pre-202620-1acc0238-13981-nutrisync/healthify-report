# CAPÍTULO II: REQUIREMENTS DEVELOPMENT AND SOFTWARE SOLUTION DESIGN

## 2.1. Competidores

### 2.1.1. Análisis competitivo

### 2.1.2. Estrategias y tácticas frente a competidores

## 2.2. Entrevistas

### 2.2.1. Diseño de entrevistas

### 2.2.2. Registro de entrevistas

### 2.2.3. Análisis de entrevistas

## 2.3. Needfinding

### 2.3.1. User Personas

### 2.3.2. User Task Matrix

### 2.3.3. User Journey Mapping

### 2.3.4. Empathy Mapping

### 2.3.5. Big Picture EventStorming

### 2.3.6. Ubiquitous Language

## 2.4. Requirements Specification

### 2.4.1. User Stories

| **Epic / Story ID** | **Title** | **Description** | **Acceptance Criteria** | **Related with (Epic ID)** |
| :--- | :--- | :--- | :--- | :--- |
| **EP01** | | | | |
| US01 | | | | |

<div style="page-break-after: always"></div>

### 2.4.2. Impact Mapping

<div style="page-break-after: always"></div>

### 2.4.3. Product Backlog

| **#Order** | **Uer Story ID** | **Title** | **Description** | **Story Points** <br>**(1/2/3/5/8)** |
| :--- | :--- | :--- | :--- | :--- |
| 1 | | | | |

## 2.5. Strategic-Level Domain-Driven Design

### 2.5.1. EventStorming

#### 2.5.1.1. Candidate Context Discovery

#### 2.5.1.2. Domain Message Flows Modeling

#### 2.5.1.3. Bounded Context Canvases

### 2.5.2. Context Mapping

### 2.5.3. Software Architecture

#### 2.5.3.1. Software Architecture Context Level Diagrams

#### 2.5.3.2. Software Architecture Container Level Diagrams

#### 2.5.3.3. Software Architecture Deployment Diagrams

## 2.6. Tactical-Level Domain-Driven Design

### 2.6.1. Bounded Context: Intake & Body Response

#### 2.6.1.1. Domain Layer

El bounded context **Intake & Body Response** (`Healthify.Platform.IntakeBodyResponse`) es el diario del paciente: registra lo que el paciente declara haber comido y lo que la báscula de su casa dice. Su Domain Layer contiene cuatro aggregate roots, un conjunto de value objects que hacen imposible representar un estado inválido, y cuatro abstracciones de repositorio. Un principio recorre toda la capa: **este contexto registra, no opina**; no existe atributo ni método que exprese cumplimiento, desviación, racha o penalización, porque comparar lo prescrito contra lo comido es responsabilidad de Monitoring & Adherence.

**Aggregates (Aggregate Roots)**

**`ActiveTargetsCache`** — La copia local que el paciente tiene del contrato publicado por el profesional: qué apuntar hoy. El paciente es la raíz del agregado (un caché por paciente, reemplazado en el sitio), lo que permite que la app funcione sin conectividad.

| Atributo | Tipo | Scope | Descripción |
|---|---|---|---|
| `PatientId` | `int` | `public get / private set` | Identidad del agregado; **es la clave primaria**. |
| `PlanVersion` | `int` | `public get / private set` | Versión del contrato cacheado. |
| `ValidFrom` | `DateTimeOffset` | `public get / private set` | Vigencia declarada por el contrato. |
| `EnergyKcal`, `ProteinG`, `CarbG`, `FatG` | `decimal` | `public get / private set` | Objetivos diarios. |
| `RefreshedAt` | `DateTimeOffset` | `public get / private set` | Momento del último refresco. |
| `Guidelines`, `Restrictions` | `IReadOnlyList<string>` | `public` (computada) | Texto libre; **este contexto no lo interpreta**. |

| Método | Scope | Descripción |
|---|---|---|
| `ActiveTargetsCache(RefreshActiveTargetsCacheCommand)` | `public` | Constructor; delega en `Apply`. |
| `Refresh(RefreshActiveTargetsCacheCommand)` | `public` | Reemplaza el caché cuando llega una versión más nueva del contrato. |
| `Apply(RefreshActiveTargetsCacheCommand)` | `private` | Valida versión y energía positivas, redondea y normaliza las listas. |

Las reglas *Published Contract Only* y *Diagnosis And Basis Never Cached* son **estructurales**: la clase no tiene campo alguno donde alojar un diagnóstico, un razonamiento clínico, una ecuación o un déficit, de modo que no hay dónde cachearlos ni por accidente.

**`DiaryEntry`** — Una cosa que el paciente dice que comió. Es el agregado central del contexto.

| Atributo | Tipo | Scope | Descripción |
|---|---|---|---|
| `Id` | `DiaryEntryId` | `public get / private set` | Identidad tipada. |
| `PatientId` | `int` | `public get / private set` | Referencia cross-context. |
| `LocalTimestamp` | `DateTime` | `public get / private set` | El reloj de pared que el paciente estaba leyendo. |
| `LocalUtcOffsetMinutes` | `int` | `public get / private set` | Offset declarado por el dispositivo. |
| `DeclaredLocalTimestamp` | `DateTimeOffset` | `public` (computada) | El momento reconstruido; **nunca reescrito por el servidor**. |
| `Provenance` | `Provenance` | `public get / private set` | `Photo`, `Manual` u `OffPlan`. |
| `PhotoRef` | `string?` | `public get / private set` | Referencia que el cliente posee; el servidor **nunca guarda bytes de imagen**. |
| `ProposedReferenceFoodId`, `ProposedPortionGrams`, `ProposedConfidence`, `ProposedEstimatedAt` | nullable | `public get / private set` | Proyección persistida del VO `ProposedEstimate`. |
| `ConfirmedReferenceFoodId`, `ConfirmedPortionGrams`, `ConfirmedAt` | nullable | `public get / private set` | Proyección persistida del VO `ConfirmedEstimate`. |
| `SyncState` | `SyncState` | `public get / private set` | `Pending`, `Synced` o `Conflicted`. |
| `ClientEntryId` | `Guid?` | `public get / private set` | Identificador generado por el dispositivo offline; **hace idempotente la sincronización**. |
| `LocalDate` | `DateOnly` | `public` (computada) | El día de calendario que el paciente vivía, no el del servidor. |

| Método | Scope | Reglas que aplica |
|---|---|---|
| `DiaryEntry(int, LocalTimestamp, Provenance, SyncState, string?, Guid?)` | `public` | *Local Timestamp Required*, *Provenance Required*. |
| `ProposeEstimate(ProposedEstimate)` | `public` | *Estimate Stored As Proposal Only*: una propuesta nunca llega después de que el paciente ya habló. |
| `ConfirmProposedEstimate()` | `public` | *Proposal Kept Alongside Confirmation*: deja intactas las columnas de la propuesta. |
| `AdjustProposedEstimate(int, decimal)` | `public` | Escribe la corrección **al lado** de la propuesta, nunca encima, para que el tamaño de la corrección sea visible. |
| `ConfirmDirectly(ConfirmedEstimate)` | `public` | Registro manual: lo tecleado es una confirmación desde el inicio. |
| `MarkSynchronized()` / `MarkConflicted()` | `public` | Transiciones de sincronización. |
| `ResolveWithLatest(int, decimal, DateTimeOffset) : bool` | `public` | *Last Write Wins* aplicado **sólo al estimado**; el momento declarado no es alcanzable desde aquí. |
| `StoreConfirmation(int, decimal)` | `private` | Construye el VO y lo aplana en columnas. |

**No existe método que elimine una entrada**, y esa ausencia es la aplicación de la regla *Diary Entry Cannot Be Deleted*: un diario que se puede podar no se puede interpretar.

**`SelfWeighIn`** — Una lectura de peso que el paciente tomó de sí mismo. No es una medición clínica y el contexto nunca pretende lo contrario: se toma sin supervisión, en una báscula desconocida, por eso el protocolo se declara junto a ella.

| Atributo | Tipo | Scope | Descripción |
|---|---|---|---|
| `Id` | `SelfWeighInId` | `public get / private set` | Identidad tipada. |
| `PatientId` | `int` | `public get / private set` | Referencia cross-context. |
| `ValueKg` | `decimal` | `public get / private set` | Lectura declarada. |
| `LocalTimestamp` / `LocalUtcOffsetMinutes` | `DateTime` / `int` | `public get / private set` | Mismo tratamiento que en `DiaryEntry`. |
| `ProtocolFastedState`, `ProtocolSameTimeOfDay`, `ProtocolSameScale` | `bool` | `public get / private set` | Proyección del VO `ProtocolCompliance`. |
| `FollowsProtocol` | `bool` | `public` (computada) | *Only Protocol Compliant Weigh Ins Smooth The Trend*. |

Regla *Excluded Weigh Ins Are Kept As Data*: una lectura fuera de protocolo se guarda completa; simplemente no suaviza la tendencia, y ésa es la totalidad de la consecuencia.

**`WeightTrend`** — La serie de peso suavizada del paciente; la unidad que este contexto publica sobre peso corporal. El paciente es la raíz.

| Atributo | Tipo | Scope | Descripción |
|---|---|---|---|
| `DefaultWindowSize` | `const int = 7` | `public` | Siete días absorben un ritmo semanal sin ocultar un cambio real. |
| `PatientId` | `int` | `public get / private set` | **Clave primaria**. |
| `WindowSize` | `int` | `public get / private set` | Largo de la media móvil. |
| `LastRecalculatedAt` | `DateTimeOffset` | `public get / private set` | Auditoría del cálculo. |
| `Points` | `IReadOnlyList<WeightTrendPoint>` | `public` (computada) | Serie suavizada, más antigua primero. |

| Método | Scope | Descripción |
|---|---|---|
| `WeightTrend(int patientId, int windowSize = DefaultWindowSize)` | `public` | Exige ventana positiva. |
| `Recalculate(IReadOnlyList<SelfWeighIn>) : IReadOnlyList<int>` | `public` | Corazón del agregado: separa las lecturas fuera de protocolo (y devuelve sus identificadores), agrupa por día tomando la última lectura de cada uno, calcula la media móvil de cola y **reconstruye la serie completa**. Se reconstruye en vez de anexarse porque una lectura tardía cambia los puntos a su alrededor. |

El filtrado vive **dentro** del agregado, que recibe todas las lecturas y devuelve las que excluyó, para que el servicio de aplicación no decida qué cuenta.

**Value Objects**

| Clase | Propósito | Reglas y miembros |
|---|---|---|
| `ProposedEstimate` | Lo que el estimador on-device cree que se comió; una propuesta, nunca un hecho. | `ReferenceFoodId > 0`, `PortionGrams > 0`, `Confidence`, `EstimatedAt`. |
| `ConfirmedEstimate` | Lo que el paciente dijo que comió. | No lleva confianza: el paciente no es un estimador probabilístico y adjuntarle un número inventaría una precisión que nadie reclamó. |
| `ProtocolCompliance` | Las tres condiciones que hacen comparable un autopesaje con el anterior. | `FastedState`, `SameTimeOfDay`, `SameScale`; `FollowsProtocol` exige las tres. |
| `WeightTrendPoint` | Un punto de la serie suavizada. | `Date : DateOnly`, `SmoothedValueKg > 0`. |
| `LocalTimestamp` | El único timestamp de la plataforma que el servidor no posee. | Tolera hasta 24 h de desfase futuro (los relojes de dispositivo derivan). |
| `Confidence` | Cuán seguro estaba el estimador, de 0 a 1. | *Confidence Always Attached*: un estimado sin ella es un número fingiendo ser una medición. |
| `WeightKg` | Peso corporal dentro del rango que un cuerpo humano puede ocupar. | `Minimum = 20`, `Maximum = 400`; atrapa un decimal mal tecleado, no juzga a la persona. |
| `Provenance` | Cómo llegó a existir una entrada. | `Photo`, `Manual`, `OffPlan`; la procedencia es parte de la lectura, no metadato. |
| `SyncState` | Dónde está una entrada entre dispositivo y servidor. | `Pending`, `Synced`, `Conflicted`. |
| `DiaryEntryId`, `SelfWeighInId` | Identidades tipadas. | `Value : int > 0`, `internal static FromRaw(int)`, operadores de conversión. |

**Commands (11)** — `RefreshActiveTargetsCacheCommand`, `LogMealByPhotoCommand`, `EstimatePortionCommand`, `ConfirmEstimateCommand`, `AdjustEstimateCommand`, `LogMealManuallyCommand`, `LogOffPlanMealCommand`, `RecordSelfWeighInCommand`, `RecalculateWeightTrendCommand`, `PendingDiaryEntry` y `SyncPendingEntriesCommand`. Nótese lo que `LogOffPlanMealCommand` **no** tiene: ni alimento, ni porción, ni razón, ni nota, porque pedirlos es lo que hace que la gente deje de declarar.

**Queries (6)** — `GetActiveTargetsByPatientIdQuery`, `GetDiaryEntriesByPatientIdQuery`, `GetDiaryEntryByIdQuery`, `GetWeightTrendByPatientIdQuery`, `GetPendingSyncQueueByPatientIdQuery` y `GetSelfWeighInsByPatientIdQuery`.

**Domain Events (12)** — Todos heredan de `DomainEventBase`. Cinco cruzan frontera hacia Monitoring & Adherence: `MealLogged`, `EstimateConfirmedByPatient`, `OffPlanEntryLogged`, `WeightTrendRecalculated` y `EntrySynchronized`. Los internos son `ActiveTargetsCacheRefreshed`, `EstimateProposed`, `EstimateAdjustedByPatient`, `SelfWeighInRecorded`, `SelfWeighInExcludedFromTrend`, `EntryQueuedOffline` y `SyncConflictResolved`. `EstimateProposed` es interno a propósito: una propuesta no es ingesta, y dejarla cruzar permitiría que la conjetura de un modelo se evaluara como si el paciente la hubiera dicho.

**Errors** — `enum IntakeError` con 20 valores, entre ellos `ReferenceFoodNotResolved`, `RetroactiveLoggingWindowExceeded`, `DuplicatedClientEntryId`, `LocalTimestampCannotBeRewritten` y `DiaryEntryCannotBeDeleted`. Léase la enumeración por lo que **falta**: no hay valor para "comida demasiado grande" ni "día que se quedó corto".

**Repositories (abstracciones)** — `IActiveTargetsCacheRepository`, `IDiaryEntryRepository`, `ISelfWeighInRepository` e `IWeightTrendRepository`, todas derivadas de `IBaseRepository<T>`. Destacan `FindByClientEntryIdAsync(Guid)`, que hace idempotente la sincronización, y `ListUnreconciledByPatientIdAsync(int)`, que alimenta la cola pendiente.

**Domain Services** — Ninguno. Este contexto no declara servicios de dominio propios; consume los ACL de Food Catalog y Care Relationship desde la capa de aplicación. El servidor **no ejecuta ningún modelo de visión**: la estimación de porciones corre en el dispositivo y llega ya calculada.

**Relaciones entre clases:** `DiaryEntry` compone `DiaryEntryId`, `Provenance` y `SyncState`, y agrega de forma reconstruida `ProposedEstimate` y `ConfirmedEstimate` (0..1 cada uno, derivados de columnas planas). `SelfWeighIn` compone `SelfWeighInId` y reconstruye `ProtocolCompliance`. `WeightTrend` agrega 0..* `WeightTrendPoint` y **depende** de `SelfWeighIn` sólo como parámetro de `Recalculate`, nunca por navegación. Los cuatro agregados son raíces independientes que se referencian entre sí por `PatientId` plano, respetando la regla de no navegar entre raíces de agregado.

#### 2.6.1.2. Interface Layer

La Interface Layer de Intake & Body Response expone el diario al cliente móvil del paciente y publica el contrato de sólo lectura que los demás bounded contexts consultan. **Los tres controllers están anotados con `[Authorize(Roles = "Patient")]`**: este diario lo escribe el paciente y nadie más.

**Controllers**

**`DiaryEntriesController`** — `[Route("api/v1/diary-entries")] [Tags("Intake and Body Response")]`. Recibe las escrituras del diario y traduce `Result<T, IntakeError>` a respuestas HTTP.

| Verbo / Ruta | Acción | Respuestas |
|---|---|---|
| `POST /photo-logs` | `LogMealByPhoto(LogMealByPhotoResource)` | 201 · 400 · 401 · 403 · 422 |
| `POST /manual-logs` | `LogMealManually(LogMealManuallyResource)` | 201 · 400 · 401 · 403 · 422 |
| `POST /off-plan-logs` | `LogOffPlanMeal(LogOffPlanMealResource)` | 201 · 400 · 401 · 403 · 422 |
| `POST /{diaryEntryId:int}/estimate-confirmation` | `ConfirmEstimate(int)` | 200 · 401 · 403 · 404 · 409 · 422 |
| `POST /{diaryEntryId:int}/estimate-adjustment` | `AdjustEstimate(int, AdjustEstimateResource)` | 200 · 401 · 403 · 404 · 409 · 422 |
| `POST /synchronization` | `SyncPendingEntries(SyncPendingEntriesResource)` | 200 `SyncOutcomeResource` · 401 · 403 |

Cuenta con el método privado `PatientWriteOnly()`. **No existe verbo `DELETE`** en este controller, y `Estimate Portion` **no tiene endpoint**: se alcanza únicamente desde la política interna del subflujo 4.2.

**`SelfWeighInsController`** — `[Route("api/v1/self-weigh-ins")]`. Un único `POST /` (`RecordSelfWeighIn(RecordSelfWeighInResource)`, respuestas 201 · 400 · 401 · 403). `Recalculate Weight Trend` tampoco tiene endpoint: lo dispara la política que escucha `SelfWeighInRecorded`.

**`PatientIntakeController`** — `[Route("api/v1/patients")]`. Sirve los cuatro read models del paciente. Métodos privados `IsSelf(int)` y `NotThisPatient()`.

| Verbo / Ruta | Acción | Read Model |
|---|---|---|
| `GET /{patientId:int}/active-targets` | `GetActiveTargets(int)` | My Daily Targets |
| `GET /{patientId:int}/diary-entries?date=` | `GetDiaryEntries(int, DateOnly?)` | Daily Diary |
| `GET /{patientId:int}/weight-trend` | `GetWeightTrend(int)` | Weight Trend Chart |
| `GET /{patientId:int}/pending-sync-queue` | `GetPendingSyncQueue(int)` | Pending Sync Queue |

La ruta lleva el `patientId` porque ésa es la forma del read model, pero **la identidad que se confía es siempre la del token**.

**Resources** — Las clases de entrada viven en `IntakeResources.cs` (`LogMealByPhotoResource`, `LogMealManuallyResource`, `LogOffPlanMealResource`, `AdjustEstimateResource`, `RecordSelfWeighInResource`, `PendingDiaryEntryResource`, `SyncPendingEntriesResource`) y las de salida en `IntakeReadResources.cs` (`ActiveTargetsResource`, `DiaryEntryResource`, `SelfWeighInResource`, `WeightTrendPointResource`, `WeightTrendResource`, `SyncedEntryOutcomeResource`, `SyncOutcomeResource`). `WeightTrendResource` **no tiene campo para la última lectura, ni para el peso de hoy, ni para el cambio desde la semana pasada**, aplicando la regla *Daily Figure Never Exposed As Headline*; `DiaryEntryResource` lleva siempre `Provenance` y `Confidence`, aplicando *Confidence And Provenance Always Exposed*.

**Transform / Assemblers** — `IntakeAssemblers.cs` reúne siete command assemblers (`LogMealByPhotoCommandAssembler`, `LogMealManuallyCommandAssembler`, `LogOffPlanMealCommandAssembler`, `ConfirmEstimateCommandAssembler`, `AdjustEstimateCommandAssembler`, `RecordSelfWeighInCommandAssembler`, `SyncPendingEntriesCommandAssembler`) y cinco resource assemblers (`ActiveTargetsResourceAssembler`, `DiaryEntryResourceAssembler`, `SelfWeighInResourceAssembler`, `WeightTrendResourceAssembler`, `SyncOutcomeResourceAssembler`). **Todo assembler toma el `patientId` de la sesión autenticada, nunca del payload.**

`IntakeActionResultAssembler.cs` concentra la traducción de errores a HTTP mediante `ToDiaryEntryResult`, `ToSelfWeighInResult`, `ToSyncResult`, `ToNotFoundResult` y el privado `FailureResult`:

| Errores | Status |
|---|---|
| `ActiveTargetsCacheNotFound`, `DiaryEntryNotFound`, `SelfWeighInNotFound`, `WeightTrendNotFound` | **404** |
| `PatientWriteOnly`, `ActiveCareLinkRequired` | **403** |
| `EstimateAlreadyConfirmed`, `DuplicatedClientEntryId`, `LocalTimestampCannotBeRewritten`, `DiaryEntryCannotBeDeleted` | **409** |
| `ProvenanceRequired`, `LocalTimestampRequired`, `ConfidenceRequired`, `ImplausibleWeightValue`, `ProtocolComplianceRequired`, `PublishedContractOnly` | **400** |
| `RetroactiveLoggingWindowExceeded`, `ReferenceFoodNotResolved`, `EstimateNotProposed` | **422** |
| `UnexpectedError` (por defecto) | **500** |

**ACL Contract** — `IIntakeContextFacade` declara los DTO `DailyIntakeSummaryItem`, `WeightTrendPointItem` y `DiaryEntryItem`, y tres operaciones: `GetDailyIntakeSummary(int, DateOnly)`, `GetWeightTrendPoints(int, int)` y `GetDiaryEntries(int, DateOnly)`. Es un contrato **de sólo lectura, sin excepción**: no hay método que otro contexto pudiera usar para escribir aquí, y esa ausencia es la aplicación de la regla. `DailyIntakeSummaryItem` no lleva cumplimiento ni veredicto alguno; su campo `HasAnyEntry` existe para que un consumidor distinga un día no registrado de un día registrado que sumó poco.

**Localización** — `IntakeBodyResponse/Resources/IntakeMessages.cs`, clase marcador de los archivos `.resx` (`en`, `es`).

#### 2.6.1.3. Application Layer

La Application Layer orquesta los seis subflujos del contexto (4.1 a 4.6) mediante command services, query services y tres event handlers que implementan las políticas. Las interfaces públicas viven en `Application/CommandServices` y `Application/QueryServices`; las implementaciones, en `Application/Internal/...`.

**Command Services**

**`ActiveTargetsCacheCommandService`** (implementa `IActiveTargetsCacheCommandService`) — Depende de `IActiveTargetsCacheRepository`, `IUnitOfWork`, `ICareRelationshipContextFacade`, `ILogger<...>` e `IMediator`. Su único método, `Handle(RefreshActiveTargetsCacheCommand)`, implementa el subflujo 4.1: valida *Published Contract Only*, exige un `CareLink` activo y, si el vínculo desapareció, **deja el caché existente exactamente como está** en lugar de borrarlo. Publica `ActiveTargetsCacheRefreshed`. Este servicio **nunca habla con Nutritional Care**: sólo ve lo que el evento publicado decidió llevar.

**`DiaryEntryCommandService`** (implementa `IDiaryEntryCommandService`) — Depende de `IDiaryEntryRepository`, `IUnitOfWork`, `IFoodCatalogContextFacade`, `IConfiguration`, `ILogger<...>` e `IMediator`; declara la constante `DefaultRetroactiveLoggingWindowHours = 48`.

| Método | Subflujo | Comportamiento |
|---|---|---|
| `Handle(LogMealByPhotoCommand)` | 4.2 | Valida confianza, alimento y porción; construye el `LocalTimestamp`; crea la entrada con `Provenance.Photo` y publica `MealLogged` con la propuesta a bordo. |
| `Handle(EstimatePortionCommand)` | 4.2 | Sólo desde la política. Resuelve el alimento vía el ACL de Food Catalog (*Food Resolved From Local Catalog*) y llama a `ProposeEstimate`. Publica `EstimateProposed`. |
| `Handle(ConfirmEstimateCommand)` | 4.2 | Guardas en orden: la entrada existe, pertenece al paciente, tiene propuesta y no está confirmada. Publica `EstimateConfirmedByPatient`. |
| `Handle(AdjustEstimateCommand)` | 4.2 | Mismas guardas más la resolución del alimento. Publica **ambos** eventos: `EstimateAdjustedByPatient` y `EstimateConfirmedByPatient`. |
| `Handle(LogMealManuallyCommand)` | 4.3 | Existe para que la foto no sea un punto único de fallo. Crea con `Provenance.Manual` y `ConfirmDirectly(...)`. |
| `Handle(LogOffPlanMealCommand)` | 4.4 | Deliberadamente el método más corto: nada pregunta qué se comió. Publica `MealLogged` y `OffPlanEntryLogged`. |
| `Handle(SyncPendingEntriesCommand)` | 4.6 | Reconcilia el lote encolado por el dispositivo offline. |

Sus métodos privados son `ReconcileAsync(int, PendingDiaryEntry, CT)` —el núcleo de la sincronización, que verifica propietario, exige que el `DeclaredLocalTimestamp` coincida exactamente y resuelve conflictos con `ResolveWithLatest`—, `MarkSynchronizedAsync(DiaryEntry, CT)` y `BuildLocalTimestamp(DateTimeOffset, out IntakeError)`, que aplica la ventana de registro retroactivo leída de `Intake:RetroactiveLoggingWindowHours`. Cada elemento del lote es su propio paso *committed*: eso lo hace idempotente elemento por elemento y evita que **el lote falle como un todo**, porque una entrada que el servidor no puede aceptar no debe llevarse por delante el resto de la semana del paciente.

**`SelfWeighInCommandService`** — Depende de `ISelfWeighInRepository`, `IUnitOfWork`, `ILogger<...>` e `IMediator`. `Handle(RecordSelfWeighInCommand)` (subflujo 4.5) valida el rango plausible de peso, construye `ProtocolCompliance` y publica `SelfWeighInRecorded`. **Nada aquí rechaza una lectura por ser inconveniente.**

**`WeightTrendCommandService`** — Depende de `IWeightTrendRepository`, `ISelfWeighInRepository`, `IUnitOfWork`, `ILogger<...>` e `IMediator`. `Handle(RecalculateWeightTrendCommand)` carga **todas** las lecturas, delega en `trend.Recalculate(...)`, hace commit y publica `WeightTrendRecalculated` más un `SelfWeighInExcludedFromTrend` por cada lectura excluida.

**Query Services** — `ActiveTargetsCacheQueryService`, `DiaryEntryQueryService`, `SelfWeighInQueryService` y `WeightTrendQueryService` resuelven las seis queries del dominio sin efectos secundarios.

**Event Handlers (políticas)** — Los tres crean un scope de DI aislado, porque las notificaciones se manejan en paralelo y compartir el `DbContext` del request produciría un error de concurrencia.

| Handler | Escucha | Política | Emite |
|---|---|---|---|
| `OnActiveTargetsUpdatedIntakeHandler` | `ActiveTargetsUpdated` (Nutritional Care) | *When Active Targets Updated* (4.1); es el único punto por el que algo de Nutritional Care entra a este contexto, y entra como evento publicado, no como consulta. | `RefreshActiveTargetsCacheCommand` |
| `OnMealLoggedPhotoEstimationHandler` | `MealLogged` (propio) | *When Meal Logged And Provenance Is Photo* (4.2). La guarda de procedencia es el disparador de la política misma. **No hace llamada de red ni alcanza ningún servicio de IA.** | `EstimatePortionCommand` |
| `OnSelfWeighInRecordedHandler` | `SelfWeighInRecorded` (propio) | *When Self Weigh In Recorded* (4.5). Corre para toda lectura, incluidas las de fuera de protocolo: es el agregado quien decide qué suaviza la tendencia. | `RecalculateWeightTrendCommand` |

**DTO de aplicación** — `SyncedEntryOutcome(Guid, int?, string, string?)` con las constantes `Created`, `AlreadyPresent`, `ConflictResolved` y `Rejected`, y `SyncOutcome(int, int, int, int, int, IReadOnlyList<SyncedEntryOutcome>)`, que resume el lote de sincronización.

**ACL Facade** — `IntakeContextFacade` implementa `IIntakeContextFacade` apoyándose en los query services y en `IFoodCatalogContextFacade`, con la constante `NutrientBasisGrams = 100m`. Los totales diarios **se calculan aquí, no se almacenan**, porque un total almacenado sería una segunda fuente de verdad; y **sólo se cuentan los estimados confirmados**, porque una propuesta sobre la que el paciente no ha hablado es la conjetura de un modelo. Una entrada cuyo alimento no se puede resolver conserva su identificador y pierde sólo la etiqueta.

#### 2.6.1.4. Infrastructure Layer

La Infrastructure Layer de este bounded context se limita a la persistencia: **no consume ningún servicio externo**, no ejecuta modelos de visión y no aloja hosted services. Las cuatro configuraciones de EF Core viven en `IntakeEntityTypeConfigurations.cs` y los cuatro repositorios en `IntakeRepositories.cs`.

**Configuraciones de EF Core**

| Clase | Tabla | Decisiones de mapeo |
|---|---|---|
| `ActiveTargetsCacheEntityTypeConfiguration` | `active_targets_caches` | `HasKey(c => c.PatientId)` con `ValueGeneratedNever()`, porque el paciente es la raíz. Objetivos como `decimal(10,2)`. `guidelines` y `restrictions` se persisten como columnas `json` a través de *backing fields*, con un `ValueComparer<List<string>>` estático: **sin él EF nunca detecta un cambio y las actualizaciones se pierden silenciosamente**. |
| `DiaryEntryEntityTypeConfiguration` | `diary_entries` | PK con converter `DiaryEntryId.FromRaw`. `local_timestamp` se mapea como tipo plano y **bajo ese nombre exacto**, porque el interceptor UTC compartido excluye las propiedades así llamadas y porque el diario se lee por rango de fechas. Cuatro columnas de propuesta (con `proposed_confidence` como `decimal(6,4)`) y tres de confirmación coexisten, y esa coexistencia es la totalidad de *Proposal Kept Alongside Confirmation*. `client_entry_id` lleva **índice único** `ix_diary_entries_client_entry_id` y es nullable: MySQL admite cualquier cantidad de `NULL` en un índice único, que es exactamente el comportamiento deseado. |
| `SelfWeighInEntityTypeConfiguration` | `self_weigh_ins` | PK con converter `SelfWeighInId.FromRaw`; `value_kg` como `decimal(10,2)`; las tres banderas de protocolo requeridas; índice `ix_self_weigh_ins_patient_id`. |
| `WeightTrendEntityTypeConfiguration` | `weight_trends` | `HasKey(t => t.PatientId)` con `ValueGeneratedNever()`. La serie `points` se persiste como `json` desde el backing field `_points`, con el comparador estático `PointListComparer`. |

Las cuatro configuraciones declaran `Ignore(...)` sobre cada propiedad calculada (`DeclaredLocalTimestamp`, `LocalDate`, `ProposedEstimate`, `ConfirmedEstimate`, `FollowsProtocol`, `Points`, entre otras), que existen en el dominio pero no son columnas.

**Repositorios (implementaciones)**

| Clase | Detalles de implementación |
|---|---|
| `ActiveTargetsCacheRepository` | Implementa `FindByPatientIdAsync`; como el paciente es la clave, buscar por identificador y buscar por paciente son la misma operación. |
| `DiaryEntryRepository` | Declara los campos `private static readonly SyncState PendingState` y `ConflictedState`, comparados a través del converter porque **EF no puede traducir un acceso a miembro de un tipo convertido**. `ListByPatientIdAsync` filtra sobre el reloj de pared local y ordena descendente; `FindByClientEntryIdAsync` rechaza `Guid.Empty`; `ListUnreconciledByPatientIdAsync` filtra `Pending` o `Conflicted`. **Nada aquí sobrescribe ni llama al `Remove` heredado.** |
| `SelfWeighInRepository` | `ListByPatientIdAsync` devuelve **todas** las lecturas ordenadas ascendentemente: el agregado decide qué cuenta, así que hay que entregárselo todo. |
| `WeightTrendRepository` | `FindByPatientIdAsync` sobre la clave primaria del paciente. |

Los cuatro heredan de `BaseRepository<T>` y reimplementan explícitamente `IBaseRepository<T>.FindByIdAsync` para que las llamadas a través de la interfaz alcancen la versión especializada por identidad tipada. La persistencia corre sobre **MySQL 8** con convención `snake_case`, auditoría automática mediante `AuditableEntityInterceptor` y normalización a UTC mediante `UtcDateTimeInterceptor`, del que `local_timestamp` está deliberadamente exceptuado.

**Servicios externos** — Ninguno. La estimación de porciones se ejecuta en el dispositivo del paciente con ML Kit; el servidor sólo persiste la propuesta que recibe.

#### 2.6.1.5. Bounded Context Software Architecture Component Level Diagrams

**Intake & Body Response**

Component:

![Intake & Body Response Component](https://www.plantuml.com/plantuml/proxy?fmt=svg&src=https://raw.githubusercontent.com/upc-pre-202620-1acc0238-13981-nutrisync/healthify-report/develop/docs/c4-diagrams/intake-body-response.puml)

#### 2.6.1.6. Bounded Context Software Architecture Code Level Diagrams

#### 2.6.1.6.1. Bounded Context Domain Layer Class Diagrams

**Intake & Body Response**

Domain:

![Intake & Body Response Domain](https://www.plantuml.com/plantuml/proxy?fmt=svg&src=https://raw.githubusercontent.com/upc-pre-202620-1acc0238-13981-nutrisync/healthify-report/develop/docs/class-diagrams/backend/intake-body-response/domain.puml)

Infrastructure:

![Intake & Body Response Infrastructure](https://www.plantuml.com/plantuml/proxy?fmt=svg&src=https://raw.githubusercontent.com/upc-pre-202620-1acc0238-13981-nutrisync/healthify-report/develop/docs/class-diagrams/backend/intake-body-response/infrastructure.puml)

Application:

![Intake & Body Response Application](https://www.plantuml.com/plantuml/proxy?fmt=svg&src=https://raw.githubusercontent.com/upc-pre-202620-1acc0238-13981-nutrisync/healthify-report/develop/docs/class-diagrams/backend/intake-body-response/application.puml)

Interfaces:

![Intake & Body Response Interfaces](https://www.plantuml.com/plantuml/proxy?fmt=svg&src=https://raw.githubusercontent.com/upc-pre-202620-1acc0238-13981-nutrisync/healthify-report/develop/docs/class-diagrams/backend/intake-body-response/interfaces.puml)

#### 2.6.1.6.2. Bounded Context Database Design Diagram

**Intake & Body Response**

Database:

![Intake & Body Response Database](https://www.plantuml.com/plantuml/proxy?fmt=svg&src=https://raw.githubusercontent.com/upc-pre-202620-1acc0238-13981-nutrisync/healthify-report/develop/docs/database-diagrams/intake-body-response.puml)

