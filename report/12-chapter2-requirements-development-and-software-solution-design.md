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

### 2.6.2. Bounded Context: Monitoring & Adherence

#### 2.6.2.1. Domain Layer

**Monitoring & Adherence** (`Healthify.Platform.MonitoringAdherence`) es el único bounded context que pone lo prescrito al lado de lo registrado: interpreta. Su Domain Layer aloja cinco aggregate roots y concentra **toda** la lógica de interpretación dentro de ellos, sin domain services. Tres invariantes gobiernan la capa: ninguna desviación se evalúa sobre una ventana de menos de siete días; al paciente se le pregunta antes de que al profesional se le diga; y una señal escalada nunca modifica un plan.

**Aggregates (Aggregate Roots)**

**`EvaluationWindow`** — El periodo sobre el que se compara lo prescrito contra lo registrado. Una ventana por relación de cuidado: abre cuando se establece el vínculo y cierra cuando se revoca. Sostiene tres series que deliberadamente nunca se mezclan entre sí.

| Atributo | Tipo | Scope | Descripción |
|---|---|---|---|
| `MinimumDays` | `const int = 7` | `public` | **Invariante 1.** El largo configurado puede ser mayor, nunca menor. |
| `Id` | `WindowId` | `public get / private set` | Identidad tipada. |
| `PatientId` / `CareLinkId` | `int` | `public get / private set` | Referencias cross-context. |
| `WindowDays` | `int` | `public get / private set` | Largo configurado con el que abrió, guardado en la fila para que un cambio de configuración no reinterprete una ventana en curso. |
| `FromDate` / `ToDate` | `DateTime` | `public get / private set` | Extremos de la ventana, almacenados a medianoche. |
| `State` | `WindowState` | `public get / private set` | `Open` o `Closed`. |
| `LastLoggingGapFlaggedOn`, `LastPatientRemindedAt` | nullable | `public get / private set` | Para que la política del hueco de registro lo diga una vez y no cada doce horas. |
| `TargetsSnapshots` | `IReadOnlyList<TargetsSnapshot>` | `public` (computada) | Todo snapshot recibido, del más antiguo al más nuevo. **Nada se elimina.** |
| `DailyComplianceSeries` | `IReadOnlyList<DailyCompliance>` | `public` (computada) | El resultado día a día. |
| `AnthropometrySeries` | `IReadOnlyList<AnthropometryPoint>` | `public` (computada) | **Las lecturas caseras del paciente no están aquí y nunca lo estarán.** |
| `IntakeSummary` | `IntakeSummary` | `public` (computada) | Calculado, nunca almacenado, así que no puede discrepar con la serie que resume. |

| Método | Scope | Reglas que aplica |
|---|---|---|
| `EvaluationWindow(OpenEvaluationWindowCommand, int, DateOnly)` | `public` | *Minimum Seven Day Window*. |
| `TakeSnapshot(TargetsSnapshot) : bool` | `public` | *Later Adjustment Never Rewrites Evaluated Days*: **anexa y no toca la serie diaria**. Devuelve `false` si esa versión ya es el snapshot vigente. |
| `SnapshotInForceOn(DateOnly) : TargetsSnapshot?` | `public` | *Each Day Evaluated Against That Day Snapshot*. |
| `AppendAnthropometryPoint(AnthropometryPoint) : bool` | `public` | *Clinical Measurement Outranks Self Weigh In*, *Two Series Never Merged*; el tipo del parámetro **es** la aplicación de la regla. |
| `RecordDayEvaluation(DailyCompliance) : bool` | `public` | *Late Entry Re Evaluates Its Own Day Only*: un día entra y un día sale. |
| `MarkUnloggedDaysBefore(DateOnly) : IReadOnlyList<DailyCompliance>` | `public` | *Day Without Entries Marked Unlogged Not Non Compliant*: rellena el silencio para que la serie muestre los huecos en vez de ocultarlos. |
| `CountingThrough(DateOnly) : DateOnly`, `SpanDays(DateOnly) : int`, `HasMinimumSpan(DateOnly) : bool` | `public` | *Closed Window Stops Counting Days* e **invariante 1**, satisfecho por paso del tiempo y no por aritmética. |
| `HorizonDays(DateOnly) : IReadOnlyList<DailyCompliance>` | `public` | Horizonte rodante sobre el que se juzga una desviación. |
| `FlagLoggingGap(DateOnly) : bool` | `public` | *Gap Is Not A Deviation*, *Gap Never Escalates*: **las tres reglas se mantienen por lo que este método no hace**, que es escribir una fecha y nada más. |
| `RemindPatient() : bool` | `public` | *Reminder Is Local And Non Accusatory*. |
| `Close(DateTimeOffset)` | `public` | *Evaluated Data Is Preserved*: nada se borra y nada se recalcula. |

**`Deviation`** — Una distancia entre lo prescrito y lo registrado, suficientemente grande y suficientemente repetida como para merecer un nombre.

| Atributo | Tipo | Scope | Descripción |
|---|---|---|---|
| `Id` | `DeviationId` | `public get / private set` | Identidad tipada. |
| `WindowRef` | `WindowId` | `public get / private set` | La ventana de la que se leyó. |
| `PatientId` | `int` | `public get / private set` | Copiado de la ventana para responder el read model. |
| `MagnitudeRelativeValue`, `MagnitudeEnergyKcal` | `decimal` | `public get / private set` | Proyección de `DeviationMagnitude`. |
| `Direction` | `DeviationDirection` | `public get / private set` | `Above` o `Below`. |
| `IsSustained` / `SustainedAt` | `bool` / `DateTimeOffset?` | `public get / private set` | *Sustained If Persists Across Majority Of Window*. |
| `LoggedDaysConsidered`, `DeviatingDaysConsidered` | `int` | `public get / private set` | Los dos conteos con los que se decidió la mayoría, guardados para que la evidencia enviada al inbox no se recalcule desde una ventana que ya se movió. |

| Método | Scope | Descripción |
|---|---|---|
| `Deviation(WindowId, int, DeviationMagnitude, DeviationDirection, int, int)` | `public` | *Only Logged Days Count*. |
| `DetectFrom(WindowId, int, IReadOnlyList<DailyCompliance>) : Deviation?` | `public static` | **Factory con las reglas dentro**: descarta días no registrados, separa desviaciones por encima y por debajo y **devuelve `null` si están empatadas**, porque reportar la mayor de dos tendencias opuestas sería leer un patrón en el ruido. |
| `Restate(DeviationMagnitude, int, int) : bool` | `public` | Re-enuncia la misma desviación sobre un horizonte que se movió; devuelve `false` si nada cambió. |
| `MarkSustained(decimal) : bool` | `public` | Devuelve `true` **sólo en la transición**, así la señal cruza la frontera exactamente una vez. |
| `Evidence() : string` | `public` | Una frase para el inbox clínico: **evidencia, no veredicto**. |

**`ConsistencyIndex`** — Cuán bien concuerdan entre sí la serie de peso y la serie de ingesta registrada. El paciente es la raíz.

| Atributo | Tipo | Scope | Descripción |
|---|---|---|---|
| `EnergyKcalPerKg` | `const decimal = 7700m` | `public` | Regla de dedo, igual para todos; por eso sirve como chequeo de consistencia y no como predicción. |
| `PatientId` | `int` | `public get / private set` | **Clave primaria.** |
| `Value` | `decimal` | `public get / private set` | Movimiento de peso inexplicado, en kg por semana. |
| `State` | `ConsistencyState` | `public get / private set` | `Normal`, `Watch` o `Alert`. |
| `FirstFlaggedAt`, `ShownToPatientAt`, `EscalatedAt`, `AlertSinceAt` | `DateTimeOffset?` | `public get / private set` | La cronología del episodio; `ShownToPatientAt` es **precondición de la escalación**. |

