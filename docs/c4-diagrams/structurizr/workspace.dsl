workspace "Healthify" "C4 model of Healthify: two Android apps (Kotlin and Flutter), an ASP.NET Core 10 API and a MySQL 8.4 database." {

    !identifiers flat
    !impliedRelationships "com.structurizr.model.CreateImpliedRelationshipsUnlessAnyRelationshipExistsStrategy"

    model {

        # ------------------------------------------------------------------
        # People
        # ------------------------------------------------------------------
        patient = person "Patient" "Logs meals and body weight between consultations and follows the plan prescribed by the practitioner."
        practitioner = person "Practitioner" "Performs the clinical act (assessment, diagnosis, prescription) and reviews the adherence signals of linked patients."

        # ------------------------------------------------------------------
        # External systems
        # ------------------------------------------------------------------
        gemini = softwareSystem "Google Gemini API" "Generative AI model used for meal photo analysis, meal ideas, diagnosis and plan suggestions and weekly summaries. Off by default; inputs are pseudonymized and photos are not stored." "External"
        foodProviders = softwareSystem "Nutritional Data Providers" "External food catalogs (Open Food Facts, USDA FoodData Central) imported through the Food Catalog anticorruption layer." "External"
        smtp = softwareSystem "SMTP Mail Server" "Delivers password-reset codes and consultation reminders by e-mail." "External"

        # ------------------------------------------------------------------
        # Healthify
        # ------------------------------------------------------------------
        healthify = softwareSystem "Healthify" "Mobile nutrition monitoring platform that bridges the gap between nutrition consultations." {

            landing = container "Landing Page" "Static bilingual site (Spanish and English) that presents Healthify's value proposition and links to the download of both apps." "HTML5, CSS3, JavaScript" "Web Browser"

            # ==============================================================
            # Healthify Android app (Kotlin)
            # ==============================================================
            android = container "Healthify Android App" "Native app for both roles. Mounts the patient or practitioner navigation shell from the role claim; works offline with an outbox that syncs when the connection returns." "Kotlin, Jetpack Compose, Hilt" "Mobile App" {

                aShell = component "App Shell" "MainActivity, AppNavHost and AppNavigationViewModel; patient and practitioner shells, home and settings (features/main), data export and onboarding (Splash, Welcome)." "Jetpack Compose Navigation" "Shell"

                group "Core" {
                    aNet = component "Core Network" "Retrofit and OkHttp client: AuthInterceptor, TokenRefreshAuthenticator, AcceptLanguageInterceptor, EncryptedSessionTokenStore (Tink), ProblemDetailsMapper and SessionExpiryNotifier." "Retrofit, OkHttp, kotlinx.serialization, Tink" "Core"
                    aSync = component "Core Sync (Outbox)" "PendingOperationQueue, PendingSyncEngine, PendingSyncWorker and SyncScheduler. Stores offline writes and sends them when the device is back online." "WorkManager" "Core"
                    aStore = component "Core Local Storage" "AppDatabase and PendingOperationDao (Room) plus DataStore preferences." "Room, DataStore" "Core"
                    aCommon = component "Core Common & DI" "DomainError, ConnectivityObserver, LegalLinks and the Hilt modules (Database, DataStore, Network, Dispatchers, Time)." "Kotlin, Hilt" "Core"
                    aDs = component "Design System" "HealthifyTheme, colors, typography, dimensions, icons and 34 reusable Compose components." "Jetpack Compose, Material 3" "Core"
                }

                group "IAM" {
                    aIamPres = component "IAM Presentation" "SignIn, SignUp, ForgotPassword, SessionExpired and ShellLoading screens with their ViewModels and UI states." "Jetpack Compose, ViewModel" "Layer,IAM"
                    aIamApp = component "IAM Application" "SignIn, Register, SignOut, PasswordReset, ResolveNavigationShell, ObserveCurrentUser and ChangePreferredLanguage use cases." "Kotlin use cases" "Layer,IAM"
                    aIamDom = component "IAM Domain" "SessionUser, Credentials, NewAccount and PasswordReset; value objects UserRole, NavigationShell, EmailAddress, PreferredLanguage; repository interfaces." "Kotlin" "Layer,IAM"
                    aIamInf = component "IAM Infrastructure" "AuthenticationService and SessionService (Retrofit), RetrofitTokenRefresher, SessionUserDao (Room), AndroidAppLanguageRepository and repository implementations." "Retrofit, Room" "Layer,IAM"
                }

                group "Care Relationship" {
                    aCrPres = component "Care Relationship Presentation" "ScanInvitation (QR scanner), Consent, PendingConsent, WithdrawConsent, AiFeatures, InvitePatient (QR code), PatientRoster and DischargePatient screens with their ViewModels." "Jetpack Compose, CameraX, ML Kit barcode scanning, ZXing" "Layer,CareRelationship"
                    aCrApp = component "Care Relationship Application" "RedeemInvitation, GrantConsent, WithdrawConsent, AcknowledgeActiveTargets, GetPatientLinkStatus, AI preferences and practitioner care-link use cases." "Kotlin use cases" "Layer,CareRelationship"
                    aCrDom = component "Care Relationship Domain" "CareLink, IssuedInvitation, PatientRoster, AiPreferences and TargetsReadStatus; value objects InvitationToken, ConsentScope, ClinicalReason; repository interfaces." "Kotlin" "Layer,CareRelationship"
                    aCrInf = component "Care Relationship Infrastructure" "CareLinkService, PractitionerCareLinkService and AiPreferencesService (Retrofit), CareRelationshipDataStore and repository implementations." "Retrofit, DataStore" "Layer,CareRelationship"
                }

                group "Nutritional Care" {
                    aNcPres = component "Nutritional Care Presentation" "Consultation steps (Baseline, Measurement, Diagnosis, Targets, Publication), ReviewInbox, ReviewItem, AdjustProposal, PatientRecord, MyPlan and PlanVersions screens with their ViewModels." "Jetpack Compose, ViewModel" "Layer,NutritionalCare"
                    aNcApp = component "Nutritional Care Application" "PractitionerCare, ReviewInbox, GetOwnRecord and GetPlanVersions use cases." "Kotlin use cases" "Layer,NutritionalCare"
                    aNcDom = component "Nutritional Care Domain" "Consultation, ConsultationCommands, PatientBaseline, PlanProposal, PlanVersion, ReviewItem and PatientOwnRecord; clinical codes and values; repository interfaces." "Kotlin" "Layer,NutritionalCare"
                    aNcInf = component "Nutritional Care Infrastructure" "PractitionerCareServices, ReviewItemService, PatientRecordService and PlanVersionService (Retrofit), DTO mappers and repository implementations." "Retrofit" "Layer,NutritionalCare"
                }

                group "Intake & Body Response" {
                    aInPres = component "Intake Presentation" "Diary, MealPhoto (camera), ConfirmEntry, ManualMeal, MealIdeas, SelfWeighIn, WeightTrend, PendingSync and Reminders screens with their ViewModels." "Jetpack Compose, CameraX" "Layer,Intake"
                    aInApp = component "Intake Application" "Diary, LogMeal, MealPhoto, MealIdeas, PlanFit, SelfWeighIn, Reminder and GetActiveTargets use cases." "Kotlin use cases" "Layer,Intake"
                    aInDom = component "Intake Domain" "DiaryEntry, PendingDiaryEntry, DailyIntake, MealPhotoAnalysis, SelfWeighIn, WeightTrend, ActiveTargets and PlanFit; value objects ClientEntryId, PortionGrams, WeightKg; repository interfaces." "Kotlin" "Layer,Intake"
                    aInInf = component "Intake Infrastructure" "DiaryService and SelfWeighInService (Retrofit), ActiveTargetsCacheDao (Room), MealPhotoEncoder and JpegMetadataStripper, diary and weigh-in sync senders, ReminderWorker and WorkManagerReminderScheduler." "Retrofit, Room, WorkManager" "Layer,Intake"
                }

                group "Monitoring & Adherence" {
                    aMoPres = component "Monitoring Presentation" "HowAmIToday, WeeklySummary, Consistency, MyConsultations, CheckIn, PatientFollowUp, PractitionerAgenda, ScheduleFollowUp, FollowUpPreparation and RecordReferral screens with their ViewModels." "Jetpack Compose, ViewModel" "Layer,Monitoring"
                    aMoApp = component "Monitoring Application" "GetTodayProgress, GetConsistencyIndex, DetectLoggingGap, GetLatestWeeklySummary, GetNextFollowUp, Consultations, ConsultationReminder and PractitionerAgenda use cases." "Kotlin use cases" "Layer,Monitoring"
                    aMoDom = component "Monitoring Domain" "DailyProgress, ConsistencyIndex, WeeklySummary, NextFollowUp, PractitionerAgenda, PreVisitCheckIn, Referral and PatientMonitoringPanel; repository interfaces and ConsultationReminderScheduler." "Kotlin" "Layer,Monitoring"
                    aMoInf = component "Monitoring Infrastructure" "PatientMonitoringService, WeeklySummaryService, ConsultationsService, PractitionerAgendaService (Retrofit), ConsultationReminderWorkers and WorkManagerConsultationReminderScheduler." "Retrofit, WorkManager" "Layer,Monitoring"
                }

                group "Food Catalog" {
                    aFcPres = component "Food Catalog Presentation" "FoodCatalog search and AddLocalFood screens with their ViewModels." "Jetpack Compose, ViewModel" "Layer,FoodCatalog"
                    aFcApp = component "Food Catalog Application" "SearchFoods, RefreshLocalFoodCatalog and LocalFoodCatalog use cases." "Kotlin use cases" "Layer,FoodCatalog"
                    aFcDom = component "Food Catalog Domain" "ReferenceFood, FoodSearchResult and NewLocalFood; value objects FoodSearchTerm, ReferenceFoodId; ReferenceFoodRepository." "Kotlin" "Layer,FoodCatalog"
                    aFcInf = component "Food Catalog Infrastructure" "ReferenceFoodService (Retrofit), LocalFoodDao (Room) as the local catalog cache, mappers and ReferenceFoodRepositoryImpl." "Retrofit, Room" "Layer,FoodCatalog"
                }
            }

            androidDb = container "Android Local Database" "On-device store of the Android app: session user, outbox of pending operations, offline diary, cached active targets and local food catalog." "Room (SQLite)" "Database,OnDevice"

            # ==============================================================
            # Healthify Practitioner app (Flutter)
            # ==============================================================
            flutter = container "Healthify Practitioner App" "Flutter app for the practitioner role only. Covers five bounded contexts; it has no meal logging or self weigh-in." "Flutter, Dart, flutter_bloc" "Mobile App" {

                fShell = component "App Shell" "main.dart, AppRouter and SessionGate (go_router); practitioner shell, patient screen, settings and sign-out (features/main) and onboarding (Splash, Welcome)." "go_router" "Shell"

                group "Core" {
                    fNet = component "Core Network" "ApiClient, AuthenticatedClient, TokenRefreshCoordinator, AcceptLanguageClient, SecureSessionTokenStore and ProblemDetailsMapper." "package:http, flutter_secure_storage" "Core"
                    fCommon = component "Core Common & DI" "Service locator (get_it), ConnectivityObserver, Result and DomainError, one-shot events and localization (es, en)." "get_it, connectivity_plus, intl" "Core"
                    fDs = component "Design System" "HealthifyTheme, palette, typography, dimensions, icons and reusable widgets." "Flutter widgets" "Core"
                }

                group "IAM" {
                    fIamPres = component "IAM Presentation" "SignIn, SignUp, ForgotPassword, SessionExpired, ShellLoading and PractitionerOnly screens with their Cubits; language switcher." "Flutter widgets, Cubit" "Layer,IAM"
                    fIamApp = component "IAM Application" "SignIn, Register, SignOut, PasswordReset, Session, Account and ResolveNavigationShell use cases." "Dart use cases" "Layer,IAM"
                    fIamDom = component "IAM Domain" "SessionUser, Credentials, NewAccount and PasswordReset; value objects UserRole, NavigationShell, EmailAddress, PreferredLanguage; repository interfaces." "Dart (freezed)" "Layer,IAM"
                    fIamInf = component "IAM Infrastructure" "AuthenticationService and SessionService, HttpTokenRefresher, SessionLocalDataSource, PreferencesAppLanguageRepository and repository implementations." "package:http, shared_preferences" "Layer,IAM"
                }

                group "Care Relationship" {
                    fCrPres = component "Care Relationship Presentation" "InvitePatient (QR code), PatientRoster and DischargePatient screens with their Cubits." "Flutter widgets, Cubit, qr_flutter, share_plus" "Layer,CareRelationship"
                    fCrApp = component "Care Relationship Application" "PractitionerCareLink and FindActiveCareLink use cases." "Dart use cases" "Layer,CareRelationship"
                    fCrDom = component "Care Relationship Domain" "IssuedInvitation, PatientRoster and TargetsReadStatus; value objects InvitationToken, ClinicalReason, RosterAttention; repository interface." "Dart (freezed)" "Layer,CareRelationship"
                    fCrInf = component "Care Relationship Infrastructure" "PractitionerCareLinkService, DTO mappers and PractitionerCareLinkRepositoryImpl." "package:http" "Layer,CareRelationship"
                }

                group "Nutritional Care" {
                    fNcPres = component "Nutritional Care Presentation" "Consultation steps (Baseline, Measurement, Diagnosis, Targets, Publication), ReviewInbox, ReviewItem, AdjustProposal, PatientSummary and PatientPlan tabs with their Cubits." "Flutter widgets, Cubit" "Layer,NutritionalCare"
                    fNcApp = component "Nutritional Care Application" "PractitionerCare and ReviewInbox use cases." "Dart use cases" "Layer,NutritionalCare"
                    fNcDom = component "Nutritional Care Domain" "Consultation, ConsultationCommands, PatientBaseline, PatientRecord, PatientSummary, PlanHistory, PlanProposal and ReviewItem; clinical codes and values." "Dart (freezed)" "Layer,NutritionalCare"
                    fNcInf = component "Nutritional Care Infrastructure" "PractitionerCareServices and ReviewItemService, DTO mappers and repository implementations." "package:http" "Layer,NutritionalCare"
                }

                group "Monitoring & Adherence" {
                    fMoPres = component "Monitoring Presentation" "PractitionerAgenda, ScheduleFollowUp, RecordReferral and PatientFollowUp tab with their Cubits." "Flutter widgets, Cubit" "Layer,Monitoring"
                    fMoApp = component "Monitoring Application" "Monitoring, PractitionerAgenda and ConsultationReminder use cases." "Dart use cases" "Layer,Monitoring"
                    fMoDom = component "Monitoring Domain" "PatientMonitoringPanel, PractitionerAgenda, Referral and ConsultationReminder; ConsultationReminderScheduler and repository interfaces." "Dart (freezed)" "Layer,Monitoring"
                    fMoInf = component "Monitoring Infrastructure" "MonitoringServices and PractitionerAgendaService, LocalNotificationsConsultationReminderScheduler and repository implementations." "package:http, flutter_local_notifications" "Layer,Monitoring"
                }

                group "Food Catalog" {
                    fFcPres = component "Food Catalog Presentation" "FoodCatalog search and AddLocalFood screens with their Cubits." "Flutter widgets, Cubit" "Layer,FoodCatalog"
                    fFcApp = component "Food Catalog Application" "FoodCatalog use cases (search and local overrides)." "Dart use cases" "Layer,FoodCatalog"
                    fFcDom = component "Food Catalog Domain" "ReferenceFood and NewLocalFood; value objects FoodSearchTerm, ReferenceFoodId; ReferenceFoodRepository." "Dart (freezed)" "Layer,FoodCatalog"
                    fFcInf = component "Food Catalog Infrastructure" "ReferenceFoodService, DTO mappers and ReferenceFoodRepositoryImpl." "package:http" "Layer,FoodCatalog"
                }
            }

            # ==============================================================
            # Healthify Platform API (ASP.NET Core 10)
            # ==============================================================
            api = container "Healthify Platform API" "Business logic of the six bounded contexts and the composed read models, exposed as a RESTful API under /api/v1 with Swagger." "ASP.NET Core 10, C#" "API" {

                group "Shared" {
                    shHttp = component "Shared Interfaces" "ProblemDetailsFactory and error codes, RateLimitingPolicies, KebabCaseRouteNamingConvention and controller extensions." "ASP.NET Core" "Shared"
                    shDom = component "Shared Domain" "IBaseRepository, IUnitOfWork, DomainEventBase, IAuditableEntity and the IMailSender port." "C#" "Shared"
                    shAi = component "AI Generation Pipeline" "AiGenerationPipeline: consent check, input pseudonymization, prompt catalog, JSON-schema validation of the output and generation log. Knows no bounded context." "C#" "Shared"
                    shGemini = component "Gemini Client" "GeminiLanguageModelClient and GoogleAccessTokenProvider, behind ILanguageModelClient. FakeLanguageModelClient when AI is off." "HttpClient, Google.Apis.Auth" "Shared"
                    shMail = component "Mail Sender" "SmtpMailSender, implementation of IMailSender over the Smtp section (Host, Port 587, From, UseSsl)." "MailKit" "Shared"
                    shPersist = component "Shared Persistence" "AppDbContext, BaseRepository, UnitOfWork, auditing and UTC interceptors, migrations." "Entity Framework Core 10, MySql.EntityFrameworkCore" "Shared"
                }

                group "IAM" {
                    iamAuthCtl = component "AuthenticationController" "api/v1/authentication: sign-up, sign-in, token-refreshes, password-reset-requests, password-reset-verifications, password-resets, sign-out." "ASP.NET Core REST Controller" "Controller,IAM"
                    iamSessCtl = component "SessionsController" "api/v1/sessions/{sessionId}/navigation-shell." "ASP.NET Core REST Controller" "Controller,IAM"
                    iamUsersCtl = component "UsersController" "api/v1/users/{userId}: read user, preferred-language, sessions." "ASP.NET Core REST Controller" "Controller,IAM"
                    iamAcl = component "IamContextFacade" "IIamContextFacade: identity, role and preferred-language questions for the other contexts." "C# ACL (Open Host Service)" "ACL,IAM"
                    iamApp = component "IAM Application" "UserCommandService, UserSessionCommandService, PasswordResetCommandService, query services and OnRoleClaimIssuedHandler." "C# Application Services (CQRS)" "Layer,IAM"
                    iamDom = component "IAM Domain" "Aggregates User, UserSession and PasswordResetCode; value objects Email, Role, NavigationShell, PreferredLanguage; events RoleClaimIssued, SessionStarted." "C#" "Layer,IAM"
                    iamInf = component "IAM Infrastructure" "BCryptHashingService, JwtTokenService, RefreshTokenService, SmtpEmailService, ConfiguredSignInLockoutPolicy and EF Core repositories." "EF Core, BCrypt.Net, JWT Bearer, MailKit" "Layer,IAM"
                }

                group "Care Relationship" {
                    crInvCtl = component "InvitationsController" "api/v1/invitations: issue, read, redemption." "ASP.NET Core REST Controller" "Controller,CareRelationship"
                    crLinksCtl = component "CareLinksController" "api/v1/care-links/{id}: read, targets-read-status, consent, ai-processing-consent, targets-acknowledgement, discharge." "ASP.NET Core REST Controller" "Controller,CareRelationship"
                    crPatLinksCtl = component "PatientCareLinksController" "api/v1/patients/{patientId}/care-links/active." "ASP.NET Core REST Controller" "Controller,CareRelationship"
                    crPracPatCtl = component "PractitionerPatientsController" "api/v1/practitioners/{practitionerId}/patients." "ASP.NET Core REST Controller" "Controller,CareRelationship"
                    crAiPrefCtl = component "PatientAiPreferencesController" "api/v1/patients/{patientId}/ai-preferences: read and update." "ASP.NET Core REST Controller" "Controller,CareRelationship"
                    crAcl = component "CareRelationshipContextFacade" "ICareRelationshipContextFacade: single source of truth on who can see whom (active link, consent)." "C# ACL (Open Host Service)" "ACL,CareRelationship"
                    crApp = component "Care Relationship Application" "InvitationCommandService, CareLinkCommandService, AiPreferencesCommandService, query services, CareRelationshipAiConsentPolicy and event handlers." "C# Application Services (CQRS)" "Layer,CareRelationship"
                    crDom = component "Care Relationship Domain" "Aggregates CareLink, Invitation and AiPreferences; value objects Consent, InvitationToken, ClinicalReason; events ConsentGranted, CareLinkEstablished, TreatmentDischarged." "C#" "Layer,CareRelationship"
                    crInf = component "Care Relationship Infrastructure" "EF Core repositories and InvitationExpiryHostedService." "EF Core" "Layer,CareRelationship"
                }

                group "Nutritional Care" {
                    ncConsCtl = component "ConsultationsController" "api/v1/consultations/{id}: measurement, diagnosis-suggestion, guideline-suggestions, diagnosis, target-proposal, targets, publication-draft, publication, delete." "ASP.NET Core REST Controller" "Controller,NutritionalCare"
                    ncPatConsCtl = component "PatientConsultationsController" "api/v1/patients/{patientId}/consultations: start, in-progress, list." "ASP.NET Core REST Controller" "Controller,NutritionalCare"
                    ncBaselineCtl = component "PatientBaselineController" "api/v1/patients/{patientId}/baseline: create, update, read." "ASP.NET Core REST Controller" "Controller,NutritionalCare"
                    ncAssessCtl = component "NutritionalAssessmentsController" "api/v1/nutritional-assessments/{assessmentId}." "ASP.NET Core REST Controller" "Controller,NutritionalCare"
                    ncRecordCtl = component "PatientClinicalRecordController" "api/v1/patients/{patientId}: nutritional-assessments, nutritional-diagnoses/active, nutrition-plans, nutrition-plans/active." "ASP.NET Core REST Controller" "Controller,NutritionalCare"
                    ncPlansCtl = component "NutritionPlansController" "api/v1/nutrition-plans/{planId}/adjustments." "ASP.NET Core REST Controller" "Controller,NutritionalCare"
                    ncPlanVerCtl = component "PatientPlanVersionsController" "api/v1/patients/{patientId}/plan-versions." "ASP.NET Core REST Controller" "Controller,NutritionalCare"
                    ncReviewCtl = component "ReviewItemsController" "api/v1/review-items: list, plan-proposal, acceptance, resolution." "ASP.NET Core REST Controller" "Controller,NutritionalCare"
                    ncAcl = component "NutritionalCareContextFacade" "INutritionalCareContextFacade: active plan, prescribed targets and clinical record for the other contexts." "C# ACL (Open Host Service)" "ACL,NutritionalCare"
                    ncApp = component "Nutritional Care Application" "ConsultationCommandService, ConsultationAiCommandService, PatientBaselineCommandService, NutritionPlanCommandService, PlanProposalCommandService, ReviewItemCommandService, query services and event handlers." "C# Application Services (CQRS)" "Layer,NutritionalCare"
                    ncDom = component "Nutritional Care Domain" "Aggregates Consultation, PatientBaseline, NutritionalAssessment, NutritionalDiagnosis, NutritionPlan and ReviewItem; BMR and calorie-floor policies; events NutritionPlanPublished, ActiveTargetsUpdated." "C#" "Layer,NutritionalCare"
                    ncInf = component "Nutritional Care Infrastructure" "EF Core repositories, BmrCalculator, configured guideline and activity-factor providers, plan-proposal generation queue and hosted services." "EF Core" "Layer,NutritionalCare"
                }

                group "Intake & Body Response" {
                    inDiaryCtl = component "DiaryEntriesController" "api/v1/diary-entries: photo-logs, manual-logs, manual-logs/batch, estimate-confirmation, estimate-adjustment, synchronization." "ASP.NET Core REST Controller" "Controller,Intake"
                    inPatCtl = component "PatientIntakeController" "api/v1/patients/{patientId}: active-targets, diary-entries, weight-trend, pending-sync-queue, daily-intake, plan-fit." "ASP.NET Core REST Controller" "Controller,Intake"
                    inWeighCtl = component "SelfWeighInsController" "api/v1/self-weigh-ins: record, synchronization." "ASP.NET Core REST Controller" "Controller,Intake"
                    inPhotoCtl = component "PatientMealPhotoAnalysesController" "api/v1/patients/{patientId}/meal-photo-analyses." "ASP.NET Core REST Controller" "Controller,Intake"
                    inIdeasCtl = component "PatientMealIdeasController" "api/v1/patients/{patientId}/meal-ideas." "ASP.NET Core REST Controller" "Controller,Intake"
                    inAcl = component "IntakeContextFacade" "IIntakeContextFacade: declared intake, daily intake and weight trend for the other contexts." "C# ACL (Open Host Service)" "ACL,Intake"
                    inApp = component "Intake Application" "DiaryEntryCommandService, SelfWeighInCommandService, MealPhotoAnalysisCommandService, MealIdeasCommandService, ActiveTargetsCacheCommandService, DailyIntakeCalculator, query services and event handlers." "C# Application Services (CQRS)" "Layer,Intake"
                    inDom = component "Intake Domain" "Aggregates DiaryEntry, SelfWeighIn, WeightTrend, MealPhotoAnalysis and ActiveTargetsCache; PlanFit and MealIdea rules. Patient-only writes." "C#" "Layer,Intake"
                    inInf = component "Intake Infrastructure" "EF Core repositories, PhotoMetadataStripper, WeightTrendRecalculationJob, MealPhotoAnalysisPurgeHostedService and in-memory caches." "EF Core" "Layer,Intake"
                }

                group "Monitoring & Adherence" {
                    moPatMonCtl = component "PatientMonitoringController" "api/v1/patients/{patientId}: evaluation-windows, daily-compliance, deviations, consistency-index, referrals." "ASP.NET Core REST Controller" "Controller,Monitoring"
                    moSchedCtl = component "ScheduledFollowUpsController" "api/v1/scheduled-follow-ups: schedule, cancellation, rescheduling; practitioner agenda." "ASP.NET Core REST Controller" "Controller,Monitoring"
                    moPatSchedCtl = component "PatientScheduledFollowUpsController" "api/v1/patients/{patientId}/scheduled-follow-ups: next, list." "ASP.NET Core REST Controller" "Controller,Monitoring"
                    moCheckInCtl = component "FollowUpCheckInController" "api/v1/scheduled-follow-ups/{followUpId}/check-in." "ASP.NET Core REST Controller" "Controller,Monitoring"
                    moReferralCtl = component "ReferralsController" "api/v1/referrals: record, closure." "ASP.NET Core REST Controller" "Controller,Monitoring"
                    moAiSumCtl = component "PatientAiSummariesController" "api/v1/patients/{patientId}: weekly-summaries/latest, suggested-questions, monitoring-summary." "ASP.NET Core REST Controller" "Controller,Monitoring"
                    moPromptCtl = component "ConsistencyPromptController" "api/v1/patients/{patientId}/consistency-index/prompt-acknowledgement." "ASP.NET Core REST Controller" "Controller,Monitoring"
                    moAcl = component "MonitoringContextFacade" "IMonitoringContextFacade: deviations, consistency and follow-ups for the other contexts." "C# ACL (Open Host Service)" "ACL,Monitoring"
                    moApp = component "Monitoring Application" "EvaluationWindow, Deviation, ConsistencyIndex, ReferralAndFollowUp, FollowUpReminder and MonitoringAi command services, query services and event handlers." "C# Application Services (CQRS)" "Layer,Monitoring"
                    moDom = component "Monitoring Domain" "Aggregates EvaluationWindow, Deviation, ConsistencyIndex, WeeklySummary, ScheduledFollowUp, PreVisitCheckIn and Referral; FollowUpReminderPlanner. Never writes to Nutritional Care." "C#" "Layer,Monitoring"
                    moInf = component "Monitoring Infrastructure" "EF Core repositories, SmtpFollowUpReminderNotifier and hosted services (FollowUpReminder, LoggingGapDetection, WeeklySummary, ConsistencyEscalation, MissedFollowUp)." "EF Core" "Layer,Monitoring"
                }

                group "Food Catalog" {
                    fcRefCtl = component "ReferenceFoodsController" "api/v1/reference-foods: search, read, local-overrides, catalog-imports." "ASP.NET Core REST Controller" "Controller,FoodCatalog"
                    fcLocalCtl = component "LocalFoodCatalogController" "api/v1/patients/{patientId}/local-food-catalog." "ASP.NET Core REST Controller" "Controller,FoodCatalog"
                    fcAcl = component "FoodCatalogContextFacade" "IFoodCatalogContextFacade: reference foods and nutrients per 100 g for Intake & Body Response." "C# ACL (Open Host Service)" "ACL,FoodCatalog"
                    fcApp = component "Food Catalog Application" "ReferenceFoodCommandService, ReferenceFoodQueryService and OnReferenceFoodTranslatedHandler." "C# Application Services (CQRS)" "Layer,FoodCatalog"
                    fcDom = component "Food Catalog Domain" "Aggregate ReferenceFood; value objects NutrientsPer100g, FoodSource, LocalName; FoodNameMatcher and IExternalFoodCatalogProvider port." "C#" "Layer,FoodCatalog"
                    fcInf = component "Food Catalog Infrastructure" "OpenFoodFactsProvider and UsdaFoodDataProvider (anticorruption layer), EF Core repository, ReferenceFoodSeeder and CatalogImportHostedService." "EF Core, HttpClient" "Layer,FoodCatalog"
                }

                group "Read Models" {
                    rmRecordCtl = component "PatientRecordController" "api/v1/patients/{patientId}/record (patient and linked practitioner)." "ASP.NET Core REST Controller" "Controller,ReadModels"
                    rmPanelCtl = component "PatientMonitoringPanelController" "api/v1/patients/{patientId}/monitoring-panel (practitioner only)." "ASP.NET Core REST Controller" "Controller,ReadModels"
                    rmSummaryCtl = component "PatientSummaryController" "api/v1/patients/{patientId}/summary." "ASP.NET Core REST Controller" "Controller,ReadModels"
                    rmRosterCtl = component "PatientRosterController" "api/v1/practitioners/{practitionerId}/patient-roster." "ASP.NET Core REST Controller" "Controller,ReadModels"
                    rmConsOvCtl = component "PatientConsultationsOverviewController" "api/v1/patients/{patientId}/consultations-overview." "ASP.NET Core REST Controller" "Controller,ReadModels"
                    rmExportCtl = component "PatientDataExportController" "api/v1/patients/{patientId}/data-export." "ASP.NET Core REST Controller" "Controller,ReadModels"
                    rmApp = component "Read Model Composers" "PatientRecord, PatientMonitoringPanel, PatientSummary, PatientRoster, PatientConsultations and PatientDataExport composers. No domain, commands or tables of their own." "C#" "Layer,ReadModels"
                }
            }

            db = container "Healthify Database" "Users, sessions, care links, consultations, assessments, diagnoses, plans, diary entries, weigh-ins, monitoring windows, follow-ups, reference foods and AI generation log." "MySQL 8.4" "Database"
        }

        # ------------------------------------------------------------------
        # Context and container relationships
        # ------------------------------------------------------------------
        # Explicit system-level relationships first, so implied ones do not duplicate them
        patient -> healthify "Logs meals and weigh-ins, follows the plan and links to a practitioner using"
        practitioner -> healthify "Runs consultations and reviews linked patients using"
        patient -> landing "Visits to learn about the product" "HTTPS"
        practitioner -> landing "Visits to learn about the product" "HTTPS"
        patient -> android "Logs meals and weigh-ins, follows the plan and links to a practitioner using"
        practitioner -> android "Runs consultations and reviews patients using"
        practitioner -> flutter "Runs consultations and reviews patients using"

        landing -> android "Links to the APK download of" "HTTPS (Firebase App Distribution)" "DownloadLink"
        landing -> flutter "Links to the APK download of" "HTTPS (Firebase App Distribution)" "DownloadLink"

        android -> androidDb "Reads from and writes to" "Room / SQLite"
        smtp -> patient "Delivers password-reset codes and consultation reminders to" "E-mail"
        smtp -> practitioner "Delivers password-reset codes and consultation reminders to" "E-mail"

        # ------------------------------------------------------------------
        # Android app components
        # ------------------------------------------------------------------
        aShell -> aIamPres "Navigates to"
        aShell -> aCrPres "Navigates to"
        aShell -> aNcPres "Navigates to"
        aShell -> aInPres "Navigates to"
        aShell -> aMoPres "Navigates to"
        aShell -> aFcPres "Navigates to"
        aShell -> aDs "Uses"
        aShell -> aCommon "Resolves dependencies through (Hilt)"

        aNet -> api "Makes API calls to" "JSON/HTTPS"
        aSync -> aStore "Persists pending operations in"
        aStore -> androidDb "Reads from and writes to" "Room / SQLite"

        aIamPres -> aIamApp "Invokes use cases of"
        aIamApp -> aIamDom "Uses models and repository interfaces of"
        aIamInf -> aIamDom "Implements repositories of"
        aIamInf -> aNet "Calls the API through"
        aIamInf -> aStore "Stores the session user in"
        aIamPres -> aDs "Uses"

        aCrPres -> aCrApp "Invokes use cases of"
        aCrApp -> aCrDom "Uses models and repository interfaces of"
        aCrInf -> aCrDom "Implements repositories of"
        aCrInf -> aNet "Calls the API through"
        aCrInf -> aStore "Caches link status in"
        aCrPres -> aDs "Uses"

        aNcPres -> aNcApp "Invokes use cases of"
        aNcApp -> aNcDom "Uses models and repository interfaces of"
        aNcInf -> aNcDom "Implements repositories of"
        aNcInf -> aNet "Calls the API through"
        aNcPres -> aDs "Uses"

        aInPres -> aInApp "Invokes use cases of"
        aInApp -> aInDom "Uses models and repository interfaces of"
        aInInf -> aInDom "Implements repositories of"
        aInInf -> aNet "Calls the API through"
        aInInf -> aSync "Queues offline diary entries and weigh-ins in"
        aInInf -> aStore "Caches active targets and the offline diary in"
        aInPres -> aDs "Uses"

        aMoPres -> aMoApp "Invokes use cases of"
        aMoApp -> aMoDom "Uses models and repository interfaces of"
        aMoInf -> aMoDom "Implements repositories of"
        aMoInf -> aNet "Calls the API through"
        aMoPres -> aDs "Uses"

        aFcPres -> aFcApp "Invokes use cases of"
        aFcApp -> aFcDom "Uses models and repository interfaces of"
        aFcInf -> aFcDom "Implements repositories of"
        aFcInf -> aNet "Calls the API through"
        aFcInf -> aStore "Caches the local food catalog in"
        aFcPres -> aDs "Uses"

        # ------------------------------------------------------------------
        # Flutter app components
        # ------------------------------------------------------------------
        fShell -> fIamPres "Navigates to"
        fShell -> fCrPres "Navigates to"
        fShell -> fNcPres "Navigates to"
        fShell -> fMoPres "Navigates to"
        fShell -> fFcPres "Navigates to"
        fShell -> fDs "Uses"
        fShell -> fCommon "Resolves dependencies through"

        fNet -> api "Makes API calls to" "JSON/HTTPS"

        fIamPres -> fIamApp "Invokes use cases of"
        fIamApp -> fIamDom "Uses models and repository interfaces of"
        fIamInf -> fIamDom "Implements repositories of"
        fIamInf -> fNet "Calls the API through"
        fIamPres -> fDs "Uses"

        fCrPres -> fCrApp "Invokes use cases of"
        fCrApp -> fCrDom "Uses models and repository interfaces of"
        fCrInf -> fCrDom "Implements repositories of"
        fCrInf -> fNet "Calls the API through"
        fCrPres -> fDs "Uses"

        fNcPres -> fNcApp "Invokes use cases of"
        fNcApp -> fNcDom "Uses models and repository interfaces of"
        fNcInf -> fNcDom "Implements repositories of"
        fNcInf -> fNet "Calls the API through"
        fNcPres -> fDs "Uses"

        fMoPres -> fMoApp "Invokes use cases of"
        fMoApp -> fMoDom "Uses models and repository interfaces of"
        fMoInf -> fMoDom "Implements repositories of"
        fMoInf -> fNet "Calls the API through"
        fMoPres -> fDs "Uses"

        fFcPres -> fFcApp "Invokes use cases of"
        fFcApp -> fFcDom "Uses models and repository interfaces of"
        fFcInf -> fFcDom "Implements repositories of"
        fFcInf -> fNet "Calls the API through"
        fFcPres -> fDs "Uses"

        # ------------------------------------------------------------------
        # Apps -> API controllers
        # ------------------------------------------------------------------
        android -> iamAuthCtl "Signs up, signs in, refreshes tokens and resets passwords" "JSON/HTTPS"
        android -> iamSessCtl "Reads the navigation shell" "JSON/HTTPS"
        android -> iamUsersCtl "Reads the user and changes the language" "JSON/HTTPS"
        flutter -> iamAuthCtl "Signs up, signs in, refreshes tokens and resets passwords" "JSON/HTTPS"
        flutter -> iamSessCtl "Reads the navigation shell" "JSON/HTTPS"
        flutter -> iamUsersCtl "Reads the user and changes the language" "JSON/HTTPS"

        android -> crInvCtl "Issues and redeems invitations" "JSON/HTTPS"
        android -> crLinksCtl "Grants or withdraws consent, acknowledges targets, discharges" "JSON/HTTPS"
        android -> crPatLinksCtl "Reads the active care link" "JSON/HTTPS"
        android -> crPracPatCtl "Lists linked patients" "JSON/HTTPS"
        android -> crAiPrefCtl "Reads and updates AI preferences" "JSON/HTTPS"
        flutter -> crInvCtl "Issues invitations" "JSON/HTTPS"
        flutter -> crLinksCtl "Reads targets status and discharges" "JSON/HTTPS"

        android -> ncConsCtl "Runs the consultation steps" "JSON/HTTPS"
        android -> ncPatConsCtl "Starts and lists consultations" "JSON/HTTPS"
        android -> ncBaselineCtl "Records the patient baseline" "JSON/HTTPS"
        android -> ncAssessCtl "Reads assessments" "JSON/HTTPS"
        android -> ncRecordCtl "Reads the clinical record" "JSON/HTTPS"
        android -> ncPlansCtl "Adjusts the plan" "JSON/HTTPS"
        android -> ncPlanVerCtl "Reads plan versions" "JSON/HTTPS"
        android -> ncReviewCtl "Works the review inbox" "JSON/HTTPS"
        flutter -> ncConsCtl "Runs the consultation steps" "JSON/HTTPS"
        flutter -> ncPatConsCtl "Starts and lists consultations" "JSON/HTTPS"
        flutter -> ncBaselineCtl "Records the patient baseline" "JSON/HTTPS"
        flutter -> ncAssessCtl "Reads assessments" "JSON/HTTPS"
        flutter -> ncRecordCtl "Reads the clinical record" "JSON/HTTPS"
        flutter -> ncReviewCtl "Works the review inbox" "JSON/HTTPS"

        android -> inDiaryCtl "Logs meals and syncs the offline diary" "JSON/HTTPS"
        android -> inPatCtl "Reads targets, diary, daily intake and weight trend" "JSON/HTTPS"
        android -> inWeighCtl "Records and syncs weigh-ins" "JSON/HTTPS"
        android -> inPhotoCtl "Sends meal photos for analysis" "JSON/HTTPS"
        android -> inIdeasCtl "Requests meal ideas" "JSON/HTTPS"

        android -> moPatMonCtl "Reads compliance, deviations and consistency" "JSON/HTTPS"
        android -> moSchedCtl "Schedules and reschedules follow-ups" "JSON/HTTPS"
        android -> moPatSchedCtl "Reads the next follow-up" "JSON/HTTPS"
        android -> moCheckInCtl "Answers the pre-visit check-in" "JSON/HTTPS"
        android -> moReferralCtl "Records referrals" "JSON/HTTPS"
        android -> moAiSumCtl "Reads weekly summaries" "JSON/HTTPS"
        android -> moPromptCtl "Acknowledges the consistency prompt" "JSON/HTTPS"
        flutter -> moSchedCtl "Schedules follow-ups and reads the agenda" "JSON/HTTPS"
        flutter -> moReferralCtl "Records and closes referrals" "JSON/HTTPS"
        flutter -> moAiSumCtl "Reads the monitoring summary" "JSON/HTTPS"

        android -> fcRefCtl "Searches foods and adds local overrides" "JSON/HTTPS"
        android -> fcLocalCtl "Downloads the local food catalog" "JSON/HTTPS"
        flutter -> fcRefCtl "Searches foods and adds local overrides" "JSON/HTTPS"

        android -> rmRecordCtl "Reads the patient record" "JSON/HTTPS"
        android -> rmPanelCtl "Reads the monitoring panel" "JSON/HTTPS"
        android -> rmSummaryCtl "Reads the patient summary" "JSON/HTTPS"
        android -> rmRosterCtl "Reads the patient roster" "JSON/HTTPS"
        android -> rmConsOvCtl "Reads the consultations overview" "JSON/HTTPS"
        android -> rmExportCtl "Exports the patient's data" "JSON/HTTPS"
        flutter -> rmRecordCtl "Reads the patient record" "JSON/HTTPS"
        flutter -> rmPanelCtl "Reads the monitoring panel" "JSON/HTTPS"
        flutter -> rmSummaryCtl "Reads the patient summary" "JSON/HTTPS"
        flutter -> rmRosterCtl "Reads the patient roster" "JSON/HTTPS"

        # ------------------------------------------------------------------
        # API components: layers inside each bounded context
        # ------------------------------------------------------------------
        iamAuthCtl -> iamApp "Delegates commands to"
        iamSessCtl -> iamApp "Delegates queries to"
        iamUsersCtl -> iamApp "Delegates commands and queries to"
        iamAcl -> iamApp "Answers through the query services of"
        iamApp -> iamDom "Uses aggregates of"
        iamInf -> iamDom "Implements repositories and services of"

        crInvCtl -> crApp "Delegates commands and queries to"
        crLinksCtl -> crApp "Delegates commands and queries to"
        crPatLinksCtl -> crApp "Delegates queries to"
        crPracPatCtl -> crApp "Delegates queries to"
        crAiPrefCtl -> crApp "Delegates commands and queries to"
        crAcl -> crApp "Answers through the query services of"
        crApp -> crDom "Uses aggregates of"
        crInf -> crDom "Implements repositories of"

        ncConsCtl -> ncApp "Delegates commands to"
        ncPatConsCtl -> ncApp "Delegates commands and queries to"
        ncBaselineCtl -> ncApp "Delegates commands and queries to"
        ncAssessCtl -> ncApp "Delegates queries to"
        ncRecordCtl -> ncApp "Delegates queries to"
        ncPlansCtl -> ncApp "Delegates commands to"
        ncPlanVerCtl -> ncApp "Delegates queries to"
        ncReviewCtl -> ncApp "Delegates commands and queries to"
        ncAcl -> ncApp "Answers through the query services of"
        ncApp -> ncDom "Uses aggregates of"
        ncInf -> ncDom "Implements repositories and policies of"

        inDiaryCtl -> inApp "Delegates commands to"
        inPatCtl -> inApp "Delegates queries to"
        inWeighCtl -> inApp "Delegates commands to"
        inPhotoCtl -> inApp "Delegates commands to"
        inIdeasCtl -> inApp "Delegates commands to"
        inAcl -> inApp "Answers through the query services of"
        inApp -> inDom "Uses aggregates of"
        inInf -> inDom "Implements repositories of"

        moPatMonCtl -> moApp "Delegates queries to"
        moSchedCtl -> moApp "Delegates commands and queries to"
        moPatSchedCtl -> moApp "Delegates queries to"
        moCheckInCtl -> moApp "Delegates commands and queries to"
        moReferralCtl -> moApp "Delegates commands to"
        moAiSumCtl -> moApp "Delegates queries to"
        moPromptCtl -> moApp "Delegates commands to"
        moAcl -> moApp "Answers through the query services of"
        moApp -> moDom "Uses aggregates of"
        moInf -> moDom "Implements repositories and notifiers of"

        fcRefCtl -> fcApp "Delegates commands and queries to"
        fcLocalCtl -> fcApp "Delegates queries to"
        fcAcl -> fcApp "Answers through the query services of"
        fcApp -> fcDom "Uses aggregates of"
        fcInf -> fcDom "Implements repositories and catalog providers of"

        rmRecordCtl -> rmApp "Delegates to"
        rmPanelCtl -> rmApp "Delegates to"
        rmSummaryCtl -> rmApp "Delegates to"
        rmRosterCtl -> rmApp "Delegates to"
        rmConsOvCtl -> rmApp "Delegates to"
        rmExportCtl -> rmApp "Delegates to"
        rmRecordCtl -> crAcl "Checks the active care link through"
        rmPanelCtl -> crAcl "Checks the active care link through"

        # ------------------------------------------------------------------
        # Cross-context integration through ACL facades
        # ------------------------------------------------------------------
        crApp -> iamAcl "Resolves identities and roles through"
        ncApp -> iamAcl "Resolves identities and languages through"
        ncApp -> crAcl "Checks the active care link through"
        ncApp -> inAcl "Reads declared intake through"
        ncApp -> moAcl "Reads deviations and consistency through"
        inApp -> iamAcl "Resolves identities through"
        inApp -> crAcl "Checks the active care link through"
        inApp -> fcAcl "Resolves foods and nutrients through"
        moApp -> iamAcl "Resolves identities and languages through"
        moApp -> crAcl "Checks the active care link through"
        moApp -> inAcl "Reads declared intake and weight trend through"
        moApp -> ncAcl "Reads prescribed targets through"
        rmApp -> iamAcl "Reads identities through"
        rmApp -> crAcl "Reads care links through"
        rmApp -> ncAcl "Reads the clinical record through"
        rmApp -> inAcl "Reads intake through"
        rmApp -> moAcl "Reads monitoring signals through"

        # ------------------------------------------------------------------
        # Shared module
        # ------------------------------------------------------------------
        iamInf -> shPersist "Extends BaseRepository and uses AppDbContext of"
        crInf -> shPersist "Extends BaseRepository and uses AppDbContext of"
        ncInf -> shPersist "Extends BaseRepository and uses AppDbContext of"
        inInf -> shPersist "Extends BaseRepository and uses AppDbContext of"
        moInf -> shPersist "Extends BaseRepository and uses AppDbContext of"
        fcInf -> shPersist "Extends BaseRepository and uses AppDbContext of"
        shPersist -> shDom "Implements IBaseRepository and IUnitOfWork of"
        shPersist -> db "Reads from and writes to" "EF Core 10, SQL/TCP 3306"

        ncApp -> shAi "Requests diagnosis, guideline and plan suggestions from"
        inApp -> shAi "Requests meal photo analysis and meal ideas from"
        moApp -> shAi "Requests weekly summaries and suggested questions from"
        shAi -> crApp "Checks AI processing consent with (IAiConsentPolicy)"
        shAi -> shGemini "Generates through (ILanguageModelClient)"
        shAi -> shPersist "Logs each generation in"
        shGemini -> gemini "Generates structured JSON with" "JSON/HTTPS"

        moInf -> shMail "Sends consultation reminders through (IMailSender)"
        shMail -> shDom "Implements IMailSender of"
        shMail -> smtp "Sends e-mail through" "SMTP 587"
        iamInf -> smtp "Sends password-reset codes through" "SMTP 587 (MailKit)"
        fcInf -> foodProviders "Imports and translates catalog snapshots from" "JSON/HTTPS"

        # ------------------------------------------------------------------
        # Deployment
        # ------------------------------------------------------------------
        production = deploymentEnvironment "Production" {

            deploymentNode "GitHub" "Organization upc-pre-202620-1acc0238-13981-nutrisync" "GitHub" {
                ghPages = deploymentNode "GitHub Pages" "landing.healthify.lat" "Static hosting" {
                    landingInstance = containerInstance landing
                }
                deploymentNode "GitHub Actions" "ubuntu-latest runners" "CI/CD" {
                    workflows = infrastructureNode "CI, Distribute and Release workflows" "Static analysis, tests, signed builds and GitHub releases." "YAML"
                }
            }

            deploymentNode "Firebase App Distribution" "Google Cloud, tester group qa" "Firebase" {
                apks = infrastructureNode "Signed release APKs" "Uploaded by the Distribute workflow of each app on every push to main." "APK"
            }

            deploymentNode "Patient's / Practitioner's Android Device" "Android 7.0 (API 24) or later" "Android" {
                androidInstance = containerInstance android
                androidDbInstance = containerInstance androidDb
            }

            deploymentNode "Practitioner's Android Device" "Android" "Android" {
                flutterInstance = containerInstance flutter
            }

            deploymentNode "Oracle Cloud Infrastructure" "platform.healthify.lat" "OCI" {
                deploymentNode "Compute Instance" "Virtual machine" "Linux VM" {
                    deploymentNode "Docker Engine" "Docker Compose" "Docker" {
                        deploymentNode "healthify-api" "mcr.microsoft.com/dotnet/aspnet:10.0, port 8080" "Docker container" {
                            apiInstance = containerInstance api
                        }
                        deploymentNode "healthify-mysql" "mysql:8.4, persistent volume healthify-mysql-data" "Docker container" {
                            dbInstance = containerInstance db
                        }
                    }
                }
            }

            deploymentNode "Google Cloud" "" "Google Cloud" {
                softwareSystemInstance gemini
            }
            deploymentNode "Open Food Facts / USDA" "" "Public APIs" {
                softwareSystemInstance foodProviders
            }
            deploymentNode "SMTP Provider" "" "E-mail" {
                softwareSystemInstance smtp
            }

            workflows -> apks "Uploads signed APKs to" "HTTPS"
            apks -> androidInstance "Installs" "HTTPS"
            apks -> flutterInstance "Installs" "HTTPS"
            landingInstance -> apks "Download buttons link to" "HTTPS"
        }
    }

    views {

        # ----------------------------- Level 1 ------------------------------
        systemContext healthify "SystemContext" "Healthify - System Context" {
            include *
            autoLayout tb
        }

        # ----------------------------- Level 2 ------------------------------
        container healthify "ContainerDiagram" "Healthify - Containers" {
            include *
            autoLayout tb
        }

        container healthify "ContainerDiagram1" "Healthify - Containers (summary)" {
            include patient practitioner android androidDb flutter api db
            autoLayout tb
        }

        # ----------------------------- Level 3: Android app -----------------
        component android "AndroidAppBCsDiagram" "Healthify Android App - Components" {
            include *
            # androidDb is shown in AndroidCoreDiagram; with it here the dagre auto-layout fails
            exclude patient practitioner landing androidDb
            exclude "*->aDs"
            autoLayout lr
        }

        component android "AndroidCoreDiagram" "Healthify Android App - Core and App Shell" {
            include aShell aNet aSync aStore aCommon aDs androidDb api
            autoLayout lr
        }

        component android "AndroidIAMDiagram" "Healthify Android App - IAM" {
            include "element.parent==android && element.tag==IAM" aNet aStore aDs api
            autoLayout tb
        }

        component android "AndroidCareRelationshipDiagram" "Healthify Android App - Care Relationship" {
            include "element.parent==android && element.tag==CareRelationship" aNet aStore aDs api
            autoLayout tb
        }

        component android "AndroidNutritionalCareDiagram" "Healthify Android App - Nutritional Care" {
            include "element.parent==android && element.tag==NutritionalCare" aNet aDs api
            autoLayout tb
        }

        component android "AndroidIntakeDiagram" "Healthify Android App - Intake & Body Response" {
            include "element.parent==android && element.tag==Intake" aNet aSync aStore aDs api
            autoLayout tb
        }

        component android "AndroidMonitoringDiagram" "Healthify Android App - Monitoring & Adherence" {
            include "element.parent==android && element.tag==Monitoring" aNet aDs api
            autoLayout tb
        }

        component android "AndroidFoodCatalogDiagram" "Healthify Android App - Food Catalog" {
            include "element.parent==android && element.tag==FoodCatalog" aNet aStore aDs api
            autoLayout tb
        }

        # ----------------------------- Level 3: Flutter app -----------------
        component flutter "FlutterAppBCsDiagram" "Healthify Practitioner App - Components" {
            include *
            exclude practitioner
            exclude "*->fDs"
            autoLayout lr
        }

        component flutter "FlutterCoreDiagram" "Healthify Practitioner App - Core and App Shell" {
            include fShell fNet fCommon fDs api
            autoLayout lr
        }

        component flutter "FlutterIAMDiagram" "Healthify Practitioner App - IAM" {
            include "element.parent==flutter && element.tag==IAM" fNet fDs api
            autoLayout tb
        }

        component flutter "FlutterCareRelationshipDiagram" "Healthify Practitioner App - Care Relationship" {
            include "element.parent==flutter && element.tag==CareRelationship" fNet fDs api
            autoLayout tb
        }

        component flutter "FlutterNutritionalCareDiagram" "Healthify Practitioner App - Nutritional Care" {
            include "element.parent==flutter && element.tag==NutritionalCare" fNet fDs api
            autoLayout tb
        }

        component flutter "FlutterMonitoringDiagram" "Healthify Practitioner App - Monitoring & Adherence" {
            include "element.parent==flutter && element.tag==Monitoring" fNet fDs api
            autoLayout tb
        }

        component flutter "FlutterFoodCatalogDiagram" "Healthify Practitioner App - Food Catalog" {
            include "element.parent==flutter && element.tag==FoodCatalog" fNet fDs api
            autoLayout tb
        }

        # ----------------------------- Level 3: API -------------------------
        component api "BackendBCsDiagram" "Healthify Platform API - Components" {
            include iamApp crApp ncApp inApp moApp fcApp rmApp "element.parent==api && element.tag==ACL" "element.parent==api && element.tag==Shared" db gemini smtp
            autoLayout tb
        }

        component api "SharedKernelDiagram" "Healthify Platform API - Shared" {
            include "element.parent==api && element.tag==Shared" ncApp inApp moApp crApp moInf db gemini smtp
            autoLayout tb
        }

        component api "ReadModelsDiagram" "Healthify Platform API - Read Models" {
            include "element.parent==api && element.tag==ReadModels" iamAcl crAcl ncAcl inAcl moAcl android flutter
            autoLayout tb
        }

        component api "IAMBackendDiagram" "Healthify Platform API - IAM" {
            include "element.parent==api && element.tag==IAM" shPersist db smtp
            autoLayout tb
        }
        component api "IAMAclDiagram" "Healthify Platform API - IAM ACL" {
            include ->iamAcl
            autoLayout lr
        }
        component api "IAMRestDiagram" "Healthify Platform API - IAM REST" {
            include "element.tag==Controller && element.tag==IAM" iamApp android flutter
            autoLayout tb
        }

        component api "CareRelationshipBackendDiagram" "Healthify Platform API - Care Relationship" {
            include "element.parent==api && element.tag==CareRelationship" iamAcl shAi shPersist db
            autoLayout tb
        }
        component api "CareRelationshipAclDiagram" "Healthify Platform API - Care Relationship ACL" {
            include ->crAcl
            autoLayout lr
        }
        component api "CareRelationshipRestDiagram" "Healthify Platform API - Care Relationship REST" {
            include "element.tag==Controller && element.tag==CareRelationship" crApp android flutter
            autoLayout tb
        }

        component api "NutritionalCareBackendDiagram" "Healthify Platform API - Nutritional Care" {
            include "element.parent==api && element.tag==NutritionalCare" iamAcl crAcl inAcl moAcl shAi shPersist db
            autoLayout lr
        }
        component api "NutritionalCareAclDiagram" "Healthify Platform API - Nutritional Care ACL" {
            include ->ncAcl
            autoLayout lr
        }
        component api "NutritionalCareRestDiagram" "Healthify Platform API - Nutritional Care REST" {
            include "element.tag==Controller && element.tag==NutritionalCare" ncApp android flutter
            autoLayout lr
        }

        component api "IntakeBackendDiagram" "Healthify Platform API - Intake & Body Response" {
            include "element.parent==api && element.tag==Intake" iamAcl crAcl fcAcl shAi shPersist db
            autoLayout tb
        }
        component api "IntakeAclDiagram" "Healthify Platform API - Intake & Body Response ACL" {
            include ->inAcl
            autoLayout lr
        }
        component api "IntakeRestDiagram" "Healthify Platform API - Intake & Body Response REST" {
            include "element.tag==Controller && element.tag==Intake" inApp android
            autoLayout tb
        }

        component api "MonitoringBackendDiagram" "Healthify Platform API - Monitoring & Adherence" {
            include "element.parent==api && element.tag==Monitoring" iamAcl crAcl inAcl ncAcl shAi shMail shPersist db
            autoLayout lr
        }
        component api "MonitoringAclDiagram" "Healthify Platform API - Monitoring & Adherence ACL" {
            include ->moAcl
            autoLayout lr
        }
        component api "MonitoringRestDiagram" "Healthify Platform API - Monitoring & Adherence REST" {
            include "element.tag==Controller && element.tag==Monitoring" moApp android flutter
            autoLayout lr
        }

        component api "FoodCatalogBackendDiagram" "Healthify Platform API - Food Catalog" {
            include "element.parent==api && element.tag==FoodCatalog" shPersist db foodProviders
            autoLayout tb
        }
        component api "FoodCatalogAclDiagram" "Healthify Platform API - Food Catalog ACL" {
            include ->fcAcl
            autoLayout lr
        }
        component api "FoodCatalogRestDiagram" "Healthify Platform API - Food Catalog REST" {
            include "element.tag==Controller && element.tag==FoodCatalog" fcApp android flutter
            autoLayout tb
        }

        # ----------------------------- Deployment --------------------------
        deployment healthify production "DeploymentDiagram" "Healthify - Deployment (Production)" {
            include *
            exclude "relationship.tag==DownloadLink"
            autoLayout tb
        }

        styles {
            element "Element" {
                color #ffffff
            }
            element "Person" {
                shape Person
                background #22c94a
                stroke #1a9e3a
            }
            element "Software System" {
                background #1168bd
            }
            element "External" {
                background #999999
            }
            element "Container" {
                background #1168bd
            }
            element "Web Browser" {
                shape WebBrowser
                background #f0a500
            }
            element "Mobile App" {
                shape MobileDevicePortrait
                background #0b5aa0
            }
            element "API" {
                background #5a2fd6
            }
            element "Database" {
                shape Cylinder
                background #2e6590
            }
            element "OnDevice" {
                background #2e8bab
            }
            element "Component" {
                height 350
                background #85bbf0
                color #000000
            }
            element "Controller" {
                width 760
                background #b9a3f5
                color #000000
            }
            element "ACL" {
                width 600
                background #f5c26b
                color #000000
            }
            element "Shared" {
                background #2e8bab
                color #ffffff
            }
            element "Core" {
                background #2e8bab
                color #ffffff
            }
            element "Shell" {
                background #4f9fd6
                color #ffffff
            }
            element "Infrastructure Node" {
                background #cccccc
                color #000000
            }
            relationship "Relationship" {
                dashed true
            }
        }

    }

}