| Método | Scope | Descripción |
|---|---|---|
| `Recompute(weightSeries, intakeSeries, decimal) : bool` | `public` | Calcula el cambio observado frente al implicado por la ingesta registrada **sobre el periodo compartido por ambas series**; devuelve `true` sólo cuando el índice acaba de entrar en `Alert`. |
| `CanCompute(weightSeries, intakeSeries) : bool` | `public static` | *Both Series Required*. |
| `PromptPatient() : bool` | `public` | *Patient First Always*, *Prompt Date Recorded*. |
| `ThreeWeeksInAlertElapsed(int, DateTimeOffset) : bool` | `public` | Las reglas de la escalación, preguntadas como una sola. |
| `Escalate() : bool` | `public` | **Lanza si `ShownToPatientAt` es `null`.** Está en el agregado y no en un servicio, de modo que ningún llamador puede saltárselo. |
| `NextState(decimal) : string` / `MoveTo(string) : bool` | `private` | Un umbral no configurado se lee siempre como `Normal`; al volver a `Normal` se limpian las tres fechas para que un episodio posterior se mida desde su propio inicio **y se le pregunte al paciente otra vez**. |

**`Referral`** — El profesional enviando al paciente a otra persona. Atributos: `Id : ReferralId`, `PatientId`, `Specialty`, `Reason`, `IssuedBy`, `IssuedAt`. **No tiene estado ni método que lo cambie**: una derivación es el registro de que algo se decidió en una fecha, no un flujo de trabajo que esta plataforma gestione.

**`ScheduledFollowUp`** — La próxima visita en el calendario. Atributos: `Id : FollowUpId`, `PatientId`, `PractitionerId`, `ScheduledFor`, `State : FollowUpState`, `MissedAt`. Su constructor exige fecha futura y su único método de transición, `MarkMissed(DateTimeOffset) : bool`, **escribe un estado y una fecha en esta fila y no alcanza nada más**: alguien que no pudo ir el martes sigue siendo paciente de alguien el miércoles.

**Value Objects**

| Clase | Propósito | Reglas y miembros |
|---|---|---|
| `TargetsSnapshot` | Los números diarios prescritos tal como estaban en un momento, congelados. | `PlanVersion > 0`, `EnergyKcal > 0`, macros, `TakenAt`, `EffectiveFrom`. Lo que **no** está aquí es el punto: ni diagnóstico, ni razonamiento, ni base de cálculo. |
| `DailyCompliance` | Cómo se vio un día al poner la ingesta registrada al lado de los objetivos en vigor ese día. | Constantes `Met`, `Exceeded`, `Short`, `Unlogged`; `ToleranceRatio = 0.10m`; factory `Evaluate(...)` que **usa si el diario tiene algo en absoluto, nunca los totales**; `SaysTheSameAs(...)` para idempotencia. |
| `AnthropometryPoint` | Un punto de la serie de peso **clínica**. | `Source` con exactamente un valor legal, `ClinicalMeasurement`, y factory `FromClinicalMeasurement(...)`: ésa es la aplicación de *Two Series Never Merged*. |
| `IntakeSummary` | Lo que la ventana ha visto hasta ahora, sumado. | Días registrados y no registrados **se cuentan por separado y nunca se suman**. |
| `DeviationDirection` | Hacia dónde va una desviación. | `Above`, `Below`; ninguno es un veredicto: describen una dirección en una recta numérica. |
| `DeviationMagnitude` | Qué tan grande es, en fracción del objetivo y en kcal. | `RelativeValue ≥ 0`, `AbsoluteEnergyKcal ≥ 0`. Ninguna es una nota. |
| `ConsistencyState` | Dónde está el índice. | `Normal`, `Watch`, `Alert`: una afirmación sobre datos, no sobre carácter. |
| `WindowState`, `FollowUpState` | Estados de ventana y de visita. | `Open`/`Closed`; `Scheduled`/`Completed`/`Missed`. |
| `Specialty`, `ReferralReason` | Destino y motivo de una derivación. | Texto libre (120 y 1000 caracteres): una lista cerrada sería una taxonomía clínica que esta plataforma no tiene por qué poseer. |
| `WindowId`, `DeviationId`, `ReferralId`, `FollowUpId` | Identidades tipadas. | `Value : int > 0`, `internal static FromRaw(int)`. |

**Commands (16)** — Desde `OpenEvaluationWindowCommand` y `SnapshotActiveTargetsCommand` hasta `CloseEvaluationWindowCommand`. **Sólo dos tienen endpoint** (`RecordReferralCommand` y `ScheduleFollowUpCommand`): este contexto es casi enteramente reactivo, lo mueven eventos y el paso del tiempo. `ReEvaluateWindowCommand` lleva **una** fecha, y no hay forma de pedir un rango.

**Queries (10)** — Siete alimentan read models (Patient Monitoring Panel, Daily Compliance Indicator, Consistency Card, Practitioner Agenda, entre otros) y tres son entrada de las políticas temporales: `GetOpenEvaluationWindowsQuery`, `GetEscalatableConsistencyIndicesQuery` y `GetOverdueScheduledFollowUpsQuery`.

**Domain Events (17)** — Sólo dos cruzan frontera, ambos hacia Nutritional Care: `SustainedDeviationDetected` y `AlertEscalatedToPractitioner`, y ninguno lleva objetivo, ajuste ni instrucción en el payload, porque lo que espera al otro extremo es una persona decidiendo. `LoggingGapDetected` y `FollowUpMissed` son internos y **ningún otro contexto se suscribe a ellos**: así se mantienen las reglas de que un hueco nunca escala y una visita perdida no cierra el vínculo.

**Errors** — `enum MonitoringError` con 19 valores. Léase por lo que falta: no hay valor para un paciente que "lo hizo mal". Este contexto reporta que no pudo interpretar algo; nunca reporta a una persona.

**Repositories (abstracciones)** — `IEvaluationWindowRepository`, `IDeviationRepository`, `IConsistencyIndexRepository`, `IReferralRepository` e `IScheduledFollowUpRepository`. Destaca `FindLatestByWindowAndDirectionAsync`, sin el cual la misma tendencia produciría una fila nueva en cada comida. **Nada en este contexto llama al `Remove` heredado.**

**Relaciones entre clases:** `EvaluationWindow` compone `WindowId` y `WindowState`, y agrega 0..* `TargetsSnapshot`, 0..* `DailyCompliance` y 0..* `AnthropometryPoint` (tres series independientes serializadas como JSON). `Deviation` referencia la ventana por `WindowRef : WindowId` —asociación por identificador, sin navegación— y compone `DeviationMagnitude` y `DeviationDirection`. `ConsistencyIndex` compone `ConsistencyState` y **depende** de `DailyCompliance` y de los puntos de tendencia sólo como parámetros de `Recompute`. `Referral` compone `Specialty` y `ReferralReason`; `ScheduledFollowUp` compone `FollowUpState`.

#### 2.6.2.2. Interface Layer

La Interface Layer de Monitoring & Adherence es notablemente pequeña en escritura y rica en lectura, porque el contexto es reactivo: de sus dieciséis comandos sólo dos se exponen como endpoint. Los tres controllers reflejan en la API el principio *Patient First Always*.

**Controllers**

**`PatientMonitoringController`** — `[Route("api/v1/patients")] [Authorize] [Tags("Monitoring and Adherence")]`. Depende de los cuatro query services de lectura y de `IStringLocalizer<MonitoringMessages>`.

| Verbo / Ruta | Acción | Rol | Read Model |
|---|---|---|---|
| `GET /{patientId:int}/evaluation-windows` | `GetEvaluationWindows(int)` | Ambos participantes | Patient Monitoring Panel |
| `GET /{patientId:int}/evaluation-windows/current` | `GetCurrentEvaluationWindow(int)` | Ambos participantes | Patient Monitoring Panel |
| `GET /{patientId:int}/daily-compliance?date=` | `GetDailyCompliance(int, DateOnly?)` | `Patient` | Daily Compliance Indicator |
| `GET /{patientId:int}/deviations` | `GetDeviations(int)` | `Practitioner` | Patient Monitoring Panel, desviaciones |
| `GET /{patientId:int}/consistency-index` | `GetConsistencyIndex(int)` | `Patient` | Consistency Card |
| `GET /{patientId:int}/referrals` | `GetReferrals(int)` | Ambos participantes | Patient Record, derivaciones |

Nótese la **asimetría de roles**: el paciente ve su indicador diario y su tarjeta de consistencia; el profesional ve las desviaciones.

**`ReferralsController`** — `[Route("api/v1/referrals")] [Authorize(Roles = "Practitioner")]`. Un único `POST /` (`RecordReferral(RecordReferralResource)`, respuestas 201 · 400 · 401 · 403).

**`ScheduledFollowUpsController`** — `[Route("api/v1/scheduled-follow-ups")] [Authorize(Roles = "Practitioner")]`. Expone `POST /` (`ScheduleFollowUp(ScheduleFollowUpResource)`) y `GET /api/v1/practitioners/{practitionerId:int}/scheduled-follow-ups` (`GetPractitionerAgenda(int)`, read model **Practitioner Agenda**, con ruta absoluta que sobrescribe la de clase). `Flag Missed Follow Up` **no tiene endpoint**: lo emite la política temporal.

**Resources** — `MonitoringResources.cs` contiene las clases de entrada `RecordReferralResource` y `ScheduleFollowUpResource`, con `[Required]` en sus campos. `MonitoringReadResources.cs` contiene las de salida: `DailyComplianceResource`, `TargetsSnapshotResource`, `AnthropometryPointResource`, `IntakeSummaryResource`, `EvaluationWindowResource`, `DeviationResource`, `ConsistencyIndexResource`, `ReferralResource` y `ScheduledFollowUpResource`.

**Transform / Assemblers** — `MonitoringAssemblers.cs` reúne dos command assemblers (`RecordReferralCommandAssembler`, `ScheduleFollowUpCommandAssembler`) y siete resource assemblers (`DailyComplianceResourceAssembler`, `TargetsSnapshotResourceAssembler`, `AnthropometryPointResourceAssembler`, `EvaluationWindowResourceAssembler`, `DeviationResourceAssembler`, `ConsistencyIndexResourceAssembler`, `ReferralResourceAssembler`, `ScheduledFollowUpResourceAssembler`). `MonitoringActionResultAssembler.cs` expone `ToReferralResult`, `ToScheduledFollowUpResult`, `ToNotFoundResult` y el privado `FailureResult`, y es el **único lugar** donde `MonitoringError` se convierte en un código HTTP:

| Errores | Status |
|---|---|
| `EvaluationWindowNotFound`, `DeviationNotFound`, `ScheduledFollowUpNotFound` | **404** |
| `ActiveCareLinkRequired` | **403** |
| `PatientAlreadyHasOpenWindow`, `PatientAlreadyHasActiveScheduledFollowUp`, `WindowClosed`, `ClosedWindowCannotBeReopened`, `DayAlreadyEvaluated` | **409** |
| `SpecialtyAndReasonRequired`, `WindowShorterThanMinimum` | **400** |
| `TargetsSnapshotMissing`, `InsufficientWindowLength`, `NoLoggedDays`, `BothSeriesRequired`, `ConsistencyThresholdNotConfigured`, `PatientPromptRequiredBeforeEscalation`, `ThreeWeeksInAlertRequired` | **422** |
| `UnexpectedError` (por defecto) | **500** |

**ACL Contract** — `IMonitoringContextFacade` declara los DTO `DailyComplianceItem`, `ConsistencyStateItem`, `AnthropometryPointItem` y `ReferralItem`, y las operaciones `GetDailyComplianceSeries`, `GetConsistencyState`, `GetAnthropometrySeries`, `GetAnthropometrySeriesPoints` y `GetReferrals`. Es **de sólo lectura, sin excepción**: este contexto es el que interpreta, y la interpretación no es algo que otro contexto pueda pedir. Obsérvese qué **no** se publica: no hay desviación en el contrato ni cadena de evidencia; ésas cruzan la frontera como eventos, una vez, cuando son sostenidas, y aterrizan en un inbox humano —una query que las devolviera bajo demanda sería un segundo camino, más silencioso, de una señal a una decisión clínica. `ConsistencyStateItem` lleva las dos fechas porque **el orden en que ocurrieron es el invariante**: un read model que mostrara la escalación sin el prompt estaría mostrando vigilancia.

**Localización** — `MonitoringAdherence/Resources/MonitoringMessages.cs`. Aquí vive el tono del recordatorio y del prompt al paciente, que es **el único lugar donde un tono puede vivir**.

#### 2.6.2.3. Application Layer

La Application Layer de este contexto orquesta once subflujos (5.1 a 5.11) y aloja **el mayor número de event handlers de la plataforma**: trece políticas, de las cuales nueve reaccionan a eventos de otros bounded contexts. Es aquí donde se evidencian los capabilities del contexto: evaluar días, detectar y sostener desviaciones, calcular el índice de consistencia, preguntar al paciente, escalar al profesional, detectar huecos de registro y gestionar derivaciones y citas.

**Command Services**

**`EvaluationWindowCommandService`** — Depende de `IEvaluationWindowRepository`, **`IIntakeContextFacade`**, `IUnitOfWork`, `IConfiguration`, `ILogger<...>` e `IMediator`. **Es la única clase de la plataforma que pone lo prescrito al lado de lo registrado**: lee el lado registrado a través del contrato publicado del contexto que lo posee y el lado prescrito desde los snapshots que la ventana tomó en su momento. Ningún lado se escribe desde aquí.

| Método | Subflujo | Comportamiento |
|---|---|---|
| `Handle(OpenEvaluationWindowCommand)` | 5.1 | *Minimum Seven Day Window* y *One Open Window Per Patient*. Publica `EvaluationWindowOpened`. |
| `Handle(SnapshotActiveTargetsCommand)` | 5.2 | Construye el `TargetsSnapshot` y lo anexa dejando la serie diaria en paz. Publica `TargetsSnapshotTaken`. |
| `Handle(AppendAnthropometryPointCommand)` | 5.3 | Añade el punto clínico. Publica `AnthropometryPointAppended`. |
| `Handle(EvaluateDayCommand)` | 5.4 | Delega en `EvaluateSingleDay(..., isReEvaluation: false, ...)`. |
| `Handle(ReEvaluateWindowCommand)` | 5.5 | Delega en `EvaluateSingleDay(..., isReEvaluation: true, ...)`. |
| `Handle(FlagLoggingGapCommand)` | 5.9 | Umbral `Monitoring:LoggingGapThresholdDays` (3 por defecto). Publica `LoggingGapDetected`. **Nada aquí alcanza el agregado `Deviation` ni el índice de consistencia.** |
| `Handle(RemindPatientCommand)` | 5.9 | Publica `PatientReminded`. |
| `Handle(CloseEvaluationWindowCommand)` | 5.11 | Publica `EvaluationWindowClosed`. |

Su método privado clave, `EvaluateSingleDay(int, DateOnly, bool, CT)`, resuelve la ventana abierta, toma **los objetivos que estaban en vigor el día evaluado** (no los de ahora), consulta el resumen de ingesta por el ACL, construye el `DailyCompliance` usando `HasAnyEntry` y nunca los totales, rellena los días no registrados **sólo fuera de la ruta de re-evaluación**, y publica los eventos correspondientes.

**`DeviationCommandService`** — Depende de `IDeviationRepository`, `IEvaluationWindowRepository`, `IUnitOfWork`, `IConfiguration`, `ILogger<...>` e `IMediator`. `Handle(DetectDeviationCommand)` exige `HasMinimumSpan` (invariante 1), toma el horizonte rodante, delega en `Deviation.DetectFrom(...)` y, si ya existe una desviación en esa ventana y dirección, la **re-enuncia** en vez de duplicarla. `Handle(FlagSustainedDeviationCommand)` aplica el ratio configurable `Monitoring:SustainedDeviationRatio` (0.5 por defecto) y publica `SustainedDeviationDetected` sólo en la transición.

**`ConsistencyIndexCommandService`** — Depende de `IConsistencyIndexRepository`, `IEvaluationWindowRepository`, `IIntakeContextFacade`, `ICareRelationshipContextFacade`, `IUnitOfWork`, `IConfiguration`, `ILogger<...>` e `IMediator`; constante `TrendDays = 90`. **Invariante 3: esta clase no importa, no inyecta y no alcanza nada relacionado con planes.**

| Método | Subflujo | Comportamiento |
|---|---|---|
| `Handle(RecomputeConsistencyIndexCommand)` | 5.7 | Toma la tendencia suavizada de 90 días vía ACL y la serie diaria de la ventana; publica `ConsistencyIndexRecomputed` siempre y `ConsistencyAlertRaised` sólo al entrar en `Alert`. |
| `Handle(PromptPatientCommand)` | 5.7 | *Patient First Always*, *Prompt Date Recorded*. Publica `PatientPromptedAboutConsistency`. |
| `Handle(EscalateToPractitionerCommand)` | 5.8 | Guardas en orden: umbral configurado, paciente ya informado, tres semanas en alerta y `CareLink` activo. Publica `AlertEscalatedToPractitioner`. |

La guarda del paciente informado se comprueba aquí para dar una respuesta con nombre **y se aplica otra vez dentro del agregado** para que ningún otro llamador pueda saltársela.

**`ReferralCommandService`** y **`ScheduledFollowUpCommandService`** — Ambos dependen del ACL de Care Relationship y exigen vínculo activo. El primero registra derivaciones (*Specialty And Reason Required*); el segundo programa visitas (*One Active Scheduled Visit Per Patient*) y marca las perdidas desde la política temporal.

**Query Services** — `EvaluationWindowQueryService`, `DeviationQueryService`, `ConsistencyIndexQueryService`, `ReferralQueryService` y `ScheduledFollowUpQueryService`.

**Event Handlers (políticas)** — Trece clases, todas con scope de DI aislado:

| Handler | Escucha | Origen | Emite |
|---|---|---|---|
| `OnCareLinkEstablishedHandler` | `CareLinkEstablished` | Care Relationship | `OpenEvaluationWindowCommand` |
| `OnActiveTargetsUpdatedMonitoringHandler` | `ActiveTargetsUpdated` | Nutritional Care | `SnapshotActiveTargetsCommand` |
| `OnClinicalMeasurementTakenHandler` | `ClinicalMeasurementTaken` | Nutritional Care | `AppendAnthropometryPointCommand` |
| `OnMealLoggedHandler` | `MealLogged` | Intake & Body Response | `EvaluateDayCommand` |
| `OnEstimateConfirmedByPatientHandler` | `EstimateConfirmedByPatient` | Intake & Body Response | `EvaluateDayCommand` |
| `OnOffPlanEntryLoggedHandler` | `OffPlanEntryLogged` | Intake & Body Response | `EvaluateDayCommand` |
| `OnEntrySynchronizedHandler` | `EntrySynchronized` | Intake & Body Response | `ReEvaluateWindowCommand` (una sola fecha) |
| `OnWeightTrendRecalculatedHandler` | `WeightTrendRecalculated` | Intake & Body Response | `RecomputeConsistencyIndexCommand` |
| `OnCareLinkRevokedHandler` | `CareLinkRevoked` | Care Relationship | `CloseEvaluationWindowCommand` |
| `OnDayEvaluatedHandler` | `DayEvaluated` | Interno | `DetectDeviationCommand` |
| `OnDeviationDetectedHandler` | `DeviationDetected` | Interno | `FlagSustainedDeviationCommand` |
| `OnConsistencyAlertRaisedHandler` | `ConsistencyAlertRaised` | Interno | `PromptPatientCommand` — **el único suscriptor, y le pregunta al paciente** |
| `OnLoggingGapDetectedHandler` | `LoggingGapDetected` | Interno | `RemindPatientCommand` — **el único suscriptor** |

Los tres handlers de entradas de diario comparten un método auxiliar que emite `EvaluateDayCommand(patientId, date)`, donde `date` es **el día de calendario que el paciente estaba viviendo**, tomado del timestamp local declarado en el evento y nunca del reloj del servidor.

**ACL Facade** — `MonitoringContextFacade` implementa `IMonitoringContextFacade` apoyándose exclusivamente en los query services propios, con degradación elegante: `null` o lista vacía, nunca una excepción propagada.

#### 2.6.2.4. Infrastructure Layer

La Infrastructure Layer de Monitoring & Adherence contiene la persistencia sobre MySQL 8 y **tres `BackgroundService`**, más que cualquier otro bounded context de la plataforma, porque tres de sus políticas no las dispara ni un usuario ni un evento, sino el paso del tiempo. No consume servicios externos de terceros.

**Configuraciones de EF Core** — Las cinco viven en `MonitoringEntityTypeConfigurations.cs`.

| Clase | Tabla | Decisiones de mapeo |
|---|---|---|
| `EvaluationWindowEntityTypeConfiguration` | `evaluation_windows` | PK con converter `WindowId.FromRaw`; índices `ix_evaluation_windows_patient_id` e `ix_evaluation_windows_state` (este último lo usa la política temporal). **Tres columnas `json`** —`targets_snapshots`, `daily_compliance_series` y `anthropometry_series`— mapeadas desde sus backing fields, **cada una con su propio `ValueComparer` estático**, sin el cual EF nunca detectaría un cambio. Nueve `Ignore` sobre las propiedades calculadas. |
| `DeviationEntityTypeConfiguration` | `deviations` | PK con converter `DeviationId.FromRaw`; `window_id` con converter e índice; `magnitude_relative_value` como `decimal(10,4)` y `magnitude_energy_kcal` como `decimal(10,2)`; los dos conteos con los que se decidió la mayoría. `Ignore(Magnitude)`. |
| `ConsistencyIndexEntityTypeConfiguration` | `consistency_indices` | `HasKey(i => i.PatientId)` con `ValueGeneratedNever()`; `value` como `decimal(12,4)`; `state` con converter e índice `ix_consistency_indices_state`; las cuatro fechas del episodio. |
| `ReferralEntityTypeConfiguration` | `referrals` | PK con converter `ReferralId.FromRaw`; `specialty` y `reason` con las longitudes máximas declaradas en los propios value objects. |
| `ScheduledFollowUpEntityTypeConfiguration` | `scheduled_follow_ups` | PK con converter `FollowUpId.FromRaw`; índices sobre `patient_id` y `practitioner_id`; `state` con converter. |

**Repositorios (implementaciones)** — Las cinco clases de `MonitoringRepositories.cs` heredan de `BaseRepository<T>`, sobrescriben `FindByIdAsync` con la identidad tipada y reimplementan explícitamente `IBaseRepository<T>.FindByIdAsync`. Los estados y direcciones se comparan contra **instancias estáticas de value object**, porque EF Core no puede traducir a SQL un acceso a miembro de un tipo convertido. Ninguna de ellas usa el `Remove` heredado, lo que hace estructural la regla *Evaluated Data Is Preserved*.

**Scheduling — Hosted Services** — Los tres siguen las cinco guardas obligatorias del proyecto (cuerpo del ciclo dentro de `try/catch`, servicios *scoped* resueltos en un scope propio, propagación del `stoppingToken`, ciclo idempotente y migraciones ya aplicadas antes del arranque), usan `PeriodicTimer` con el método privado `SafeWaitAsync` y declaran `BatchSize = 200`.

| Hosted Service | Política implementada | Intervalo (configuración) | Flujo |
|---|---|---|---|
| `LoggingGapDetectionHostedService` | *When N Days Without Diary Entry* (5.9) | `Scheduling:LoggingGapIntervalHours`, 12 h por defecto | Lista las ventanas abiertas y emite un `FlagLoggingGapCommand` por cada una. |
| `ConsistencyEscalationHostedService` | *When Consistency Alert Sustained Three Weeks* (5.8) | `Scheduling:ConsistencyEscalationIntervalHours`, 24 h por defecto | Calcula el corte a partir de `Monitoring:ConsistencyEscalationWeeks` (3 por defecto) y emite un `EscalateToPractitionerCommand` por índice escalable. |
| `MissedFollowUpHostedService` | *When Scheduled Date Passed Without Visit* (5.10) | `Scheduling:MissedFollowUpIntervalHours`, 12 h por defecto | Lista las visitas vencidas y emite un `FlagMissedFollowUpCommand` por cada una. |

**Servicios externos** — Ninguno. Todo el cálculo de este contexto es aritmética local sobre datos que ya posee o que lee por los ACL de Intake & Body Response y Care Relationship.

#### 2.6.2.5. Bounded Context Software Architecture Component Level Diagrams

**Monitoring & Adherence**

Component:

![Monitoring & Adherence Component](https://www.plantuml.com/plantuml/proxy?fmt=svg&src=https://raw.githubusercontent.com/upc-pre-202620-1acc0238-13981-nutrisync/healthify-report/develop/docs/c4-diagrams/monitoring-adherence.puml)

#### 2.6.2.6. Bounded Context Software Architecture Code Level Diagrams

#### 2.6.2.6.1. Bounded Context Domain Layer Class Diagrams

**Monitoring & Adherence**

Domain:

![Monitoring & Adherence Domain](https://www.plantuml.com/plantuml/proxy?fmt=svg&src=https://raw.githubusercontent.com/upc-pre-202620-1acc0238-13981-nutrisync/healthify-report/develop/docs/class-diagrams/backend/monitoring-adherence/domain.puml)

Infrastructure:

![Monitoring & Adherence Infrastructure](https://www.plantuml.com/plantuml/proxy?fmt=svg&src=https://raw.githubusercontent.com/upc-pre-202620-1acc0238-13981-nutrisync/healthify-report/develop/docs/class-diagrams/backend/monitoring-adherence/infrastructure.puml)

Application:

![Monitoring & Adherence Application](https://www.plantuml.com/plantuml/proxy?fmt=svg&src=https://raw.githubusercontent.com/upc-pre-202620-1acc0238-13981-nutrisync/healthify-report/develop/docs/class-diagrams/backend/monitoring-adherence/application.puml)

Interfaces:

![Monitoring & Adherence Interfaces](https://www.plantuml.com/plantuml/proxy?fmt=svg&src=https://raw.githubusercontent.com/upc-pre-202620-1acc0238-13981-nutrisync/healthify-report/develop/docs/class-diagrams/backend/monitoring-adherence/interfaces.puml)

#### 2.6.2.6.2. Bounded Context Database Design Diagram

**Monitoring & Adherence**

Database:

![Monitoring & Adherence Database](https://www.plantuml.com/plantuml/proxy?fmt=svg&src=https://raw.githubusercontent.com/upc-pre-202620-1acc0238-13981-nutrisync/healthify-report/develop/docs/database-diagrams/monitoring-adherence.puml)

### 2.6.3. Bounded Context: Care Relationship

#### 2.6.3.1. Domain Layer

**Care Relationship** (`Healthify.Platform.CareRelationship`) gobierna la relación consentida entre paciente y profesional y es la **única fuente de verdad sobre quién puede ver a quién**. Aquí se hace cumplir técnicamente, y no por convención, el principio de asimetría de la plataforma. Su Domain Layer declara dos aggregate roots, cinco value objects y diez eventos de dominio, de los cuales sólo dos cruzan frontera.

**Aggregates (Aggregate Roots)**

**`Invitation`** — El token de un solo uso que el profesional muestra como código QR durante la consulta. Es la única puerta de entrada del paciente a la plataforma: registrarse no otorga acceso a nada.

| Atributo | Tipo | Scope | Descripción |
|---|---|---|---|
| `Id` | `InvitationId` | `public get / private set` | Identidad tipada. |
| `IssuedBy` | `int` | `public get / private set` | Profesional emisor; referencia cross-context como `int` plano, sin navegación EF. |
| `Token` | `InvitationToken` | `public get / private set` | Secreto opaco generado criptográficamente. |
| `ExpiresAt` | `DateTimeOffset` | `public get / private set` | Fecha en que deja de ser canjeable. |
| `RedeemedAt` | `DateTimeOffset?` | `public get / private set` | Momento del canje. |
| `ExpiredAt` | `DateTimeOffset?` | `public get / private set` | Momento en que la política de expiración la retiró; **distinto de `ExpiresAt`**. |
| `IsRedeemed` / `IsExpired` | `bool` | `public` (computadas) | Derivadas de las dos fechas anteriores. |

| Método | Scope | Reglas que aplica |
|---|---|---|
| `Invitation(IssueInvitationCommand)` | `public` | *Expiration Date Required* (fecha futura) y *Single Use Token* (genera el token con `InvitationToken.Generate()`). |
| `IsValidAt(DateTimeOffset) : bool` | `public` | *Invitation Must Be Valid*: ni canjeada, ni expirada, ni vencida. |
| `Redeem(DateTimeOffset)` | `public` | *Invitation Must Be Unused*, *Invitation Must Be Valid*. |
| `Expire(DateTimeOffset)` | `public` | *Redeemed Invitation Cannot Expire*. Si ya está expirada es un no-op, lo que hace idempotente la política temporal. |

**`CareLink`** — La relación consentida paciente–profesional. El consentimiento se **almacena como cuatro columnas y se reconstruye como value object** mediante la propiedad calculada `Consent`, porque un *owned type* nullable es frágil en EF Core y el consentimiento está genuinamente ausente entre establecer el vínculo y que el paciente lo otorgue.

| Atributo | Tipo | Scope | Descripción |
|---|---|---|---|
| `Id` | `CareLinkId` | `public get / private set` | Identidad tipada. |
| `PatientId` / `PractitionerId` | `int` | `public get / private set` | Referencias cross-context, `int` planos. |
| `EstablishedAt` | `DateTimeOffset` | `public get / private set` | Creación del vínculo. |
| `RevokedAt`, `DischargedAt`, `DischargeReason` | nullable | `public get / private set` | Cierre por retiro de consentimiento o por alta clínica. |
| `PendingTargetsVersion`, `LastAcknowledgedVersion` | `int?` | `public get / private set` | Versión pendiente de acuse y última acusada. |
| `ConsentGranted`, `ConsentScope`, `ConsentGrantedAt`, `ConsentWithdrawnAt` | proyección | `public get / private set` | Proyección persistida del VO `Consent`. |
| `Consent` | `Consent?` | `public` (computada) | Reconstruido desde las cuatro columnas. |
| `IsActive` | `bool` | `public` (computada) | Consentimiento vivo, sin revocar y sin alta. **Ésta es la respuesta que el Open Host Service da a los otros cinco contextos.** |
| `IsRevoked` / `IsDischarged` | `bool` | `public` (computadas) | Estados de cierre. |

| Método | Scope | Reglas que aplica |
|---|---|---|
| `CareLink(EstablishCareLinkCommand)` | `public` | *Patient Cannot Self Link*, *Link Starts Inactive Until Consent*. |
| `GrantConsent(GrantConsentCommand)` | `public` | *Discharged Link Never Reactivated*, *Consent Scope Recorded*; rechaza el doble consentimiento. |
| `WithdrawConsent()` | `public` | *Consent Always Revocable*, *No Justification Required*. **Deliberadamente no recibe argumento de motivo.** |
| `Revoke()` | `public` | *Revoked Link Kept With Revocation Date*: la fila nunca se borra. |
| `Discharge(ClinicalReason)` | `public` | *Clinical Reason Required*, *Discharged Link Never Reactivated*. |
| `MarkTargetsPending(int)` | `public` | *One Pending Version At A Time*: una publicación más nueva reemplaza a la pendiente, no se encola. |
| `AcknowledgeActiveTargets(int)` | `public` | *Acknowledgement Does Not Change The Plan*: sólo mueve `LastAcknowledgedVersion` y limpia la pendiente. |

La asimetría está documentada en los propios métodos: **el profesional explica el alta; el paciente nunca explica su retiro**.

**Value Objects**

| Clase | Propósito | Reglas y miembros |
|---|---|---|
| `Consent` | El permiso que el paciente da y puede retirar en cualquier momento sin explicar por qué. | `IsGranted`, `Scope` (máx. 200), `GrantedAt`, `WithdrawnAt?`. `Withdraw(DateTimeOffset)` devuelve una **nueva instancia**, preservando la inmutabilidad. |
| `ClinicalReason` | Justificación clínica registrada al dar de alta. | `Value : string`, máximo 500; rechaza vacío. |
| `InvitationToken` | Secreto opaco de un solo uso del QR. | 32 bytes de `RandomNumberGenerator`, codificados en Base64 URL-safe; sólo acepta `[A-Za-z0-9-_]`; factory `Generate()`. |
| `CareLinkId`, `InvitationId` | Identidades tipadas. | `Value : int > 0`, `internal static FromRaw(int)`, operadores de conversión. |

**Commands (10)** — `IssueInvitationCommand`, `ExpireInvitationCommand`, `RedeemInvitationCommand`, `EstablishCareLinkCommand`, `GrantConsentCommand`, `MarkTargetsPendingAcknowledgementCommand`, `AcknowledgeActiveTargetsCommand`, `WithdrawConsentCommand`, `RevokeCareLinkCommand` y `DischargePatientCommand`. Cuatro de ellos **no tienen endpoint**: son emitidos exclusivamente por políticas.

**Queries (6)** — `GetInvitationByIdQuery`, `GetInvitationByTokenQuery`, `GetExpirableInvitationsQuery`, `GetCareLinkByIdQuery`, `GetActiveCareLinkByPatientIdQuery` (que respalda el Open Host Service) y `GetCareLinksByPractitionerIdQuery`.

**Domain Events (10)** — Todos heredan de `DomainEventBase`. Sólo dos cruzan frontera, ambos hacia Monitoring & Adherence: **`CareLinkEstablished`**, que abre la ventana de evaluación, y **`CareLinkRevoked`**, que la cierra. `ConsentGranted` es interno **a propósito**: preguntar si un vínculo está activo no es reaccionar a un hecho pasado, y por eso Care Link Status se consulta de forma síncrona por el OHS. Los restantes —`InvitationIssued`, `InvitationExpired`, `InvitationRedeemed`, `ConsentWithdrawn`, `TreatmentDischarged`, `TargetsPendingAcknowledgement` y `ActiveTargetsAcknowledged`— son internos.

**Errors** — `enum CareRelationshipError` con 21 valores, entre ellos `PatientCannotSelfLink`, `PatientAlreadyHasActiveLink`, `ConsentScopeRequired`, `DischargedLinkCannotBeReactivated` y `AcknowledgedVersionNewerThanActive`.

**Repositories (abstracciones)** — `IInvitationRepository` (con `FindByTokenAsync` y `ListExpirableAsync`) e `ICareLinkRepository` (con `FindActiveByPatientIdAsync`, `ExistsUnclosedByPatientIdAsync`, `FindUnclosedByPatientIdAsync` y `ListByPractitionerIdAsync`). La distinción semántica es clave: *active* significa con consentimiento vivo y sin cerrar; *unclosed* significa que ocupa el único cupo del paciente, con o sin consentimiento todavía.

**Domain Services** — Este bounded context **no declara interfaces de domain service propias**; consume el ACL de IAM (`IIamContextFacade`) desde la capa de aplicación.

**Relaciones entre clases:** `Invitation` compone `InvitationId` e `InvitationToken`. `CareLink` compone `CareLinkId`, agrega de forma reconstruida 0..1 `Consent` y depende de `ClinicalReason` como parámetro de `Discharge`. Entre `Invitation` y `CareLink` existe una asociación **por identificador y a través de una política** (1 → 0..1, `redeemedInto`): no hay navegación EF ni columna `invitation_id` en el vínculo. Ambas raíces realizan `IAuditableEntity`, y los diez eventos generalizan `DomainEventBase`, que a su vez realiza `IEvent`.

#### 2.6.3.2. Interface Layer

La Interface Layer de Care Relationship expone cuatro controllers y, sobre todo, publica el **Open Host Service** de la plataforma: el contrato por el que los otros cinco bounded contexts preguntan si un vínculo está activo antes de servir nada.

**Controllers**

**`InvitationsController`** — `[Route("api/v1/invitations")] [Authorize] [Tags("Invitations")]`. Depende de `IInvitationCommandService`, `IInvitationQueryService` e `IStringLocalizer<CareRelationshipMessages>`.

| Verbo / Ruta | Acción | Rol | Read Model | Respuestas |
|---|---|---|---|---|
| `POST /api/v1/invitations` | `IssueInvitation(IssueInvitationResource)` | `Practitioner` | QR Code On Screen | 201 · 400 · 401 · 403 · 500 |
| `GET /api/v1/invitations/{invitationId:int}` | `GetInvitationById(int)` | Sólo el emisor | Invitation Status | 200 · 401 · 403 · 404 |
| `POST /api/v1/invitations/redemption` | `RedeemInvitation(RedeemInvitationResource)` | `Patient` | — | 201 `CareLinkResource` · 400 · 401 · 403 · 404 · 409 · 422 |

El token **sólo viaja en la respuesta que crea la invitación**; toda lectura posterior lo reporta como `null`.

**`CareLinksController`** — `[Route("api/v1/care-links")] [Authorize] [Tags("Care Links")]`.

| Verbo / Ruta | Acción | Rol | Respuestas |
|---|---|---|---|
| `GET /{careLinkId:int}` | `GetCareLinkById` | Ambos participantes | 200 · 401 · 403 · 404 |
| `GET /{careLinkId:int}/targets-read-status` | `GetTargetsReadStatus` | Ambos participantes | 200 · 401 · 403 · 404 |
| `POST /{careLinkId:int}/consent` | `GrantConsent` | `Patient` | 200 · 400 · 401 · 403 · 404 · 409 |
| `DELETE /{careLinkId:int}/consent` | `WithdrawConsent` | `Patient` | 204 · 401 · 403 · 404 |
| `POST /{careLinkId:int}/targets-acknowledgement` | `AcknowledgeActiveTargets` | `Patient` | 200 · 401 · 403 · 404 · 422 |
| `POST /{careLinkId:int}/discharge` | `DischargePatient` | `Practitioner` | 200 · 400 · 401 · 403 · 404 · 409 |

**`Revoke Care Link` no tiene endpoint a propósito**: es una política interna disparada por `ConsentWithdrawn`, nunca una decisión separada.

**`PatientCareLinksController`** — `[Route("api/v1/patients")] [Authorize]`. Expone `GET /{patientId:int}/care-links/active` (`GetActiveCareLink(int)`), que sirve el read model **Care Link Status**: la pregunta que los otros cinco contextos hacen antes de servir nada.

**`PractitionerPatientsController`** — `[Route("api/v1/practitioners")] [Authorize(Roles = "Practitioner")]`. Expone `GET /{practitionerId:int}/patients` (`GetPatientsByPractitionerId(int)`), read model **Practitioner Patient List**, que **incluye vínculos revocados y dados de alta**: el roster es un historial.

**Resources** — `IssueInvitationResource`, `RedeemInvitationResource`, `InvitationResource` (con `Token?` y un `Status` derivado: `Pending`, `Redeemed` o `Expired`), `GrantConsentResource`, `DischargePatientResource`, `AcknowledgeActiveTargetsResource`, `CareLinkResource` y `TargetsReadStatusResource`.

**Transform / Assemblers** — Los command assemblers son `IssueInvitationCommandAssembler`, `RedeemInvitationCommandAssembler` (el `patientId` sale del token, nunca del payload), `GrantConsentCommandAssembler`, `WithdrawConsentCommandAssembler` (que **no acepta motivo**), `AcknowledgeActiveTargetsCommandAssembler` y `DischargePatientCommandAssembler`. Entre los resource assemblers destaca `InvitationResourceAssembler`, con dos métodos deliberadamente distintos: `ToResource(...)`, **sin token**, y `ToResourceWithToken(...)`, usado sólo en la respuesta de creación; su método privado `Build` deriva el `Status`.

`CareRelationshipActionResultAssembler` es el único lugar donde el error de dominio se convierte en HTTP, mediante `ToIssueInvitationResult`, `ToRedeemInvitationResult`, `ToCareLinkResult`, `ToWithdrawConsentResult`, `ToNotFoundResult` y el privado `FailureResult`:

| Errores | Status |
|---|---|
| `InvitationNotFound`, `CareLinkNotFound` | **404** |
| `PractitionerOnly`, `PatientCannotSelfLink`, `NoActiveConsent`, `CareLinkNotActive` | **403** |
| `PatientAlreadyHasActiveLink`, `InvitationAlreadyRedeemed`, `ConsentAlreadyGranted`, `CareLinkAlreadyRevoked`, `DischargedLinkCannotBeReactivated`, `PendingVersionAlreadyExists`, `RedeemedInvitationCannotExpire` | **409** |
| `ExpirationDateRequired`, `ConsentScopeRequired`, `ClinicalReasonRequired`, `InvitationNotValid` | **400** |
| `InvitationExpired`, `NoPendingTargetsVersion`, `AcknowledgedVersionNewerThanActive` | **422** |
| `UnexpectedError` (por defecto) | **500** |

**ACL Contract / Open Host Service** — `ICareRelationshipContextFacade` declara el DTO `CareLinkStatusItem(int, int, int, bool, bool, int?)` y dos operaciones: `IsCareLinkActive(int, int)` y `GetActiveCareLinkByPatientId(int)`. **Éste es el Open Host Service de la plataforma**, y un OHS es un patrón de consulta, no de publicación: preguntar si un vínculo está activo no es reaccionar a un hecho pasado, razón por la cual `ConsentGranted` no dispara ninguna política externa.

**Localización** — `CareRelationship/Resources/CareRelationshipMessages.cs`, clase marcador de los recursos `.resx`.

#### 2.6.3.3. Application Layer

La Application Layer maneja los cinco subflujos del contexto (2.1 a 2.5) y evidencia sus capabilities: emitir y expirar invitaciones, canjearlas, establecer el vínculo, otorgar y retirar consentimiento, acusar recibo de objetivos, revocar y dar de alta.

**Command Services**

**`InvitationCommandService`** (implementa `IInvitationCommandService`) — Depende de `IInvitationRepository`, `ICareLinkRepository`, `IUnitOfWork`, **`IIamContextFacade`**, `ILogger<...>` e `IMediator`.

| Método | Subflujo | Comportamiento |
|---|---|---|
| `Handle(IssueInvitationCommand)` | 2.1 | Verifica *Practitioner Only* contra el ACL de IAM **además** del atributo de rol del endpoint; como la fachada degrada a `false`, un fallo de identidad **rechaza** la invitación. Publica `InvitationIssued`. |
| `Handle(ExpireInvitationCommand)` | 2.1 | Sólo desde la política temporal. Una invitación ya expirada devuelve éxito sin segundo evento, lo que hace idempotente la política. Publica `InvitationExpired`. |
| `Handle(RedeemInvitationCommand)` | 2.2 | Guardas en orden: token válido, invitación existente, no usada, aún vigente, *Patient Cannot Self Link* (**antes** de quemar el token) y *One Active Link Per Patient*. Publica `InvitationRedeemed` y **relee** el `CareLink` que creó la política para responder al llamador. |

Nota arquitectónica: el `CareLink` **no se crea aquí**. Canjear publica `InvitationRedeemed`, y la política que reacciona emite `EstablishCareLinkCommand` —el único camino hacia un vínculo—. Como la publicación de eventos espera a sus handlers, el vínculo ya existe cuando el método lo relee.

**`CareLinkCommandService`** (implementa `ICareLinkCommandService`) — Depende de `ICareLinkRepository`, `IUnitOfWork`, `IIamContextFacade`, `ILogger<...>` e `IMediator`.

| Método | Subflujo | Comportamiento |
|---|---|---|
| `Handle(EstablishCareLinkCommand)` | 2.2 | Sólo desde la política *When Invitation Redeemed*. Verifica *One Active Link Per Patient*, construye el vínculo y publica **`CareLinkEstablished`** (evento de integración). |
| `Handle(GrantConsentCommand)` | 2.3 | Valida el scope antes de cargar nada; descarta vínculos dados de alta o revocados y el consentimiento ya otorgado. Publica `ConsentGranted` (interno). |
| `Handle(WithdrawConsentCommand)` | 2.5 | Sin justificación. Publica `ConsentWithdrawn`, que consume la política propia. |
| `Handle(RevokeCareLinkCommand)` | 2.5 | Sólo desde la política *When Consent Withdrawn*. Idempotente. Publica **`CareLinkRevoked`** (evento de integración). |
| `Handle(DischargePatientCommand)` | 2.5 | Valida la razón clínica, comprueba `IsPractitioner` vía ACL y verifica que sea **el profesional vinculado**. Publica `TreatmentDischarged`. |
| `Handle(MarkTargetsPendingAcknowledgementCommand)` | 2.4 | Sólo desde la política que reacciona a `ActiveTargetsUpdated`; idempotente si la versión pendiente ya es igual o mayor. Publica `TargetsPendingAcknowledgement`. |
| `Handle(AcknowledgeActiveTargetsCommand)` | 2.4 | Exige `IsActive` (*No Access Without Consent*) y una versión pendiente. Publica `ActiveTargetsAcknowledged`; **nada de esto alcanza a Nutritional Care**. |

**Query Services** — `InvitationQueryService` (con resolución del QR escaneado, donde un token malformado devuelve `null` en lugar de fallar) y `CareLinkQueryService`, que respalda el read model Care Link Status.

**Event Handlers (políticas)** — Los tres crean un scope de DI aislado mediante `IServiceScopeFactory.CreateAsyncScope()`, porque las notificaciones se manejan en paralelo.

| Handler | Escucha | Política | Emite |
|---|---|---|---|
| `OnInvitationRedeemedHandler` | `InvitationRedeemed` (propio) | *When Invitation Redeemed* (2.2). **El único camino hacia un `CareLink`**, lo que vuelve estructural la regla de que el paciente no puede auto-vincularse. | `EstablishCareLinkCommand` |
| `OnConsentWithdrawnHandler` | `ConsentWithdrawn` (propio) | *When Consent Withdrawn* (2.5). Retirar el consentimiento revoca el vínculo; por eso revocar no tiene endpoint. | `RevokeCareLinkCommand` |
| `OnActiveTargetsUpdatedCareRelationshipHandler` | `ActiveTargetsUpdated` (Nutritional Care) | *When Active Targets Updated* (2.4). Acusar recibo es un acto de la **relación**, no del acto clínico; por eso la bandera de pendiente vive en el `CareLink` y no en el plan. | `MarkTargetsPendingAcknowledgementCommand` |

**DTO de aplicación** — `InvitationRedemptionOutcome(Invitation, CareLink?)`, que permite responder al canje con el vínculo recién creado.

**ACL Facade** — `CareRelationshipContextFacade` implementa `ICareRelationshipContextFacade` apoyándose en `ICareLinkQueryService` y **nunca en un repositorio**, para no puentear la capa de aplicación. Su degradación es deliberadamente conservadora: `IsCareLinkActive` devuelve `false` ante cualquier fallo, bajo el principio de que **sin respuesta significa sin acceso**.

#### 2.6.3.4. Infrastructure Layer

La Infrastructure Layer de Care Relationship comprende la persistencia sobre MySQL 8 y un único `BackgroundService`. **Este bounded context no consume APIs de terceros.**

**Configuraciones de EF Core**

| Clase | Tabla | Decisiones de mapeo |
|---|---|---|
| `InvitationEntityTypeConfiguration` | `invitations` | PK con converter `InvitationId.FromRaw` y `ValueGeneratedOnAdd()`. `issued_by` requerido con índice `ix_invitations_issued_by`, **sin navegación y sin restricción de clave foránea**, porque es una referencia cross-context. `token` como `VARCHAR(64)` con converter e **índice único `ix_invitations_token`**, segunda línea de defensa de *Single Use Token*. `expires_at` requerido; `redeemed_at` y `expired_at` opcionales. `Ignore(IsRedeemed)`, `Ignore(IsExpired)`. |
| `CareLinkEntityTypeConfiguration` | `care_links` | PK con converter `CareLinkId.FromRaw`. `patient_id` y `practitioner_id` requeridos con sus índices y **sin FK**. Cierre mediante `revoked_at`, `discharged_at` y `discharge_reason` (`VARCHAR(500)`). Acuse mediante `pending_targets_version` y `last_acknowledged_version`. **Proyección del VO `Consent` en cuatro columnas**: `consent_granted` (requerida), `consent_scope` (`VARCHAR(200)`), `consent_granted_at` y `consent_withdrawn_at`. `Ignore` sobre `Consent`, `IsActive`, `IsRevoked` e `IsDischarged`. |

**Repositorios (implementaciones)**

| Clase | Detalles de implementación |
|---|---|
| `InvitationRepository(AppDbContext)` | Sobrescribe `FindByIdAsync` con la identidad tipada; `FindByTokenAsync` compara contra una instancia del value object; `ListExpirableAsync` filtra invitaciones ni canjeadas ni expiradas cuya fecha ya venció, ordena por vencimiento y aplica `Take(maxResults)`. Reimplementa explícitamente `IBaseRepository<Invitation>.FindByIdAsync`. |
| `CareLinkRepository(AppDbContext)` | `FindActiveByPatientIdAsync` combina el helper privado `Unclosed()` con el consentimiento otorgado; `FindUnclosedByPatientIdAsync` y `ExistsUnclosedByPatientIdAsync` respaldan *One Active Link Per Patient*; `ListByPractitionerIdAsync` devuelve **todo el historial**, incluidos los vínculos revocados y dados de alta, porque el roster del profesional es un registro y no una lista de activos. |

**Scheduling — `InvitationExpiryHostedService`** — `BackgroundService` que implementa la política temporal *When Expiration Date Reached* (subflujo 2.1). Nadie la dispara: ni un usuario ni un evento, sólo el paso del tiempo, y por eso es un hosted service y no un event handler.

- Dependencias: `IServiceScopeFactory`, `IConfiguration`, `ILogger<...>`.
- Constante `BatchSize = 200`; intervalo desde `Scheduling:InvitationExpiryIntervalMinutes` (60 minutos por defecto, mínimo 1), con `PeriodicTimer`.
- Cumple las **cinco guardas obligatorias del proyecto**: todo el cuerpo del ciclo dentro de `try/catch` para que un ciclo fallido nunca tumbe el host; los servicios *scoped* resueltos en un scope propio; el `stoppingToken` propagado a cada llamada; el ciclo idempotente, porque expirar algo ya expirado es un no-op sin segundo evento; y las migraciones de EF ya aplicadas en el composition root antes de arrancar el host.
- Método privado `SafeWaitAsync(PeriodicTimer, CancellationToken)`, que traga la excepción de cancelación.

**Servicios externos** — Ninguno. El generador criptográfico del token de invitación es la biblioteca estándar de .NET, no un proveedor externo.

#### 2.6.3.5. Bounded Context Software Architecture Component Level Diagrams

**Care Relationship**

Component:

![Care Relationship Component](https://www.plantuml.com/plantuml/proxy?fmt=svg&src=https://raw.githubusercontent.com/upc-pre-202620-1acc0238-13981-nutrisync/healthify-report/develop/docs/c4-diagrams/care-relationship.puml)

#### 2.6.3.6. Bounded Context Software Architecture Code Level Diagrams

#### 2.6.3.6.1. Bounded Context Domain Layer Class Diagrams

**Care Relationship**

Domain:

![Care Relationship Domain](https://www.plantuml.com/plantuml/proxy?fmt=svg&src=https://raw.githubusercontent.com/upc-pre-202620-1acc0238-13981-nutrisync/healthify-report/develop/docs/class-diagrams/backend/care-relationship/domain.puml)

Infrastructure:

![Care Relationship Infrastructure](https://www.plantuml.com/plantuml/proxy?fmt=svg&src=https://raw.githubusercontent.com/upc-pre-202620-1acc0238-13981-nutrisync/healthify-report/develop/docs/class-diagrams/backend/care-relationship/infrastructure.puml)

Application:

![Care Relationship Application](https://www.plantuml.com/plantuml/proxy?fmt=svg&src=https://raw.githubusercontent.com/upc-pre-202620-1acc0238-13981-nutrisync/healthify-report/develop/docs/class-diagrams/backend/care-relationship/application.puml)

Interfaces:

![Care Relationship Interfaces](https://www.plantuml.com/plantuml/proxy?fmt=svg&src=https://raw.githubusercontent.com/upc-pre-202620-1acc0238-13981-nutrisync/healthify-report/develop/docs/class-diagrams/backend/care-relationship/interfaces.puml)

