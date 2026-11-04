# CAPÍTULO IV: PRODUCT IMPLEMENTATION & VALIDATION

## 4.1. Software Configuration Management

### 4.1.1. Software Development Environment Configuration

La solución de Healthify tiene cuatro productos digitales: el **landing page** (sitio estático), los **RESTful Web Services** (backend en ASP.NET Core), la **aplicación móvil nativa de Android** (Kotlin con Jetpack Compose), que atiende al paciente y al nutricionista, y la **aplicación Flutter para nutricionistas**, que porta la vista del rol nutricionista de la app nativa. Las herramientas que el equipo usa para trabajar sobre ellos se agrupan por tipo de actividad.

**Project Management**

<p class="caption"><strong>Tabla 217</strong><br><em>Herramientas de gestión de proyectos</em></p>

| Producto | Tipo | Propósito en el proyecto | Referencia |
|---|---|---|---|
| GitHub (Issues y Pull Requests) | SaaS | Seguimiento de los cambios por rama y revisión de cada cambio mediante pull requests. | [github.com](https://github.com) |
| Trello | SaaS | Tablero del product backlog y tablero del sprint backlog. | [trello.com](https://trello.com) |
| WhatsApp | SaaS / móvil | Coordinación diaria del equipo y avisos de reuniones. | [whatsapp.com](https://www.whatsapp.com) |

**Requirements Management**

<p class="caption"><strong>Tabla 218</strong><br><em>Herramientas de gestión de requisitos</em></p>

| Producto | Tipo | Propósito en el proyecto | Referencia |
|---|---|---|---|
| Miro | SaaS | Sesiones de EventStorming (Big Picture y Design Level) y Domain Message Flows. | [miro.com](https://miro.com) |
| PlantUML (con C4-PlantUML) | Línea de comandos / extensión de IDE | Diagramas C4 (incluido el de despliegue), Bounded Context Canvas, diagramas de clases y de base de datos, versionados como archivos `.puml` en la carpeta `docs/` del repositorio del informe. | [plantuml.com](https://plantuml.com) |
| UXPressia | SaaS | User Personas y User Journey Mapping. | [uxpressia.com](https://uxpressia.com) |

**Product UX/UI Design**

<p class="caption"><strong>Tabla 219</strong><br><em>Herramientas de diseño UX/UI del producto</em></p>

| Producto | Tipo | Propósito en el proyecto | Referencia |
|---|---|---|---|
| Figma | SaaS | Sistema de diseño «Healthify M3», wireframes, mock-ups, wireflows, user flows y prototipos del landing page y de la aplicación móvil. El archivo «Healthify» contiene las páginas *Landing Page*, *Wireframes Mobile*, *Mockup*, *SVG* (íconos e ilustraciones exportables) y *Flujos · Reporte* (los cinco wireflows y los cinco user flows). Las pantallas de la app que muestra el landing page se exportan en WebP desde la página *Mockup*. | [figma.com](https://www.figma.com) |

**Software Development**

<p class="caption"><strong>Tabla 220</strong><br><em>Herramientas de desarrollo de software</em></p>

| Producto | Tipo | Propósito en el proyecto | Referencia |
|---|---|---|---|
| Android Studio | Escritorio (IDE) | Desarrollo de la aplicación nativa en Kotlin y Jetpack Compose, con emulador y vista previa de pantallas (`@Preview`), y de la aplicación Flutter con el plugin de Flutter. | [developer.android.com/studio](https://developer.android.com/studio) |
| JetBrains Rider | Escritorio (IDE) | Desarrollo del backend en C# (.NET 10), migraciones de Entity Framework Core y ejecución de pruebas. | [jetbrains.com/rider](https://www.jetbrains.com/rider/) |
| WebStorm | Escritorio (IDE) | Desarrollo del landing page (HTML, CSS y JavaScript). | [jetbrains.com/webstorm](https://www.jetbrains.com/webstorm/) |
| Visual Studio Code | Escritorio (editor) | Edición del informe en Markdown y de los diagramas PlantUML. | [code.visualstudio.com](https://code.visualstudio.com) |
| .NET SDK 10 | Escritorio | Compilación, ejecución y pruebas del backend. | [dotnet.microsoft.com/download](https://dotnet.microsoft.com/download) |
| JDK 21, Gradle 9.6 y Android Gradle Plugin 9.4 | Escritorio | Compilación de la aplicación nativa; el JDK se resuelve por `gradle-daemon-jvm.properties`. | [gradle.org](https://gradle.org) |
| Flutter SDK 3.47 (Dart 3.13) | Escritorio | Compilación, análisis estático, pruebas y generación de código (`build_runner`, `gen-l10n`) de la aplicación Flutter. | [flutter.dev](https://flutter.dev) |
| MySQL 8.4 | Escritorio / contenedor | Base de datos del backend. | [dev.mysql.com/downloads](https://dev.mysql.com/downloads/) |
| Docker Desktop | Escritorio | Ejecución local del backend y de MySQL con `docker compose`. | [docker.com](https://www.docker.com/products/docker-desktop/) |
| Node.js (`npx serve`) | Escritorio | Servidor local para revisar el landing page. | [nodejs.org](https://nodejs.org) |

**Software Testing**

<p class="caption"><strong>Tabla 221</strong><br><em>Herramientas de pruebas de software</em></p>

| Producto | Tipo | Propósito en el proyecto | Referencia |
|---|---|---|---|
| xUnit y NSubstitute | Librerías de .NET | Pruebas unitarias y de integración del backend (`dotnet test healthify-platform.sln`). Las pruebas de integración con MySQL se activan con la variable `HEALTHIFY_IT_MYSQL`. | [xunit.net](https://xunit.net) |
| JUnit 4, MockK, Turbine, `kotlinx-coroutines-test` y MockWebServer | Librerías de Kotlin | Pruebas de JVM de los use cases, ViewModels, mappers y clientes HTTP de la aplicación nativa (`./gradlew :app:testDebugUnitTest`). | [junit.org](https://junit.org/junit4/) |
| `flutter_test`, `bloc_test` y `mocktail` | Librerías de Dart | Pruebas de widgets, cubits, use cases y mappers de la aplicación Flutter (`flutter test --coverage`). | [docs.flutter.dev/testing](https://docs.flutter.dev/testing/overview) |
| Swagger UI (Swashbuckle) | Incluido en el backend | Exploración y prueba manual de los endpoints REST en `/swagger`. | [swagger.io](https://swagger.io) |
| Android Lint | Incluido en Android Gradle Plugin | Análisis estático de la aplicación nativa (`./gradlew :app:lintDebug`). | [developer.android.com/studio/write/lint](https://developer.android.com/studio/write/lint) |
| Dart analyzer con `flutter_lints` | Incluido en el SDK de Flutter | Análisis estático de la aplicación Flutter (`flutter analyze`). | [pub.dev/packages/flutter_lints](https://pub.dev/packages/flutter_lints) |

**Software Deployment**

<p class="caption"><strong>Tabla 222</strong><br><em>Herramientas de despliegue de software</em></p>

| Producto | Tipo | Propósito en el proyecto | Referencia |
|---|---|---|---|
| GitHub Pages | SaaS | Publicación del landing page desde la rama `main`, con el dominio propio `landing.healthify.lat`. | [pages.github.com](https://pages.github.com) |
| GitHub Actions | SaaS | Flujo `Release` del backend, y flujos `CI` y `Distribute` de cada aplicación móvil: análisis estático, pruebas, compilación firmada y creación de la versión en GitHub. | [github.com/features/actions](https://github.com/features/actions) |
| Firebase App Distribution | SaaS | Entrega de los APK firmados de ambas aplicaciones al grupo de prueba `qa`. Los botones de descarga del landing page enlazan a la invitación de Firebase de cada aplicación: «Nutricionista» a la Flutter y «Paciente» a la nativa. | [firebase.google.com/products/app-distribution](https://firebase.google.com/products/app-distribution) |
| GitHub Releases | SaaS | Cada versión de las aplicaciones adjunta su APK (`healthify-vX.Y.Z.apk`); el backend publica sus notas de versión. | [docs.github.com/repositories/releasing-projects-on-github](https://docs.github.com/en/repositories/releasing-projects-on-github) |
| Docker y Docker Compose | Motor de contenedores | Empaquetado del backend (`Dockerfile`) y orquestación del API con MySQL (`docker-compose.yml`). | [docs.docker.com](https://docs.docker.com) |
| Oracle Cloud Infrastructure | SaaS / IaaS | Máquina virtual que aloja los contenedores del backend, publicado en `platform.healthify.lat`. | [oracle.com/cloud](https://www.oracle.com/cloud/) |

**Software Documentation**

<p class="caption"><strong>Tabla 223</strong><br><em>Herramientas de documentación de software</em></p>

| Producto | Tipo | Propósito en el proyecto | Referencia |
|---|---|---|---|
| GitHub | SaaS | Repositorio del informe (`healthify-report`) y README de cada producto. | [github.com](https://github.com) |
| Markdown | Formato | Redacción del informe y de la documentación de cada repositorio. | [markdownguide.org](https://www.markdownguide.org) |
| Swagger / OpenAPI | Incluido en el backend | Documentación interactiva de los servicios REST. | [swagger.io](https://swagger.io) |

### 4.1.2. Source Code Management

El equipo usa **GitHub** como plataforma de control de versiones, dentro de la organización del curso. Cada producto tiene su propio repositorio.

<p class="caption"><strong>Tabla 224</strong><br><em>Repositorios del proyecto en GitHub</em></p>

| Producto | Repositorio | URL |
|---|---|---|
| Landing Page | `healthify-website` | https://github.com/upc-pre-202620-1acc0238-13981-nutrisync/healthify-website |
| Web Services (backend) | `healthify-platform` | https://github.com/upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform |
| Mobile Application (Android nativa) | `healthify-android-app` | https://github.com/upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app |
| Mobile Application (Flutter, nutricionista) | `healthify-flutter-app` | https://github.com/upc-pre-202620-1acc0238-13981-nutrisync/healthify-flutter-app |
| Informe del proyecto | `healthify-report` | https://github.com/upc-pre-202620-1acc0238-13981-nutrisync/healthify-report |

El repositorio del backend contiene el proyecto `Healthify.Platform` y el proyecto de pruebas `Healthify.Platform.Tests` (unitarias y de integración) en la misma solución. El landing page no tiene dependencias: se compone de cuatro archivos HTML, una hoja de estilos y dos scripts. La aplicación nativa es un solo módulo Gradle (`app`) con el código en `pe.edu.upc.healthify`, dividido en `core`, `features` (un paquete por bounded context) y `navigation`. La aplicación Flutter sigue la misma división en `lib/core`, `lib/features` y `lib/navigation`, y sus pruebas en `test/` replican esa estructura.

**GitFlow**

El equipo aplica GitFlow, según el modelo de Vincent Driessen en «A successful Git branching model». Todos los cambios pasan por un pull request y ninguna rama de trabajo se integra directamente en `main`.

<p class="caption"><strong>Tabla 225</strong><br><em>Ramas de GitFlow y su convención de nombres</em></p>

| Rama | Origen | Destino | Convención de nombre | Uso |
|---|---|---|---|---|
| `main` | — | — | `main` | Código publicado. Cada integración en `main` corresponde a una versión con su tag. |
| `develop` | `main` | — | `develop` | Integración continua de lo que se desarrolla. Es la rama base de los features. |
| Feature | `develop` | `develop` | `feature/<contexto-o-funcionalidad>` en minúsculas y con guiones | Una rama por funcionalidad o bloque de trabajo. |
| Fix | `develop` | `develop` | `fix/<descripcion-corta>` | Corrección de un defecto detectado antes de publicar. |
| Refactor | `develop` | `develop` | `refactor/<descripcion-corta>` | Reestructuración del código sin cambio de comportamiento. |
| Release | `develop` | `main` y `develop` | `release/vX.Y.Z` | Preparación de una versión: ajuste del número de versión y revisión final. |
| Hotfix | `main` | `main` y `develop` | `hotfix/<descripcion-corta>` | Corrección urgente de un error de la versión publicada. |

Hasta ahora no se han necesitado ramas `release` ni `hotfix`: el número de versión se sube con un commit en `develop` y la versión se publica al integrar `develop` en `main`.

Ejemplos reales de los repositorios: `feature/platform-foundation`, `feature/password-recovery`, `feature/plan-fit-suggestion`, `fix/monitoring-clinical-day` y `refactor/retire-legacy-clinical-endpoints` en el backend; `feature/redesign-website`, `feature/testimonials`, `feature/dual-app-download` y `fix/restore-sources` en el landing page; `feature/ci-cd-app-distribution`, `feature/home-gauge-roster-and-reminders` y `feature/interview-validation-fixes` en la aplicación nativa; `feature/core-foundation`, `feature/auth-onboarding` y `feature/patient-record-consultation` en la aplicación Flutter; y `feature/chapter2-bounded-context` en el informe.

Flujo de trabajo de una funcionalidad:

1. Se crea `feature/<nombre>` desde `develop`.
2. Se hacen commits pequeños con Conventional Commits.
3. Se abre un pull request hacia `develop`, que otro integrante revisa. Al integrarse, la rama se elimina.
4. Para publicar, se sube el número de versión en `develop` y se integra `develop` en `main` mediante un pull request. En el backend y en las aplicaciones móviles, el flujo de GitHub Actions crea el tag a partir de esa versión; en el landing page el tag se crea a mano.

**Semantic Versioning**

Las versiones usan Semantic Versioning 2.0.0 con el formato `vMAJOR.MINOR.PATCH`:

- **MAJOR**: cambios incompatibles, por ejemplo un cambio en el contrato de la API o un rediseño completo.
- **MINOR**: funcionalidad nueva compatible con lo anterior.
- **PATCH**: corrección de errores.

<p class="caption"><strong>Tabla 226</strong><br><em>Versionado semántico por producto</em></p>

| Producto | Tags publicados | Dónde se define la versión |
|---|---|---|
| Backend | `v0.1.0`, `v0.5.0`, `v1.0.0`, `v1.1.0`, `v1.1.1` y de `v1.2.0` a `v1.6.0` | Elemento `<Version>` de `Healthify.Platform.csproj`. El flujo `Release` lee ese valor y crea el tag `v<versión>` con las notas de la versión. |
| Landing Page | `v1.0.0`, `v1.0.1`, `v2.0.0`, `v2.1.0` y `v2.2.0` | Tag en `main`. La versión `v2.0.0` corresponde al rediseño del sitio. |
| Aplicación nativa | De `v1.0.0` a `v2.1.0` (14 versiones, entre ellas `v1.4.1`, `v1.5.1` y `v1.7.1`) | `versionName` de `app/build.gradle.kts`. El `versionCode` lo asigna el flujo `Distribute` con el número de ejecución. |
| Aplicación Flutter | `v1.0.0`, `v1.1.0`, `v1.2.0`, `v1.3.0` y `v1.3.1` | Campo `version` de `pubspec.yaml` (`1.3.1+11`). El número de compilación lo asigna el flujo `Distribute` con el número de ejecución. |
| Informe | `1.0.0` (AV1) y `2.0.0` (TB1) | Registro de versiones del `README.md`. |

**Conventional Commits**

Los mensajes de commit siguen Conventional Commits 1.0.0, en inglés, en modo imperativo y en minúsculas:

```
<type>(<scope>): <description>

[optional body]
```

<p class="caption"><strong>Tabla 227</strong><br><em>Tipos de commit según Conventional Commits</em></p>

| Tipo | Uso | Ejemplo real |
|---|---|---|
| `feat` | Funcionalidad nueva | `feat(care-relationship): add invitation, care link and AI preference endpoints` |
| `fix` | Corrección de un defecto | `fix(food-catalog): resolve USDA search path relative to the base address` |
| `docs` | Documentación | `docs(readme): add running instructions` |
| `test` | Pruebas | `test(home): cover the tolerance band of the energy goal` |
| `refactor` | Cambio interno sin cambio de comportamiento | `refactor(nutritionalcare): extract the consultation primary button` |
| `chore` | Mantenimiento y configuración | `chore(csproj): set project version to 1.6.0` |
| `build` | Sistema de compilación y dependencias | `build(app): bump version to 2.0.0` |
| `ci` | Integración y entrega continuas | `ci(release): add release workflow` |
| `style` | Formato sin cambio de lógica | Sin uso hasta ahora |

El alcance (`scope`) indica el módulo afectado: un bounded context (`iam`, `care-relationship`, `nutritional-care`, `food-catalog`, `intake`, `monitoring` en el backend; `carerelationship`, `nutritionalcare`, `foodcatalog` en las aplicaciones móviles), una capa compartida (`designsystem`, `l10n`, `navigation`), una página (`index`, `css`, `i18n`) o un archivo de configuración (`csproj`, `app`, `release`, `readme`).

### 4.1.3. Source Code Style Guide & Conventions

Para todos los lenguajes, los nombres de paquetes, clases, funciones, variables, archivos y ramas están en **inglés**. Los textos que ve el usuario están en español y en inglés mediante archivos de recursos, no dentro del código. Los criterios de aceptación en Gherkin son la excepción y se redactan en español. Se adoptan las guías estándar de cada lenguaje, y la configuración del equipo se resume en el archivo `README.md` de cada repositorio.

**HTML**

Guías: *HTML Style Guide and Coding Conventions* (W3Schools) y *Google HTML/CSS Style Guide*.

- Etiquetas y atributos en minúsculas, indentación de 2 espacios y `<!DOCTYPE html>` en cada página.
- Estructura semántica: `header`, `nav`, `main`, `section`, `footer`, con un solo `h1` por página y los encabezados en orden.
- Atributos de accesibilidad: `lang`, `alt` en imágenes, `aria-label` y `aria-labelledby` en regiones y controles, y un enlace «Saltar al contenido principal».
- Cada texto traducible lleva un atributo de i18n en lugar de texto fijo en el script: `data-i18n` (texto), `data-i18n-html` (texto con marcado), `data-i18n-placeholder`, `data-i18n-aria` o `data-i18n-alt`.

**CSS**

Guía: *Google HTML/CSS Style Guide*.

- Nomenclatura **BEM** en minúsculas con guiones: bloque `nav`, elemento `nav__link`, modificador con `--`.
- Los colores, tipografías, radios y medidas se definen una sola vez como variables en `:root` con los valores del sistema de diseño de Figma (`--orange-400`, `--green-700`, `--font-heading`, `--r-16`), y la escala tipográfica como atajos `font` que llevan en un comentario el nombre del estilo de Figma (`--t-display-xl` es *Web/Display XL*).
- Enfoque *mobile first*: el diseño de escritorio empieza en 1024 px y el encabezado completo en 1200 px. Las animaciones respetan `prefers-reduced-motion`.

**JavaScript**

Guía: *Google JavaScript Style Guide*.

- `'use strict'`, `const` y `let` (sin `var`), funciones y variables en `camelCase` y constantes en `UPPER_SNAKE_CASE`.
- Un archivo por responsabilidad: `i18n.js` (traducciones y motor de idioma) y `main.js` (selector de idioma, menú móvil, carrusel de pasos, preguntas frecuentes con filtros, índice de términos y formulario de contacto).
- Funciones de inicialización con nombre `initXxx()` (`initLangSwitch()`, `initMenu()`, `initFAQ()`, `initContactForm()`).

**C# (backend)**

Guías: *C# Coding Conventions* de Microsoft y la guía de arquitectura del backend del equipo.

- `PascalCase` para clases, métodos y propiedades; `camelCase` para variables y parámetros; `_camelCase` para campos privados; interfaces con prefijo `I`.
- Un espacio de nombres por carpeta, con la forma `Healthify.Platform.<Contexto>.<Capa>` (por ejemplo `Healthify.Platform.Iam.Domain.Model.Aggregates`).
- Organización por bounded context, cada uno con las carpetas `Domain`, `Application`, `Infrastructure`, `Interfaces` y `Resources`. Entre contextos solo se importan las fachadas `Interfaces.Acl` y los eventos `Domain.Model.Events`.
- CQRS con servicios de comandos y de consultas (`CommandServices` y `QueryServices`), y eventos de dominio publicados después de confirmar la transacción.
- Nulabilidad activada (`<Nullable>enable</Nullable>`), documentación XML de los endpoints para Swagger y mensajes de error con código estable (`extensions.code`) y localizados en español e inglés con archivos `.resx`.

**Kotlin y Jetpack Compose (aplicación nativa) y Dart y Flutter (aplicación para nutricionistas)**

Guías: *Kotlin Coding Conventions* y *Android Kotlin Style Guide* para la aplicación nativa; *Effective Dart* y las reglas de `flutter_lints` para la aplicación Flutter.

<p class="caption"><strong>Tabla 228</strong><br><em>Convenciones de código de las aplicaciones móviles</em></p>

| Elemento | Convención | Ejemplo en Kotlin | Ejemplo en Flutter |
|---|---|---|---|
| Use case | `VerbNounUseCase` | `RedeemInvitationUseCase` | `IssueInvitationUseCase` |
| Repositorio | `NounRepository` y `NounRepositoryImpl` | `CareLinkRepository` | `PractitionerCareLinkRepository` |
| DTO y entidad local | `NounDto` y `NounEntity` | `DiaryEntryDto` | `InvitationDto` |
| Estado de pantalla | `XxxUiState` con `XxxViewModel` (Kotlin); `XxxState` con `XxxCubit` (Flutter) | `DiaryUiState` | `InvitePatientState` |
| Rutas de navegación | `NounRoute` | `ConsentRoute` (serializable) | `DischargePatientRoute` |
| Pantallas | `XxxScreen` con estado; en Kotlin, `XxxContent` sin estado | `DiaryScreen` | `InvitePatientScreen` |

- Arquitectura de cuatro capas por bounded context (`domain`, `application`, `presentation` e `infrastructure`) con dependencias hacia el dominio. `domain` y `application` no dependen del framework.
- Las reglas de negocio y las validaciones viven en entidades y objetos de valor (en Kotlin, `init { require(...) }`), no en ViewModels, cubits ni pantallas.
- Kotlin: un solo `StateFlow<XxxUiState>` por pantalla, eventos únicos mediante `Channel` y `collectAsStateWithLifecycle()`. Cada Composable público recibe `modifier: Modifier = Modifier` como primer parámetro opcional, y cada `XxxContent` tiene un `@Preview` por estado relevante (normal, carga, vacío, sin conexión y error) con `widthDp = 360` y `heightDp = 800`.
- Flutter: archivos en `snake_case` (`invite_patient_cubit.dart`) y clases en `UpperCamelCase`. Los estados son inmutables y se generan con `freezed`; los DTO se serializan con `json_serializable`. La inyección de dependencias usa `get_it` (un módulo por contexto en `infrastructure/di`) y la navegación usa `go_router`.
- Nada fijo en el código de las pantallas: los colores, tipografías, dimensiones y formas vienen del tema (`HealthifyTheme` en Kotlin y el sistema de diseño de `lib/core/designsystem` en Flutter), y los textos de `strings.xml` o de los archivos ARB (`app_es.arb` como plantilla y `app_en.arb`).
- Los DTO y las entidades locales no salen de `infrastructure`: los mappers (`toDomain()`, `toEntity()`, `toDto()`) los convierten.
- Las versiones de las dependencias se declaran solo en `gradle/libs.versions.toml` (Kotlin) o fijas, sin rangos, en `pubspec.yaml` (Flutter).

**Pruebas y especificaciones**

- Pruebas del backend en xUnit, con nombres que describen el comportamiento (`PersonNameTests`, `RefreshRetryGraceTests`) y un archivo de pruebas por clase probada, en una carpeta que replica la del proyecto.
- Pruebas de la aplicación nativa en JUnit 4 con MockK y Turbine, con los dobles de prueba en la misma ruta que la clase probada.
- Pruebas de la aplicación Flutter con `flutter_test`, `bloc_test` y `mocktail`, en archivos `xxx_test.dart` dentro de `test/`, con la misma ruta que el archivo probado en `lib/`.
- Los criterios de aceptación de las historias de usuario se escriben en **Gherkin** (*Dado que*, *Cuando*, *Entonces*), siguiendo *Gherkin Conventions for Readable Specifications*: un escenario por comportamiento, en tercera persona y sin detalles de interfaz. Son la única parte redactada en español, porque forman parte de las historias del capítulo 2.

### 4.1.4. Software Deployment Configuration

Cada producto digital tiene su propio proceso de publicación a partir de su repositorio.

**Landing Page**

El landing page es un sitio estático (HTML, CSS y JavaScript) que se publica con **GitHub Pages** desde la rama `main` del repositorio `healthify-website`, con el dominio propio `landing.healthify.lat` definido en un archivo `CNAME`. Sus botones de descarga ofrecen dos opciones, «Nutricionista» y «Paciente», y cada una lleva a la invitación de Firebase App Distribution de su aplicación: la Flutter y la nativa.

1. El cambio se integra en `develop` mediante un pull request.
2. Se integra `develop` en `main` con otro pull request y se crea el tag de la versión (la última es `v2.2.0`).
3. GitHub Pages publica el contenido de `main` en el dominio configurado.
4. Para revisarlo en local: `npx serve -l 4173 .`

**Web Services (backend)**

El backend se empaqueta en una imagen de Docker de dos etapas (`Dockerfile`): la primera usa `dotnet/sdk:10.0` para restaurar y publicar en modo *Release*, y la segunda copia el resultado a `dotnet/aspnet:10.0` y expone el puerto 8080. El archivo `docker-compose.yml` levanta dos contenedores: `healthify-api` y `healthify-mysql` (MySQL 8.4 con volumen persistente y comprobación de salud). El API espera a que la base de datos esté disponible y aplica las migraciones al iniciar.

1. En la máquina virtual de Oracle Cloud se clona el repositorio en la rama `main`.
2. Se definen las variables de entorno, sin guardarlas en el repositorio:

   <p class="caption"><strong>Tabla 229</strong><br><em>Variables de entorno de despliegue</em></p>

   | Variable | Significado |
   |---|---|
   | `JWT_SECRET` | Clave de firma de los tokens, de al menos 32 caracteres (obligatoria; sin ella el API no inicia). |
   | `DATABASE_PASSWORD`, `DATABASE_SCHEMA`, `DATABASE_USER`, `DATABASE_HOST` | Credenciales y esquema de MySQL. |
   | `USDA_API_KEY` | Clave de USDA FoodData Central; vacía desactiva ese proveedor. |
   | `SMTP_HOST`, `SMTP_USERNAME`, `SMTP_PASSWORD`, `SMTP_FROM` | Servidor de correo para el código de recuperación de contraseña; sin `SMTP_HOST` no se envía ningún correo. |
   | `ASPNETCORE_ENVIRONMENT` | Entorno de ejecución. `Production` carga `appsettings.Production.json` (zona horaria clínica `America/Lima`, bloqueo de cuenta y vigencia de los códigos de recuperación). |
   | `Ai__Enabled`, `Ai__Gemini__ApiKey` | Activan las funciones con IA. En `appsettings.Production.json` la IA está apagada (`Ai:Enabled=false`) y configurada con el modelo `gemini-3.5-flash`. |

3. Se ejecuta `docker compose up --build -d`.
4. El API queda disponible en `https://platform.healthify.lat` y su documentación en `/swagger`.

Además, el flujo de GitHub Actions `Release` (`.github/workflows/release.yml`) se ejecuta con cada push a `main`: restaura y compila la solución en *Release*, lee `<Version>` de `Healthify.Platform.csproj` (hoy `1.6.0`) y crea el release `v<versión>` con las notas generadas automáticamente.

**Mobile Applications (Android nativa y Flutter)**

Las dos aplicaciones apuntan al backend en `https://platform.healthify.lat/api/v1/`. En la aplicación nativa, la dirección (`BASE_URL`) se fija en cada tipo de compilación de `app/build.gradle.kts`; en la Flutter es el valor por defecto de `BASE_URL` y se puede cambiar al compilar con `--dart-define=BASE_URL=...`.

Cada repositorio tiene dos flujos de GitHub Actions con la misma forma:

- **`CI`** (`.github/workflows/ci.yml`): se ejecuta en cada pull request hacia `develop` o `main` y en cada push a `develop`. Hace el análisis estático, corre las pruebas, compila un APK de depuración y guarda los reportes como artefacto.
- **`Distribute`** (`.github/workflows/distribute.yml`): se ejecuta en cada push a `main`. Primero comprueba que la versión no esté publicada; si ya existe un tag con ese número, falla y pide subir la versión. Después firma el APK con el keystore guardado en los secretos del repositorio, lo sube a Firebase App Distribution para el grupo `qa` con las notas de los últimos diez commits, y crea el release `vX.Y.Z` en GitHub con el APK adjunto. El keystore y las credenciales de Firebase se borran del runner al terminar.

<p class="caption"><strong>Tabla 230</strong><br><em>Pasos de compilación de las aplicaciones móviles</em></p>

| Paso | Aplicación nativa (Gradle) | Aplicación Flutter |
|---|---|---|
| Generación de código | — (KSP corre dentro de la compilación) | `dart run build_runner build -d` y `flutter gen-l10n` |
| Análisis estático | `./gradlew :app:lintDebug` | `flutter analyze` |
| Pruebas | `./gradlew :app:testDebugUnitTest` | `flutter test --coverage` |
| APK de depuración | `./gradlew :app:assembleDebug` | `flutter build apk --debug` |
| APK firmado y distribución | `./gradlew assembleRelease appDistributionUploadRelease` | `flutter build apk --release` y `firebase appdistribution:distribute` |

La aplicación nativa (`pe.edu.upc.healthify`, versión 2.1.0) se instala en Android 7.0 (API 24) o superior. Guarda los datos de sesión cifrados en el dispositivo y funciona sin conexión para registrar comidas y autopesajes, que se sincronizan al recuperar la red. La aplicación Flutter (`pe.edu.upc.healthify.practitioner`, versión 1.3.1) usa otro identificador de paquete, así que convive en el mismo dispositivo con la nativa; guarda la sesión con `flutter_secure_storage`.

**Deployment Diagram (C4 Model)**

El diagrama de despliegue muestra los nodos donde se ejecuta cada artefacto. GitHub Pages sirve el landing page y GitHub Actions compila las aplicaciones y sube sus APK a Firebase App Distribution, desde donde se instalan en los dispositivos Android: la aplicación nativa en el del paciente o del nutricionista, y la aplicación Flutter en el del nutricionista. La máquina virtual de Oracle Cloud ejecuta Docker Engine con los contenedores del API (ASP.NET Core 10) y de la base de datos (MySQL 8.4). Las dos aplicaciones consumen el API por JSON sobre HTTPS; el API se conecta a la base de datos por la red interna de Docker y llama a Gemini, a Open Food Facts, a USDA FoodData Central y al servidor SMTP. El fuente del diagrama está en `docs/c4-diagrams/deployment.puml`.

<p class="caption"><strong>Figura 143</strong><br><em>Diagrama de despliegue de Healthify</em></p>

![Deployment Diagram](../assets/img/artifacts/healthify-DeploymentDiagram-tb2.png)

## 4.2. Landing Page & Mobile Application Implementation

### 4.2.1. Sprint 1

#### 4.2.1.1. Sprint Planning 1

El Sprint 1 es el primer sprint de implementación. Se desarrolló entre el 27/09/2026 y el 09/10/2026 y cubre los tres productos digitales: el **landing page**, los **RESTful Web Services** (backend) y la **aplicación móvil Android**. Las historias incluidas son las ocho historias de usuario del épico EP10 (Landing Page), las diez historias técnicas del épico EP_TS (RESTful API) y las 37 historias de usuario de la aplicación (US01 a US31 y US39 a US44), definidas en la sección 2.4.1. Al cierre del sprint, el Product Owner aceptó 45 de las 55 historias comprometidas (197 de 236 Story Points); las otras diez quedaron con escenarios de aceptación pendientes y volvieron al Product Backlog para el Sprint 2 (sección 4.2.1.6).

<p class="caption"><strong>Tabla 231</strong><br><em>Datos de la reunión de Sprint Planning 1</em></p>

<table>
  <tr>
    <th colspan="2">Sprint #</th>
    <th colspan="2">Sprint 1</th>
  </tr>
  <tr>
    <th colspan="4">Sprint Planning Background</th>
  </tr>
  <tr>
    <td colspan="2">Date</td>
    <td colspan="2">2026-09-27</td>
  </tr>
  <tr>
    <td colspan="2">Time</td>
    <td colspan="2">10:00 AM (GMT-5)</td>
  </tr>
  <tr>
    <td colspan="2">Location</td>
    <td colspan="2">Reunión virtual</td>
  </tr>
  <tr>
    <td colspan="2">Prepared By</td>
    <td colspan="2">Villarreal Bazan, Angel Martin</td>
  </tr>
  <tr>
    <td colspan="2">Attendees (to planning meeting)</td>
    <td colspan="2">Del Aguila Del Aguila, Olenka Priscilla / Espinoza Cruz, Angela Milagros / Mora Rivera, Joel Fernando / Vergaray Calderon, Rose Almendra / Villarreal Bazan, Angel Martin</td>
  </tr>
  <tr>
    <th colspan="4">Sprint Goal &amp; User Stories</th>
  </tr>
  <tr>
    <td colspan="2">Sprint 1 Goal</td>
    <td colspan="2">Nuestro enfoque está en publicar el landing page de Healthify en español e inglés, entregar el backend completo de la plataforma con sus seis bounded contexts y sus endpoints documentados en Swagger, y construir la aplicación móvil Android que los consume. Creemos que esto da a los nutricionistas y pacientes que visitan el sitio una explicación clara de la propuesta de valor, y da a los pacientes una app para registrar su ingesta y su peso entre consultas, incluso sin conexión, y a los nutricionistas una app para conducir la consulta guiada, publicar el plan y revisar el seguimiento. Esto se confirmará cuando un visitante recorra todas las secciones de https://landing.healthify.lat en ambos idiomas y envíe el formulario de contacto; cuando un cliente HTTP ejecute los flujos de consulta guiada, registro de ingesta y seguimiento contra https://platform.healthify.lat/swagger; y cuando un paciente inicie sesión en la app instalada en un dispositivo Android, se vincule con su nutricionista, registre comidas y autopesajes y vea sus metas y su progreso, con las suites de pruebas del backend y de la app en verde.</td>
  </tr>
  <tr>
    <td colspan="2">Sprint 1 Velocity</td>
    <td colspan="2">236 Story Points</td>
  </tr>
  <tr>
    <td colspan="2">Sum of Story Points</td>
    <td colspan="2">236 Story Points (17 del landing page, 62 del backend y 157 de la aplicación móvil)</td>
  </tr>
</table>

Historias incluidas en el Sprint 1:

<p class="caption"><strong>Tabla 232</strong><br><em>Historias de usuario incluidas en el Sprint 1</em></p>

| Épico | Story ID | Título | Story Points |
|---|---|---|:---:|
| EP10 | US32 | Visualización de la propuesta de valor de Healthify | 2 |
| EP10 | US33 | Consulta de las principales funcionalidades de Healthify | 2 |
| EP10 | US34 | Conocimiento de la startup, misión y visión | 1 |
| EP10 | US35 | Cambio de idioma del Landing Page | 3 |
| EP10 | US36 | Acceso al inicio de uso de Healthify desde el Landing Page | 2 |
| EP10 | US37 | Envío de consulta mediante formulario de contacto | 3 |
| EP10 | US38 | Consulta de términos y políticas de Healthify | 2 |
| EP10 | US45 | Consulta de preguntas frecuentes | 2 |
| EP_TS | TS01 | Servicios de registro, autenticación y autorización | 5 |
| EP_TS | TS02 | Servicios de gestión de vínculos de cuidado | 5 |
| EP_TS | TS03 | Servicios de evaluación y diagnóstico nutricional | 5 |
| EP_TS | TS04 | Servicios de prescripción y gestión del plan nutricional | 8 |
| EP_TS | TS05 | Servicios de registro de ingesta alimentaria | 5 |
| EP_TS | TS06 | Servicios de autopesaje y seguimiento corporal | 5 |
| EP_TS | TS07 | Servicios de monitoreo y expediente del paciente | 8 |
| EP_TS | TS08 | Sincronización de registros offline | 8 |
| EP_TS | TS09 | Servicios de asistencia con IA | 8 |
| EP_TS | TS10 | Servicios de agenda y respuesta previa a la consulta | 5 |
| EP01 | US01 | Vinculación mediante invitación QR | 5 |
| EP01 | US02 | Otorgamiento de consentimiento para compartir información | 3 |
| EP01 | US03 | Revocación del consentimiento | 2 |
| EP01 | US04 | Generación de invitación QR para un nuevo paciente | 5 |
| EP01 | US05 | Consulta de pacientes con vínculo activo | 3 |
| EP01 | US06 | Alta del paciente al finalizar el tratamiento | 2 |
| EP01 | US07 | Cambio de nutricionista | 2 |
| EP02 | US08 | Registro de comida por fotografía | 8 |
| EP02 | US09 | Confirmación o ajuste de estimación de porción | 3 |
| EP02 | US10 | Registro manual de comida mediante catálogo | 5 |
| EP02 | US11 | Indicación de adherencia al plan en un registro | 2 |
| EP03 | US12 | Registro de autopesaje | 3 |
| EP03 | US13 | Visualización de tendencia de peso | 5 |
| EP04 | US14 | Consulta del cumplimiento nutricional diario | 5 |
| EP04 | US15 | Visualización de señal de consistencia | 8 |
| EP04 | US16 | Consulta del monitoreo del paciente | 5 |
| EP04 | US17 | Revisión y resolución de señales de seguimiento | 5 |
| EP05 | US18 | Acceso al expediente personal unificado | 5 |
| EP05 | US19 | Registro de derivación a otro especialista | 2 |
| EP05 | US20 | Acceso al expediente unificado del paciente | 5 |
| EP06 | US21 | Registro y finalización de la evaluación nutricional | 5 |
| EP06 | US22 | Emisión del diagnóstico nutricional | 5 |
| EP07 | US23 | Visualización de metas nutricionales vigentes | 3 |
| EP07 | US24 | Confirmación de recepción de nuevas metas nutricionales | 2 |
| EP07 | US25 | Obtención de propuesta de metas nutricionales calculadas | 5 |
| EP07 | US26 | Prescripción y publicación del plan nutricional | 8 |
| EP07 | US27 | Ajuste del plan nutricional entre consultas | 5 |
| EP08 | US28 | Creación de cuenta | 3 |
| EP08 | US29 | Inicio de sesión | 3 |
| EP08 | US30 | Cierre de sesión | 1 |
| EP09 | US31 | Registro y sincronización sin conexión | 8 |
| EP04 | US39 | Agenda de consultas | 5 |
| EP04 | US40 | Preparación y respuesta previa a la consulta | 3 |
| EP11 | US41 | Control de las funciones con IA | 5 |
| EP11 | US42 | Resumen semanal, ideas de comidas y preguntas sugeridas con IA | 8 |
| EP08 | US43 | Preferencias de la cuenta: idioma y recordatorios | 3 |
| EP02 | US44 | Alimentos locales del catálogo | 2 |
| | | **Total** | **236** |

#### 4.2.1.2. Aspect Leaders and Collaborators

Los aspectos del Sprint 1 corresponden a las partes en que el equipo dividió cada producto. En el landing page, cada aspecto es un grupo de secciones; en el backend y en la aplicación móvil, cada aspecto es un bounded context o un bloque transversal. Cada integrante lidera al menos un aspecto de cada producto. La columna de un aspecto marca con **L** al líder, que responde por su diseño, sus commits y su pull request, y con **C** a quienes colaboran por depender de él o por aportar a su contenido.

**Landing Page**

- **Foundation & i18n:** design tokens, estructura de página con navegación, menú móvil y footer, motor de traducción español/inglés y botones de acceso según el rol.
- **Hero & Problem:** carrusel del hero y sección del problema que Healthify resuelve.
- **Showcases:** secciones «Para el paciente» y «Para el nutricionista», con la lista de funciones y sus pantallas.
- **How it works, FAQ & Terms:** sección «Cómo funciona», preguntas frecuentes con filtros y página de términos y condiciones.
- **About & Contact:** página «Nosotros» con misión, visión, valores y equipo, y página de contacto con su formulario.

<p class="caption"><strong>Tabla 233</strong><br><em>Líderes y colaboradores del aspecto About &amp; Contact</em></p>

| Team Member (Last Name, First Name) | GitHub Username | Foundation & i18n | Hero & Problem | Showcases | How it works, FAQ & Terms | About & Contact |
|---|---|:---:|:---:|:---:|:---:|:---:|
| Del Aguila Del Aguila, Olenka Priscilla | olenkisha14 | C | L | C | C | C |
| Espinoza Cruz, Angela Milagros | Emy127 | C | C | C | C | L |
| Mora Rivera, Joel Fernando | xJoelFMRx | C | C | L | C | C |
| Vergaray Calderon, Rose Almendra | rosealmendra | C | C | C | L | C |
| Villarreal Bazan, Angel Martin | Nevatrix | L | C | C | C | C |

**Backend (RESTful Web Services)**

- **Platform Foundation & AI:** solución, núcleo compartido (eventos, resultados, repositorio base, EF Core), manejo de errores con Problem Details, límite de solicitudes, composición de dependencias y el módulo técnico de IA con su pipeline de guardas y su cliente de Gemini (TS09).
- **IAM & Care Relationship:** cuentas, sesiones y roles (TS01); invitaciones, vínculos de cuidado y consentimiento, incluido el consentimiento para IA (TS02).
- **Nutritional Care:** datos base, consulta guiada, evaluación, diagnóstico (TS03), metas, publicación y versiones del plan, y bandeja de revisión (TS04).
- **Food Catalog & Intake:** catálogo de alimentos con Open Food Facts y USDA, diario, registro por foto, autopesaje y tendencia de peso (TS05, TS06) y sincronización de lo registrado sin conexión (TS08).
- **Monitoring & Read Models:** ventanas de evaluación, desviaciones, índice de consistencia, seguimientos, derivaciones y resúmenes (TS07, TS10), y las vistas compuestas que arman el expediente, el panel y el listado de pacientes.
- **Deployment & Release:** Dockerfile, `docker-compose`, flujo de GitHub Actions, versionado, README y publicación en el dominio propio.

<p class="caption"><strong>Tabla 234</strong><br><em>Líderes y colaboradores del aspecto Deployment &amp; Release</em></p>

| Team Member (Last Name, First Name) | GitHub Username | Platform Foundation & AI | IAM & Care Relationship | Nutritional Care | Food Catalog & Intake | Monitoring & Read Models | Deployment & Release |
|---|---|:---:|:---:|:---:|:---:|:---:|:---:|
| Del Aguila Del Aguila, Olenka Priscilla | olenkisha14 | C | L | C | | C | |
| Espinoza Cruz, Angela Milagros | Emy127 | C | C | C | C | L | |
| Mora Rivera, Joel Fernando | xJoelFMRx | C | C | C | L | C | C |
| Vergaray Calderon, Rose Almendra | rosealmendra | C | C | L | C | C | |
| Villarreal Bazan, Angel Martin | Nevatrix | L | C | C | C | C | L |

Las marcas **C** del backend siguen las dependencias entre bounded contexts. Nutritional Care, Food Catalog & Intake y Monitoring & Read Models consultan el vínculo de cuidado por la fachada ACL de Care Relationship; Food Catalog & Intake recibe las metas vigentes que publica Nutritional Care; Monitoring & Read Models lee lo que registra Food Catalog & Intake y abre elementos en la bandeja de Nutritional Care. Nevatrix integra todas las ramas a `develop` y `main`.

**Mobile Application (Android)**

- **Foundation & Design System:** proyecto Gradle, recursos (fuentes, íconos, textos en español e inglés, configuración de seguridad), núcleo compartido (kernel, red, inyección de dependencias y cola de sincronización sin conexión) y el sistema de diseño Healthify M3 con su catálogo de depuración.
- **IAM & Care Relationship:** splash, bienvenida, registro e inicio de sesión (US28, US29); sesión cifrada con renovación de token; canje de invitación por QR, consentimiento, cambio de nutricionista y preferencias de IA (US01, US02, US03, US07, US41, US24); invitación, listado y alta de pacientes para el nutricionista (US04, US05, US06).
- **Monitoring & Food Catalog:** catálogo de alimentos con caché local y alimentos locales (US10, US44); progreso del día, señal de consistencia, resumen semanal, consultas, respuesta previa, agenda, derivaciones y monitoreo del paciente (US14 a US16, US18, US19, US39, US40, US42).
- **Intake & Diary:** diario, registro por foto y a mano, confirmación y ajuste de estimaciones, adherencia al plan, autopesaje, tendencia de peso, ideas de comida con IA, recordatorios y cola de sincronización (US08 a US13, US31, US42, US43).
- **Nutritional Care & App Shell:** datos base, consulta guiada (evaluación, diagnóstico, metas y publicación), ajuste del plan, bandeja de revisión, expediente y mi plan (US17, US18, US20 a US27), y la navegación de paciente y nutricionista con la base de datos Room (US30, US43).

<p class="caption"><strong>Tabla 235</strong><br><em>Líderes y colaboradores del aspecto Nutritional Care &amp; App Shell</em></p>

| Team Member (Last Name, First Name) | GitHub Username | Foundation & Design System | IAM & Care Relationship | Monitoring & Food Catalog | Intake & Diary | Nutritional Care & App Shell |
|---|---|:---:|:---:|:---:|:---:|:---:|
| Del Aguila Del Aguila, Olenka Priscilla | olenkisha14 | C | L | C | C | C |
| Espinoza Cruz, Angela Milagros | Emy127 | C | C | C | C | L |
| Mora Rivera, Joel Fernando | xJoelFMRx | C | C | L | C | C |
| Vergaray Calderon, Rose Almendra | rosealmendra | C | C | C | L | C |
| Villarreal Bazan, Angel Martin | Nevatrix | L | C | C | C | C |

Las marcas **C** de la app siguen sus dependencias. Todas las pantallas usan el sistema de diseño y el núcleo de red y sincronización de Foundation; Intake & Diary busca alimentos en el catálogo de Monitoring & Food Catalog; el módulo de monitoreo lee lo que registra Intake & Diary; y la navegación de Nutritional Care & App Shell integra las pantallas de los demás módulos. Nevatrix integra todas las ramas a `develop` y `main`.

#### 4.2.1.3. Sprint Backlog 1

El objetivo del Sprint 1 es publicar el landing page, completar el backend con las pruebas y la documentación de sus endpoints, y construir la aplicación móvil que lo consume. Los user stories del landing page pertenecen al épico EP10, los technical stories al épico EP_TS y los user stories de la aplicación a los épicos EP01 a EP09 y EP11. Las tareas sin historia asociada corresponden a trabajo que sostiene a varias historias: estructura de los repositorios, núcleo compartido, sistema de diseño, contenedores y publicación. El board del sprint y la tabla de work-items se presentan a continuación.

<p class="caption"><strong>Figura 144</strong><br><em>Tablero de Trello del Sprint 1</em></p>

![Board Sprint 1](../assets/img/chapter4/sprint1/trello.png)

URL del Board (Trello): [Enlace del Trello](https://trello.com/b/6kovxMb4/sprint-backlog-1)

<p class="caption"><strong>Tabla 236</strong><br><em>Sprint Backlog 1: tareas por historia de usuario</em></p>

| US ID | US Title | Task ID | Task Title | Description | Est. (h) | Assigned To | Status |
|---|---|---|---|---|:---:|---|---|
| — | — | T01 | Crear el repositorio del landing page | Crear `healthify-website` con las ramas `main` y `develop`, licencia MIT y carpetas `css`, `js` y `assets`. | 2 | Villarreal Bazan, Angel Martin | Done |
| — | — | T02 | Incorporar identidad de marca e íconos | Agregar logo, favicon y el set de íconos SVG exportados de Figma. | 3 | Villarreal Bazan, Angel Martin | Done |
| — | — | T03 | Definir design tokens, reset y botones | Declarar en `:root` los colores, tipografías, radios y tamaños del sistema de diseño de Figma, el reset y los estilos de botón. | 3 | Villarreal Bazan, Angel Martin | Done |
| — | — | T04 | Armar la estructura de página con header, menú móvil y footer | Crear `index.html` con el encabezado, la navegación principal, el menú móvil y el pie de página, con atributos ARIA y enlace «Saltar al contenido». | 5 | Villarreal Bazan, Angel Martin | Done |
| — | — | T05 | Documentar páginas y ejecución local | Redactar el README con las páginas, la estructura de carpetas y el comando `npx serve`. | 1 | Villarreal Bazan, Angel Martin | Done |
| — | — | T06 | Restaurar fuentes del sitio | Recuperar la estructura de `index.html`, `main.js`, el objeto de traducciones y el orden de reglas de la hoja de estilos (rama `fix/restore-sources`). | 5 | Villarreal Bazan, Angel Martin | Done |
| US32 | Visualización de la propuesta de valor de Healthify | T07 | Construir el carrusel del hero | Maquetar el hero con cuatro diapositivas (nutricionistas, pacientes, video del producto y video del equipo), con flechas, indicadores, gesto de deslizar y avance automático que se pausa con el foco. | 8 | Del Aguila Del Aguila, Olenka Priscilla | Done |
| US32 | Visualización de la propuesta de valor de Healthify | T08 | Construir la sección del problema | Presentar el problema entre consultas con dos causas: lo que da vergüenza no se cuenta y las porciones se estiman mal. | 4 | Del Aguila Del Aguila, Olenka Priscilla | Done |
| US32 | Visualización de la propuesta de valor de Healthify | T09 | Agregar la pantalla de la app al hero | Incorporar la imagen del teléfono con las tarjetas de ejemplo del hero. | 1 | Del Aguila Del Aguila, Olenka Priscilla | Done |
| US33 | Consulta de las principales funcionalidades de Healthify | T10 | Construir la sección «Para el paciente» | Listar diez funciones del paciente agrupadas en Registrar, Ver progreso y Tu consulta, con la pantalla de cada una. | 8 | Mora Rivera, Joel Fernando | Done |
| US33 | Consulta de las principales funcionalidades de Healthify | T11 | Construir la sección «Para el nutricionista» | Listar once funciones del nutricionista agrupadas por momento (durante la consulta, entre consultas) con pantallas simuladas en CSS. | 8 | Mora Rivera, Joel Fernando | Done |
| US33 | Consulta de las principales funcionalidades de Healthify | T12 | Implementar el comportamiento de los showcases | Fijar la imagen mientras avanza la lista en escritorio y convertir la lista en acordeón en tableta y móvil. | 4 | Mora Rivera, Joel Fernando | Done |
| US33 | Consulta de las principales funcionalidades de Healthify | T13 | Preparar las capturas de las funciones | Exportar y optimizar las capturas de pantalla usadas en los showcases. | 2 | Mora Rivera, Joel Fernando | Done |
| US34 | Conocimiento de la startup, misión y visión | T14 | Construir el hero, la historia y el propósito de «Nosotros» | Crear `about-us.html` con el hero, la historia de la startup y las tarjetas de misión y visión con sus ilustraciones. | 5 | Espinoza Cruz, Angela Milagros | Done |
| US34 | Conocimiento de la startup, misión y visión | T15 | Construir las secciones de valores y equipo | Agregar los valores de Healthify y la lista del equipo con iniciales y rol. | 3 | Espinoza Cruz, Angela Milagros | Done |
| US35 | Cambio de idioma del Landing Page | T16 | Implementar el motor de traducción | Crear `i18n.js` con los diccionarios `es` y `en`, la función de aplicación de textos con `data-i18n` y la persistencia del idioma en `localStorage`. | 5 | Villarreal Bazan, Angel Martin | Done |
| US35 | Cambio de idioma del Landing Page | T17 | Implementar el selector de idioma | Agregar el selector ES / EN en la barra de navegación, en el menú móvil y en el footer. | 3 | Villarreal Bazan, Angel Martin | Done |
| US35 | Cambio de idioma del Landing Page | T18 | Traducir el hero y el problema | Redactar las claves en español e inglés del hero y de la sección del problema. | 2 | Del Aguila Del Aguila, Olenka Priscilla | Done |
| US35 | Cambio de idioma del Landing Page | T19 | Traducir los showcases | Redactar las claves en español e inglés de las secciones del paciente y del nutricionista. | 3 | Mora Rivera, Joel Fernando | Done |
| US35 | Cambio de idioma del Landing Page | T20 | Traducir «Nosotros» y contacto | Redactar las claves en español e inglés de las páginas «Nosotros» y de contacto. | 3 | Espinoza Cruz, Angela Milagros | Done |
| US36 | Acceso al inicio de uso de Healthify desde el Landing Page | T21 | Construir la sección «Cómo funciona» | Explicar la consulta guiada en cuatro pasos y el ciclo entre consultas del paciente y del nutricionista. | 4 | Vergaray Calderon, Rose Almendra | Done |
| US36 | Acceso al inicio de uso de Healthify desde el Landing Page | T22 | Agregar los accesos según el rol | Incluir «Soy nutricionista», «Fui invitado por mi nutricionista» e «Iniciar sesión» en la navegación, el hero y el footer; «Soy nutricionista» abre el formulario de contacto con el rol preseleccionado. | 2 | Villarreal Bazan, Angel Martin | Done |
| US36 | Acceso al inicio de uso de Healthify desde el Landing Page | T23 | Agregar la ilustración de cierre del recorrido | Incorporar la ilustración que cierra la sección «Cómo funciona». | 1 | Vergaray Calderon, Rose Almendra | Done |
| US37 | Envío de consulta mediante formulario de contacto | T24 | Construir la página de contacto | Crear `contact.html` con el hero, los datos de contacto y las tarjetas de rol (nutricionista, paciente, alianzas). | 4 | Espinoza Cruz, Angela Milagros | Done |
| US37 | Envío de consulta mediante formulario de contacto | T25 | Implementar el formulario con validación | Validar en el cliente nombre, apellidos, correo, teléfono opcional, mensaje de al menos 20 caracteres y aceptación del aviso de privacidad, con mensajes de error por campo y confirmación al enviar. | 5 | Espinoza Cruz, Angela Milagros | Done |
| US38 | Consulta de términos y políticas de Healthify | T26 | Construir la estructura de la página de términos | Crear `terms.html` con el hero y la estructura de la página. | 2 | Vergaray Calderon, Rose Almendra | Done |
| US38 | Consulta de términos y políticas de Healthify | T27 | Redactar el índice y las cláusulas | Redactar nueve cláusulas, entre ellas consentimiento, uso de IA y privacidad, con su tabla de contenido. | 4 | Vergaray Calderon, Rose Almendra | Done |
| US38 | Consulta de términos y políticas de Healthify | T28 | Implementar el diseño con índice fijo | Maquetar una cláusula por pantalla con el índice fijo en escritorio y lista normal en móvil. | 4 | Vergaray Calderon, Rose Almendra | Done |
| US45 | Consulta de preguntas frecuentes | T29 | Construir el acordeón de preguntas frecuentes de inicio | Implementar el acordeón accesible con filtros por tema (pacientes, nutricionistas, privacidad, IA). | 5 | Vergaray Calderon, Rose Almendra | Done |
| US45 | Consulta de preguntas frecuentes | T30 | Agregar las preguntas frecuentes a «Nosotros» | Incluir la sección de preguntas frecuentes en `about-us.html`. | 3 | Espinoza Cruz, Angela Milagros | Done |
| — | — | T31 | Crear el repositorio y la solución del backend | Crear `healthify-platform` con la solución .NET 10, los proyectos `Healthify.Platform` y `Healthify.Platform.Tests` en la versión 0.1.0, y normalizar finales de línea. | 3 | Villarreal Bazan, Angel Martin | Done |
| — | — | T32 | Construir el núcleo compartido | Implementar eventos de dominio, contratos de repositorio, patrón de resultado y mensajes localizados en español e inglés. | 7 | Villarreal Bazan, Angel Martin | Done |
| — | — | T33 | Configurar persistencia compartida | Crear el contexto de EF Core, los interceptores de auditoría, el repositorio base y las migraciones compartidas. | 5 | Villarreal Bazan, Angel Martin | Done |
| — | — | T34 | Implementar errores y límite de solicitudes | Responder los errores como Problem Details con código estable, definir la convención de rutas `/api/v1` y limitar las solicitudes por usuario o IP. | 5 | Villarreal Bazan, Angel Martin | Done |
| — | — | T35 | Componer la aplicación | Crear el arranque, el registro de dependencias, los clientes HTTP tipados, los servicios en segundo plano y el pipeline de solicitudes. | 8 | Villarreal Bazan, Angel Martin | Done |
| — | — | T36 | Configurar OpenAPI y Swagger | Generar el documento OpenAPI con Swashbuckle, el esquema de seguridad Bearer y las anotaciones de cada operación. | 3 | Villarreal Bazan, Angel Martin | Done |
| — | — | T37 | Escribir las pruebas del núcleo compartido | Pruebas de soporte, de límite de solicitudes y de códigos de error de Problem Details. | 3 | Villarreal Bazan, Angel Martin | Done |
| — | — | T38 | Empaquetar el backend en contenedores | Escribir el `Dockerfile` de dos etapas y el `docker-compose.yml` con la API y MySQL 8.4. | 3 | Villarreal Bazan, Angel Martin | Done |
| — | — | T39 | Automatizar el release | Crear el flujo `Release` de GitHub Actions que compila la solución y publica la versión leída del `.csproj`. | 2 | Villarreal Bazan, Angel Martin | Done |
| TS09 | Servicios de asistencia con IA | T40 | Implementar los contratos y el pipeline de generación de IA | Definir el puerto del modelo, las guardas de consentimiento y preferencia, la pseudonimización de entradas, la validación de salidas y la cuota por función. | 8 | Villarreal Bazan, Angel Martin | Done |
| TS09 | Servicios de asistencia con IA | T41 | Implementar el cliente de Gemini y la auditoría | Crear el cliente de Gemini con reintento y tiempo de espera, el catálogo de prompts con esquema y la persistencia de la auditoría de generaciones. | 8 | Villarreal Bazan, Angel Martin | Done |
| TS01 | Servicios de registro, autenticación y autorización | T42 | Modelar el dominio de usuario y sesión | Crear los agregados de usuario y sesión, los objetos de valor y los eventos de dominio de IAM. | 4 | Del Aguila Del Aguila, Olenka Priscilla | Done |
| TS01 | Servicios de registro, autenticación y autorización | T43 | Implementar los servicios de aplicación de IAM | Crear los comandos y consultas, el hash de contraseñas, los tokens de acceso y renovación, el bloqueo temporal y la fachada ACL. | 10 | Del Aguila Del Aguila, Olenka Priscilla | Done |
| TS01 | Servicios de registro, autenticación y autorización | T44 | Exponer los endpoints de autenticación, sesiones y usuarios | Crear los controladores con su documentación OpenAPI, los recursos y los mensajes localizados. | 5 | Del Aguila Del Aguila, Olenka Priscilla | Done |
| TS01 | Servicios de registro, autenticación y autorización | T45 | Escribir las pruebas de IAM | Pruebas de nombres, idioma, bloqueo, rotación de tokens, códigos de error y persistencia. | 4 | Del Aguila Del Aguila, Olenka Priscilla | Done |
| TS02 | Servicios de gestión de vínculos de cuidado | T46 | Modelar el dominio de invitación, vínculo y consentimiento | Crear los agregados, comandos, consultas y eventos de Care Relationship. | 8 | Del Aguila Del Aguila, Olenka Priscilla | Done |
| TS02 | Servicios de gestión de vínculos de cuidado | T47 | Implementar los servicios de aplicación y la persistencia | Crear los servicios, los manejadores de eventos, la fachada ACL, la persistencia y el trabajo que vence las invitaciones. | 9 | Del Aguila Del Aguila, Olenka Priscilla | Done |
| TS02 | Servicios de gestión de vínculos de cuidado | T48 | Exponer los endpoints de invitaciones, vínculos y preferencias de IA | Crear los controladores de invitaciones, vínculos de cuidado, consentimiento y preferencias de IA. | 5 | Del Aguila Del Aguila, Olenka Priscilla | Done |
| TS02 | Servicios de gestión de vínculos de cuidado | T49 | Escribir las pruebas de Care Relationship | Pruebas de consentimiento de IA, cambio de nutricionista, autovínculo y acuse de metas. | 4 | Del Aguila Del Aguila, Olenka Priscilla | Done |
| TS03 | Servicios de evaluación y diagnóstico nutricional | T50 | Modelar el dominio clínico | Crear los agregados, entidades, objetos de valor, errores, comandos, consultas y eventos de Nutritional Care. | 12 | Vergaray Calderon, Rose Almendra | Done |
| TS03 | Servicios de evaluación y diagnóstico nutricional | T51 | Implementar la consulta guiada | Crear los servicios de comando y consulta, los manejadores, las salidas de IA para diagnóstico y pautas, y la fachada ACL. | 12 | Vergaray Calderon, Rose Almendra | Done |
| TS03 | Servicios de evaluación y diagnóstico nutricional | T52 | Exponer los endpoints clínicos | Crear los recursos REST, las transformaciones y los controladores de datos base, consulta guiada, evaluación y diagnóstico. | 9 | Vergaray Calderon, Rose Almendra | Done |
| TS03 | Servicios de evaluación y diagnóstico nutricional | T53 | Escribir las pruebas de dominio y aplicación | Pruebas del ciclo de la consulta, mediciones, diagnóstico y datos base. | 6 | Vergaray Calderon, Rose Almendra | Done |
| TS04 | Servicios de prescripción y gestión del plan nutricional | T54 | Implementar el cálculo de metas y la publicación del plan | Crear los calculadores de metas, el reloj, la programación de rechequeos, las migraciones y los servicios de publicación y versiones. | 14 | Vergaray Calderon, Rose Almendra | Done |
| TS04 | Servicios de prescripción y gestión del plan nutricional | T55 | Implementar la bandeja de revisión y la propuesta de ajuste | Crear la bandeja de revisión, la propuesta de ajuste del plan con IA y su aceptación por el nutricionista. | 8 | Vergaray Calderon, Rose Almendra | Done |
| TS04 | Servicios de prescripción y gestión del plan nutricional | T56 | Escribir las pruebas de integración con MySQL | Pruebas de segunda consulta, aceptación de propuestas y persistencia de textos generados. | 4 | Vergaray Calderon, Rose Almendra | Done |
| TS05 | Servicios de registro de ingesta alimentaria | T57 | Implementar el catálogo de alimentos | Crear el modelo de alimentos de referencia, los proveedores de Open Food Facts y USDA, la persistencia y los endpoints del catálogo. | 17 | Mora Rivera, Joel Fernando | Done |
| TS05 | Servicios de registro de ingesta alimentaria | T58 | Modelar el dominio de ingesta | Crear el diario, el registro por foto, el grupo de comida y el autopesaje, con sus comandos, consultas y eventos. | 11 | Mora Rivera, Joel Fernando | Done |
| TS05 | Servicios de registro de ingesta alimentaria | T59 | Implementar los servicios de ingesta | Crear los servicios de comando y consulta, los manejadores, la fachada ACL, la persistencia, el análisis de fotos, las ideas de comida con IA y los trabajos programados. | 21 | Mora Rivera, Joel Fernando | Done |
| TS05 | Servicios de registro de ingesta alimentaria | T60 | Exponer los endpoints de diario y análisis de foto | Crear los controladores de registros por foto y a mano, confirmación y ajuste de estimaciones, ideas de comida y análisis de foto. | 6 | Mora Rivera, Joel Fernando | Done |
| TS06 | Servicios de autopesaje y seguimiento corporal | T61 | Exponer los endpoints de autopesaje y tendencia | Crear los endpoints de autopesaje y de tendencia de peso con el protocolo en ayunas. | 5 | Mora Rivera, Joel Fernando | Done |
| TS08 | Sincronización de registros offline | T62 | Implementar la sincronización de registros en cola | Crear los endpoints de sincronización de diario y autopesajes, con identificador del cliente para evitar duplicados. | 6 | Mora Rivera, Joel Fernando | Done |
| TS05 | Servicios de registro de ingesta alimentaria | T63 | Escribir las pruebas de Food Catalog e Intake | Pruebas de catálogo, confirmación de estimaciones, adherencia al plan, ventana retroactiva, tendencia y sincronización. | 6 | Mora Rivera, Joel Fernando | Done |
| TS07 | Servicios de monitoreo y expediente del paciente | T64 | Modelar el dominio de monitoreo | Crear las ventanas de evaluación, desviaciones, índice de consistencia, seguimientos y derivaciones, con sus objetos de valor, errores, comandos, consultas y eventos. | 14 | Espinoza Cruz, Angela Milagros | Done |
| TS07 | Servicios de monitoreo y expediente del paciente | T65 | Implementar los servicios de monitoreo | Crear los servicios de comando y consulta, las salidas de IA, los manejadores, la fachada ACL, la persistencia, el reloj, el caché y los trabajos programados. | 27 | Espinoza Cruz, Angela Milagros | Done |
| TS10 | Servicios de agenda y respuesta previa a la consulta | T66 | Exponer los endpoints de agenda, seguimiento y derivaciones | Crear los controladores de seguimientos programados, respuesta previa, derivaciones, índice de consistencia y resúmenes con IA. | 8 | Espinoza Cruz, Angela Milagros | Done |
| TS07 | Servicios de monitoreo y expediente del paciente | T67 | Construir los read models | Crear los compositores del expediente, el panel de monitoreo, el resumen, el listado de pacientes y las consultas, y sus endpoints. | 11 | Espinoza Cruz, Angela Milagros | Done |
| TS07 | Servicios de monitoreo y expediente del paciente | T68 | Escribir las pruebas de monitoreo y read models | Pruebas de cumplimiento diario, ventanas, seguimientos, respuesta previa, resúmenes y compositores. | 8 | Espinoza Cruz, Angela Milagros | Done |
| — | — | T69 | Escribir las pruebas de composición | Pruebas del soporte entre contextos, del pipeline de IA y de la composición de dependencias, y actualizar el snapshot del modelo de EF Core. | 5 | Espinoza Cruz, Angela Milagros | Done |
| — | — | T70 | Corregir la URL base de USDA | Resolver la ruta de búsqueda de USDA con relación a la dirección base y terminar la URL por defecto con una barra. | 3 | Mora Rivera, Joel Fernando | Done |
| — | — | T71 | Documentar el backend y fijar la versión 1.0.0 | Redactar el README (arquitectura, bounded contexts, ejecución, configuración y pruebas) y fijar la versión en el `.csproj`. | 4 | Mora Rivera, Joel Fernando | Done |
| — | — | T72 | Integrar ramas y publicar releases | Integrar las ramas de trabajo en `develop` y publicar las versiones `v0.1.0`, `v0.5.0` y `v1.0.0` en `main`, y las versiones `v1.0.0` y `v1.0.1` del landing page. | 6 | Villarreal Bazan, Angel Martin | Done |
| — | — | T73 | Desplegar el landing page y el backend | Publicar el landing page en GitHub Pages con el dominio `landing.healthify.lat` y el backend en la máquina virtual con `platform.healthify.lat`. | 8 | Villarreal Bazan, Angel Martin | Done |
| — | — | T74 | Configurar el proyecto Gradle de la app | Crear el proyecto Android con Gradle, el catálogo de versiones (`libs.versions.toml`) y el wrapper. | 3 | Villarreal Bazan, Angel Martin | Done |
| — | — | T75 | Agregar los recursos de la app | Incorporar las fuentes Anton y Open Sans, los íconos del lanzador, los textos en español e inglés y las configuraciones de seguridad de red y respaldo. | 4 | Villarreal Bazan, Angel Martin | Done |
| US31 | Registro y sincronización sin conexión | T76 | Construir el núcleo compartido de la app | Crear el kernel compartido, la capa de red con Retrofit, la inyección de dependencias con Hilt y la cola de sincronización de operaciones pendientes. | 10 | Villarreal Bazan, Angel Martin | Done |
| — | — | T77 | Implementar el sistema de diseño Healthify M3 | Crear el tema Material 3, los íconos, los componentes reutilizables y el catálogo de depuración de componentes. | 10 | Villarreal Bazan, Angel Martin | Done |
| US28 | Creación de cuenta | T78 | Modelar el dominio de IAM de la app | Crear la entidad de usuario, los objetos de valor y los casos de uso de registro, inicio y cierre de sesión, y de cambio de idioma. | 6 | Del Aguila Del Aguila, Olenka Priscilla | Done |
| US29 | Inicio de sesión | T79 | Implementar la API de autenticación y la sesión | Crear la API de autenticación, el almacenamiento cifrado de la sesión, la renovación automática del token y los mappers. | 8 | Del Aguila Del Aguila, Olenka Priscilla | Done |
| US28 | Creación de cuenta | T80 | Construir splash, bienvenida y registro | Crear las pantallas de splash, bienvenida y creación de cuenta, con validación de los datos. | 6 | Del Aguila Del Aguila, Olenka Priscilla | Done |
| US29 | Inicio de sesión | T81 | Construir inicio de sesión y sesión expirada | Crear la pantalla de inicio de sesión, la pantalla de carga del shell según el rol y el aviso de sesión expirada. | 4 | Del Aguila Del Aguila, Olenka Priscilla | Done |
| US01 | Vinculación mediante invitación QR | T82 | Implementar el canje de invitación por QR | Escanear el código QR del nutricionista, validarlo sin llamar al servidor si no es una invitación y canjearlo. | 6 | Del Aguila Del Aguila, Olenka Priscilla | Done |
| US02 | Otorgamiento de consentimiento para compartir información | T83 | Implementar el consentimiento | Crear el flujo para otorgar el consentimiento y la pantalla de consentimiento pendiente. | 4 | Del Aguila Del Aguila, Olenka Priscilla | Done |
| US03 | Revocación del consentimiento | T84 | Implementar la revocación del consentimiento | Crear el flujo y las pantallas para retirar el consentimiento. | 3 | Del Aguila Del Aguila, Olenka Priscilla | Done |
| US07 | Cambio de nutricionista | T85 | Implementar el cambio de nutricionista | Permitir vincularse con otro nutricionista desde ajustes, reemplazando el vínculo activo tras confirmar. | 3 | Del Aguila Del Aguila, Olenka Priscilla | Done |
| US24 | Confirmación de recepción de nuevas metas nutricionales | T86 | Implementar el acuse de metas nuevas | Mostrar el aviso de metas actualizadas y registrar la confirmación de lectura. | 3 | Del Aguila Del Aguila, Olenka Priscilla | Done |
| US41 | Control de las funciones con IA | T87 | Implementar el control de las funciones de IA | Crear la pantalla para activar o desactivar el resumen semanal, las ideas de comida, las preguntas sugeridas y el reconocimiento por foto. | 4 | Del Aguila Del Aguila, Olenka Priscilla | Done |
| US04 | Generación de invitación QR para un nuevo paciente | T88 | Implementar la invitación QR del nutricionista | Generar y mostrar la invitación con su código QR y su vencimiento. | 5 | Del Aguila Del Aguila, Olenka Priscilla | Done |
| US05 | Consulta de pacientes con vínculo activo | T89 | Implementar el listado de pacientes | Listar los pacientes con vínculo activo y su estado de cuidado. | 3 | Del Aguila Del Aguila, Olenka Priscilla | Done |
| US06 | Alta del paciente al finalizar el tratamiento | T90 | Implementar el alta del paciente | Crear el flujo para dar el alta al paciente al finalizar el tratamiento. | 3 | Del Aguila Del Aguila, Olenka Priscilla | Done |
| — | — | T91 | Escribir las pruebas de IAM y Care Relationship | Pruebas de casos de uso, repositorios, mappers, ViewModels, cambio de nutricionista y acuse de metas. | 8 | Del Aguila Del Aguila, Olenka Priscilla | Done |
| US10 | Registro manual de comida mediante catálogo | T92 | Implementar el catálogo de alimentos con caché local | Crear la búsqueda de alimentos que consulta primero el catálogo del teléfono y después el servidor. | 8 | Mora Rivera, Joel Fernando | Done |
| US44 | Alimentos locales del catálogo | T93 | Implementar los alimentos locales | Crear la pantalla para que el nutricionista agregue alimentos locales y la sincronización del catálogo local. | 3 | Mora Rivera, Joel Fernando | Done |
| US14 | Consulta del cumplimiento nutricional diario | T94 | Implementar «Cómo voy hoy» | Calcular y mostrar el resultado del día, con estado vacío y sin conexión. | 6 | Mora Rivera, Joel Fernando | Done |
| US15 | Visualización de señal de consistencia | T95 | Implementar la señal de consistencia | Obtener el índice de consistencia, mostrar la tarjeta en el inicio y registrar el acuse del aviso. | 6 | Mora Rivera, Joel Fernando | Done |
| US16 | Consulta del monitoreo del paciente | T96 | Implementar el monitoreo del paciente para el nutricionista | Crear los casos de uso y los repositorios del panel de monitoreo del paciente. | 6 | Mora Rivera, Joel Fernando | Done |
| US39 | Agenda de consultas | T97 | Implementar la agenda de consultas | Crear la agenda del nutricionista y la pantalla para programar una consulta. | 8 | Mora Rivera, Joel Fernando | Done |
| US40 | Preparación y respuesta previa a la consulta | T98 | Implementar la preparación y respuesta previa a la consulta | Mostrar la preparación indicada y permitir al paciente enviar su respuesta previa. | 6 | Mora Rivera, Joel Fernando | Done |
| US18 | Acceso al expediente personal unificado | T99 | Implementar «Mis consultas» | Listar la próxima consulta y las consultas anteriores del paciente. | 4 | Mora Rivera, Joel Fernando | Done |
| US19 | Registro de derivación a otro especialista | T100 | Implementar el registro de derivación | Crear la pantalla para registrar una derivación a otro especialista. | 3 | Mora Rivera, Joel Fernando | Done |
| US42 | Resumen semanal, ideas de comidas y preguntas sugeridas con IA | T101 | Implementar el resumen semanal | Mostrar el último resumen semanal generado con IA cuando el paciente lo activó. | 5 | Mora Rivera, Joel Fernando | Done |
| — | — | T102 | Escribir las pruebas de Monitoring y Food Catalog | Pruebas de progreso del día, agenda, consultas, resumen semanal y catálogo local. | 8 | Mora Rivera, Joel Fernando | Done |
| US08 | Registro de comida por fotografía | T103 | Implementar el registro por foto | Crear la cámara con la guía de encuadre, el análisis de la foto y la eliminación de metadatos del JPEG. | 10 | Vergaray Calderon, Rose Almendra | Done |
| US09 | Confirmación o ajuste de estimación de porción | T104 | Implementar la confirmación o ajuste de la estimación | Crear la pantalla para confirmar o ajustar la porción propuesta. | 5 | Vergaray Calderon, Rose Almendra | Done |
| US10 | Registro manual de comida mediante catálogo | T105 | Implementar el registro manual | Crear la pantalla de registro a mano con búsqueda de alimento, porción y hora, con ventana de 48 horas. | 6 | Vergaray Calderon, Rose Almendra | Done |
| US11 | Indicación de adherencia al plan en un registro | T106 | Implementar la adherencia al plan en cada registro | Pedir y guardar si la comida estaba en el plan (`InPlan`, `OffPlan` o `NotAnswered`). | 3 | Vergaray Calderon, Rose Almendra | Done |
| US12 | Registro de autopesaje | T107 | Implementar el autopesaje | Crear la pantalla de autopesaje con la pregunta de ayunas. | 5 | Vergaray Calderon, Rose Almendra | Done |
| US13 | Visualización de tendencia de peso | T108 | Implementar la tendencia de peso | Mostrar la tendencia semanal, el aviso de lecturas fuera del protocolo y el estado sin datos suficientes. | 6 | Vergaray Calderon, Rose Almendra | Done |
| US31 | Registro y sincronización sin conexión | T109 | Implementar la cola sin conexión del diario y del autopesaje | Encolar registros hechos sin conexión con su identificador y su hora local, y enviarlos al recuperar la red. | 8 | Vergaray Calderon, Rose Almendra | Done |
| US42 | Resumen semanal, ideas de comidas y preguntas sugeridas con IA | T110 | Implementar las ideas de comida con IA | Crear la pantalla de ideas de comida según lo que queda del día. | 5 | Vergaray Calderon, Rose Almendra | Done |
| US43 | Preferencias de la cuenta: idioma y recordatorios | T111 | Implementar los recordatorios | Crear la pantalla para activar los recordatorios de pesaje y de registro de comidas y programarlos. | 4 | Vergaray Calderon, Rose Almendra | Done |
| — | — | T112 | Escribir las pruebas de Intake | Pruebas de dominio, casos de uso, cola sin conexión, mappers, ViewModels y eliminación de metadatos de la foto. | 10 | Vergaray Calderon, Rose Almendra | Done |
| US18 | Acceso al expediente personal unificado | T113 | Implementar el expediente personal del paciente | Crear la pestaña «Mi expediente» con meta de energía, cumplimiento, peso clínico, plan y derivaciones. | 6 | Espinoza Cruz, Angela Milagros | Done |
| US23 | Visualización de metas nutricionales vigentes | T114 | Implementar las metas vigentes y «Mi plan» | Mostrar las metas vigentes en el inicio y el plan con sus versiones. | 5 | Espinoza Cruz, Angela Milagros | Done |
| US20 | Acceso al expediente unificado del paciente | T115 | Implementar el expediente del paciente para el nutricionista | Crear la ficha del paciente con su expediente unificado. | 6 | Espinoza Cruz, Angela Milagros | Done |
| US21 | Registro y finalización de la evaluación nutricional | T116 | Implementar los datos base y la medición de la consulta | Crear las pantallas de datos base y del paso de medición de la consulta guiada. | 6 | Espinoza Cruz, Angela Milagros | Done |
| US22 | Emisión del diagnóstico nutricional | T117 | Implementar el diagnóstico | Crear el paso de diagnóstico con la sugerencia y la emisión. | 5 | Espinoza Cruz, Angela Milagros | Done |
| US25 | Obtención de propuesta de metas nutricionales calculadas | T118 | Implementar la propuesta de metas | Crear el paso de metas con la propuesta calculada y la edición con motivo. | 5 | Espinoza Cruz, Angela Milagros | Done |
| US26 | Prescripción y publicación del plan nutricional | T119 | Implementar la publicación del plan | Crear el paso de publicación con indicaciones y mensaje para el paciente. | 6 | Espinoza Cruz, Angela Milagros | Done |
| US27 | Ajuste del plan nutricional entre consultas | T120 | Implementar el ajuste del plan entre consultas | Crear la pantalla para ajustar el plan a partir de una propuesta. | 6 | Espinoza Cruz, Angela Milagros | Done |
| US17 | Revisión y resolución de señales de seguimiento | T121 | Implementar la bandeja de revisión | Crear la bandeja y el detalle de cada elemento, con la propuesta de IA y su aceptación. | 8 | Espinoza Cruz, Angela Milagros | Done |
| — | — | T122 | Implementar los repositorios clínico y de plan | Crear los repositorios y mappers de expediente, plan y bandeja. | 6 | Espinoza Cruz, Angela Milagros | Done |
| — | — | T123 | Conectar la navegación, la base de datos Room y los puntos de entrada | Crear los shells de paciente y de nutricionista, la navegación, la base de datos Room y los puntos de entrada. | 10 | Espinoza Cruz, Angela Milagros | Done |
| US30 | Cierre de sesión | T124 | Implementar el cierre de sesión | Crear la confirmación de cierre de sesión. | 1 | Espinoza Cruz, Angela Milagros | Done |
| US43 | Preferencias de la cuenta: idioma y recordatorios | T125 | Implementar los ajustes | Crear los ajustes de paciente y de nutricionista, con idioma y recordatorios. | 4 | Espinoza Cruz, Angela Milagros | Done |
| — | — | T126 | Escribir las pruebas de Nutritional Care y del shell | Pruebas de la consulta guiada, la bandeja de revisión, el expediente, los textos del plan, el inicio y los ajustes. | 10 | Espinoza Cruz, Angela Milagros | Done |
| — | — | T127 | Integrar ramas de la app y publicar la versión 1.0.0 | Integrar las cinco ramas de la app en `develop` y publicar `v1.0.0` en `main`. | 2 | Villarreal Bazan, Angel Martin | Done |

#### 4.2.1.4. Development Evidence for Sprint Review

Durante el Sprint 1 el equipo implementó los tres productos digitales del alcance. En el landing page se construyó el sitio estático de cuatro páginas (inicio, nosotros, contacto y términos) con sus estilos, el motor de traducción español/inglés y los scripts de interacción. En el backend se implementaron los seis bounded contexts (IAM, Care Relationship, Nutritional Care, Food Catalog, Intake & Body Response y Monitoring & Adherence), la capa de read models y el módulo técnico de IA, que exponen 100 operaciones REST. La aplicación móvil Android, escrita en Kotlin con Jetpack Compose, tiene dos shells de navegación (paciente y nutricionista) y cinco módulos por bounded context (IAM y Care Relationship, Monitoring, Food Catalog, Intake y Nutritional Care), con 516 archivos Kotlin de producción, 63 clases de prueba y una base de datos Room para el trabajo sin conexión.

El trabajo siguió GitFlow: cada bloque de trabajo se hizo en una rama `feature/*` y se integró en `develop` mediante un pull request; los pull requests de `develop` a `main` corresponden a los releases. En las tablas, la columna **Branch** indica la rama en la que se hizo el commit. Las ramas `develop` y `main` solo muestran los pull requests integrados en ellas. Cada commit aparece una sola vez, aunque la rama `main` también contenga el historial de `develop`.

<p class="caption"><strong>Tabla 237</strong><br><em>Pull requests y releases por producto en el Sprint 1</em></p>

| Producto | Repositorio | Pull requests | Releases |
|---|---|:---:|---|
| Web Services | `healthify-platform` | 9 (#1 a #9) | `v0.1.0`, `v0.5.0`, `v1.0.0` |
| Landing Page | `healthify-website` | 8 (#1 a #8) | `v1.0.0`, `v1.0.1` |
| Mobile Application | `healthify-android-app` | 6 (#1 a #6) | `v1.0.0` |

<p class="caption"><strong>Figura 145</strong><br><em>Captura de GitHub: pull requests del backend</em></p>

![Pull requests del backend](../assets/img/chapter4/sprint1/gh-platform-pulls.png)

<p class="caption"><strong>Figura 146</strong><br><em>Captura de GitHub: pull requests del landing page</em></p>

![Pull requests del landing page](../assets/img/chapter4/sprint1/gh-website-pulls.png)

<p class="caption"><strong>Figura 147</strong><br><em>Captura de GitHub: pull requests de la aplicación móvil</em></p>

![Pull requests de la aplicación móvil](../assets/img/chapter4/sprint1/gh-android-pulls.png)

**Web Services (backend)**

<p class="caption"><strong>Tabla 238</strong><br><em>Commits del Sprint 1 del backend</em></p>

| Repository | Branch | Commit Id | Commit Message | Commit Message Body | Committed on |
|---|---|---|---|---|---|
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `main` | 17386ec | Initial commit | — | 27/09/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/platform-foundation` | f315906 | chore(repo): normalize line endings and ignore build output | — | 28/09/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/platform-foundation` | 96f3000 | build(solution): add solution and projects at version 0.1.0 | — | 28/09/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/platform-foundation` | 3abf98c | feat(shared): add domain events, repository contracts and result pattern | — | 28/09/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/platform-foundation` | 80911bf | feat(shared): add localized shared and AI messages | — | 28/09/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/platform-foundation` | cbfbeaa | feat(shared): add EF Core context, interceptors and base repository | — | 28/09/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/platform-foundation` | b9e5ee5 | feat(shared): add AI contracts and generation pipeline | — | 28/09/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/platform-foundation` | 0695a0c | feat(shared): add Gemini client, prompt catalog and AI persistence | — | 28/09/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/platform-foundation` | abdff5a | feat(shared): add problem details, route convention and rate limiting | — | 29/09/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/platform-foundation` | 43ee916 | chore(migrations): add shared AI generation migrations | — | 29/09/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/platform-foundation` | 7da095e | chore(config): add appsettings and launch profiles | — | 29/09/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/platform-foundation` | c5a11b4 | feat(app): add composition root bootstrap | — | 29/09/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/platform-foundation` | 8e4efd7 | feat(app): register dependency injection and typed HTTP clients | — | 29/09/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/platform-foundation` | c0785fe | feat(app): register hosted services and request pipeline | — | 29/09/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/platform-foundation` | 4e8f773 | build(docker): add Dockerfile and compose stack | — | 29/09/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/platform-foundation` | 92ac51f | ci(release): add release workflow | — | 30/09/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `develop` | b9642ff | Merge pull request #1 from upc-pre-202620-1acc0238-13981-nutrisync/feature/platform-foundation | Feature/platform foundation | 08/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/identity-and-care-links` | 0f9f636 | feat(iam): add user and session domain model | — | 30/09/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/identity-and-care-links` | aa228a2 | feat(iam): add commands, queries and domain events | — | 30/09/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/identity-and-care-links` | 5a5021c | feat(iam): add localized messages and schema migrations | — | 30/09/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/identity-and-care-links` | b746047 | feat(iam): add application services, event handler and ACL facade | — | 30/09/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/identity-and-care-links` | dc4bc78 | feat(iam): add hashing, tokens, lockout policy and persistence | — | 30/09/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/identity-and-care-links` | 50f9d0e | feat(iam): add authentication, session and user endpoints | — | 01/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/identity-and-care-links` | fec50d2 | feat(care-relationship): add domain model | — | 01/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/identity-and-care-links` | 4df41b4 | feat(care-relationship): add commands, queries and domain events | — | 01/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/identity-and-care-links` | 12ceb0a | feat(care-relationship): add localized messages and schema migrations | — | 01/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/identity-and-care-links` | b3cc5ff | feat(care-relationship): add application services, handlers and ACL facade | — | 01/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/identity-and-care-links` | d265274 | feat(care-relationship): add persistence and invitation expiry job | — | 01/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/identity-and-care-links` | 0b8b2e0 | feat(care-relationship): add invitation, care link and AI preference endpoints | — | 02/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/identity-and-care-links` | befb69f | chore(csproj): set project version to 0.2.0 | — | 02/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/identity-and-care-links` | 54bfd1a | Merge branch 'develop' into feature/identity-and-care-links | — | 08/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `develop` | 61700bf | Merge pull request #3 from upc-pre-202620-1acc0238-13981-nutrisync/feature/identity-and-care-links | Feature/identity and care links | 08/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/nutritional-care` | f358b53 | feat(nutritional-care): add aggregates, entities and errors | — | 02/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/nutritional-care` | dc73b11 | feat(nutritional-care): add value objects | — | 02/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/nutritional-care` | bc25d4a | feat(nutritional-care): add commands and queries | — | 02/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/nutritional-care` | 2b963a2 | feat(nutritional-care): add domain events, repository contracts and services | — | 02/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/nutritional-care` | 1348ea8 | feat(nutritional-care): add localized messages, AI prompts and lexicon | — | 03/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/nutritional-care` | 1f97254 | chore(migrations): add NutritionalCare clinical record migrations | — | 03/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/nutritional-care` | 0bea7a6 | chore(migrations): add NutritionalCare consultation and review inbox migrations | — | 03/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/nutritional-care` | 580084c | feat(nutritional-care): add application command services | — | 03/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/nutritional-care` | dfd851a | feat(nutritional-care): add query services, event handlers, AI outputs and ACL facade | — | 03/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/nutritional-care` | dfaf7d6 | feat(nutritional-care): add calculators, clock, persistence and scheduling | — | 03/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/nutritional-care` | 018541e | feat(nutritional-care): add REST resources, transforms and ACL contract | — | 03/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/nutritional-care` | 31b6be9 | feat(nutritional-care): add clinical endpoints | — | 04/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/nutritional-care` | aced2e1 | chore(csproj): set project version to 0.3.0 | — | 04/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/nutritional-care` | adc1b08 | Merge branch 'develop' into feature/nutritional-care | — | 08/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `develop` | 9c8532d | Merge pull request #4 from upc-pre-202620-1acc0238-13981-nutrisync/feature/nutritional-care | Feature/nutritional care | 08/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/food-catalog-and-intake` | f42a69d | feat(food-catalog): add reference food domain model | — | 04/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/food-catalog-and-intake` | 2e09ab9 | feat(food-catalog): add commands, queries and domain events | — | 04/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/food-catalog-and-intake` | 4356f9c | feat(food-catalog): add localized messages and schema migrations | — | 04/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/food-catalog-and-intake` | f045a56 | feat(food-catalog): add application services, providers and persistence | — | 05/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/food-catalog-and-intake` | f8b13fd | feat(food-catalog): add reference food and local catalog endpoints | — | 05/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/food-catalog-and-intake` | 1c71678 | feat(intake): add diary, meal photo and weigh-in domain model | — | 05/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/food-catalog-and-intake` | 958395b | feat(intake): add commands, queries, events, repository contracts and domain services | — | 05/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/food-catalog-and-intake` | e7a5f8b | feat(intake): add localized messages, AI prompts, lexicon and schema migrations | — | 05/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/food-catalog-and-intake` | 3118c71 | feat(intake): add application command services | — | 05/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/food-catalog-and-intake` | c9635c7 | feat(intake): add query services, handlers and ACL facade | — | 06/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/food-catalog-and-intake` | f5e9edf | feat(intake): add persistence, AI caching, imaging, protocols and jobs | — | 06/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/food-catalog-and-intake` | a9e6b76 | feat(intake): add diary, weigh-in, meal idea and photo analysis endpoints | — | 06/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/food-catalog-and-intake` | 4143451 | chore(csproj): set project version to 0.4.0 | — | 06/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/food-catalog-and-intake` | b64af57 | Merge branch 'develop' into feature/food-catalog-and-intake | — | 08/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `develop` | 669c7c0 | Merge pull request #5 from upc-pre-202620-1acc0238-13981-nutrisync/feature/food-catalog-and-intake | Feature/food catalog and intake | 08/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/monitoring-and-read-models` | 05d432e | feat(monitoring): add evaluation window, deviation and follow-up aggregates | — | 06/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/monitoring-and-read-models` | 7c6aba1 | feat(monitoring): add value objects, errors, repository contracts and services | — | 06/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/monitoring-and-read-models` | 46634b2 | feat(monitoring): add commands, queries and domain events | — | 07/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/monitoring-and-read-models` | 8a29d49 | feat(monitoring): add localized messages, AI prompts, lexicon and schema migrations | — | 07/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/monitoring-and-read-models` | 7721297 | feat(monitoring): add application command services | — | 07/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/monitoring-and-read-models` | e1365ac | feat(monitoring): add query services, AI outputs, handlers and ACL facade | — | 07/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/monitoring-and-read-models` | 66e2a51 | feat(monitoring): add persistence, clock, caching and scheduled jobs | — | 07/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/monitoring-and-read-models` | 6d5e67f | feat(monitoring): add monitoring, follow-up, referral and AI summary endpoints | — | 07/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/monitoring-and-read-models` | 1ad8acd | feat(read-models): add patient record, panel, summary, roster and consultations composers | — | 08/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/monitoring-and-read-models` | 6c4d74c | feat(read-models): add composite view endpoints | — | 08/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/monitoring-and-read-models` | eaf913a | chore(migrations): update AppDbContext model snapshot | — | 08/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/monitoring-and-read-models` | 0b1993c | chore(csproj): set project version to 0.5.0 | — | 08/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/monitoring-and-read-models` | 455de18 | Merge branch 'develop' into feature/monitoring-and-read-models | — | 08/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `develop` | 49481b5 | Merge pull request #6 from upc-pre-202620-1acc0238-13981-nutrisync/feature/monitoring-and-read-models | Feature/monitoring and read models | 08/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/usda-base-url-fix` | 5ccc8b7 | fix(food-catalog): resolve USDA search path relative to the base address | — | 08/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/usda-base-url-fix` | aa17dbe | fix(app): normalize the USDA base address with a trailing slash | — | 08/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/usda-base-url-fix` | 5f2a29b | fix(config): end the default USDA base URL with a slash | — | 08/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/usda-base-url-fix` | 44830dd | docs(readme): add project title and product overview | — | 08/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/usda-base-url-fix` | f150130 | docs(readme): add architecture section | — | 08/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/usda-base-url-fix` | ed5b9f3 | docs(readme): add bounded contexts section | — | 08/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/usda-base-url-fix` | e045ed1 | docs(readme): add running instructions | — | 09/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/usda-base-url-fix` | 7417da2 | docs(readme): add configuration and tests section | — | 09/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/usda-base-url-fix` | 2d48d39 | chore(csproj): set project version to 1.0.0 | — | 09/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `develop` | be29284 | Merge pull request #8 from upc-pre-202620-1acc0238-13981-nutrisync/feature/usda-base-url-fix | Feature/usda base url fix | 09/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `main` | 1875b03 | Merge pull request #2 from upc-pre-202620-1acc0238-13981-nutrisync/develop | Release/0.1.0 | 08/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `main` | 7913042 | Merge pull request #7 from upc-pre-202620-1acc0238-13981-nutrisync/develop | Release/0.5.0 | 08/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `main` | 877ac70 | Merge pull request #9 from upc-pre-202620-1acc0238-13981-nutrisync/develop | Release/1.0.0 | 09/10/2026 |

**Landing Page**

<p class="caption"><strong>Tabla 239</strong><br><em>Commits del Sprint 1 del landing page</em></p>

| Repository | Branch | Commit Id | Commit Message | Commit Message Body | Committed on |
|---|---|---|---|---|---|
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-website | `main` | 117e780 | Initial commit | — | 27/09/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-website | `feature/foundation` | 5f20870 | feat(assets): add brand identity and icon set | — | 28/09/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-website | `feature/foundation` | d037374 | feat(css): add design tokens, reset and buttons | — | 28/09/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-website | `feature/foundation` | f08ac5c | feat(css): add navbar, language switch and mobile menu | — | 29/09/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-website | `feature/foundation` | f478ecb | feat(i18n): add translation engine with language persistence | — | 29/09/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-website | `feature/foundation` | e51974c | feat(js): add mobile nav and language switch | — | 29/09/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-website | `feature/foundation` | 40c7d66 | feat(index): add page shell with header, mobile menu and footer | — | 30/09/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-website | `feature/foundation` | a54db14 | docs(readme): document pages, structure and local setup | — | 04/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-website | `feature/foundation` | 09769d5 | Merge branch 'develop' into feature/foundation | — | 06/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-website | `develop` | 530aeb9 | Merge pull request #2 from upc-pre-202620-1acc0238-13981-nutrisync/feature/foundation | Feature/foundation | 06/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-website | `feature/home-hero-problem` | 9bfbeec | feat(assets): add hero phone screen | — | 30/09/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-website | `feature/home-hero-problem` | 2dab404 | feat(css): add hero and carousel styles | — | 30/09/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-website | `feature/home-hero-problem` | 86e97cd | feat(js): add hero carousel | — | 01/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-website | `feature/home-hero-problem` | 896d1dc | feat(index): add hero carousel section | — | 01/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-website | `feature/home-hero-problem` | 8669297 | feat(css): add problem section styles | — | 02/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-website | `feature/home-hero-problem` | b2f10c8 | feat(index): add problem section | — | 02/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-website | `feature/home-hero-problem` | ae74bad | feat(i18n): add hero and problem translations | — | 02/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-website | `feature/home-hero-problem` | 993b334 | Merge branch 'develop' into feature/home-hero-problem | — | 06/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-website | `develop` | 137e65c | Merge pull request #3 from upc-pre-202620-1acc0238-13981-nutrisync/feature/home-hero-problem | Feature/home hero problem | 06/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-website | `feature/home-showcases` | 0dad0e2 | feat(assets): add feature screenshots | — | 30/09/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-website | `feature/home-showcases` | dc3a466 | feat(css): add showcase layout and sticky pinning | — | 30/09/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-website | `feature/home-showcases` | 1f0edfe | feat(js): add patient and nutritionist showcases | — | 01/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-website | `feature/home-showcases` | 75c3a12 | feat(index): add patient section | — | 01/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-website | `feature/home-showcases` | ad8c058 | feat(css): add nutritionist mock screens | — | 02/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-website | `feature/home-showcases` | b07dc8d | feat(index): add nutritionist section | — | 03/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-website | `feature/home-showcases` | 1310aee | feat(i18n): add showcase translations | — | 03/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-website | `feature/home-showcases` | 1923d67 | Merge branch 'develop' into feature/home-showcases | — | 06/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-website | `develop` | 2e4c3da | Merge pull request #5 from upc-pre-202620-1acc0238-13981-nutrisync/feature/home-showcases | Feature/home showcases | 06/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-website | `feature/home-how-faq-terms` | 9366029 | feat(assets): add path-end illustration | — | 01/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-website | `feature/home-how-faq-terms` | 549eb06 | feat(index): add how-it-works section | — | 01/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-website | `feature/home-how-faq-terms` | a650ae3 | feat(faq): add FAQ accordion and filters | — | 02/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-website | `feature/home-how-faq-terms` | 65b7420 | feat(terms): add page shell and hero | — | 03/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-website | `feature/home-how-faq-terms` | ff1e4f3 | feat(terms): add table of contents and clauses | — | 03/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-website | `feature/home-how-faq-terms` | 9222502 | feat(css): add terms layout and stepper | — | 04/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-website | `feature/home-how-faq-terms` | 5b036c2 | feat(js): add terms index and desktop page scrolling | — | 04/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-website | `feature/home-how-faq-terms` | 5f1eda3 | Merge branch 'develop' into feature/home-how-faq-terms | — | 06/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-website | `develop` | f6b7089 | Merge pull request #4 from upc-pre-202620-1acc0238-13981-nutrisync/feature/home-how-faq-terms | Feature/home how faq terms | 06/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-website | `feature/about-contact` | 32fcda7 | feat(assets): add mission and vision illustrations | — | 02/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-website | `feature/about-contact` | 1eae4da | feat(about): add hero, story and purpose sections | — | 03/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-website | `feature/about-contact` | 492145a | feat(about): add values and team sections | — | 03/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-website | `feature/about-contact` | 3b89f33 | feat(about): add FAQ section | — | 04/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-website | `feature/about-contact` | 693ac0b | feat(contact): add page and hero | — | 04/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-website | `feature/about-contact` | cac9782 | feat(contact): add contact form with validation | — | 05/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-website | `feature/about-contact` | 7a82896 | feat(i18n): add about and contact translations | — | 05/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-website | `develop` | 4512e65 | Merge pull request #1 from upc-pre-202620-1acc0238-13981-nutrisync/feature/about-contact | Feature/about contact | 06/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-website | `fix/restore-sources` | 40831ea | fix(index): restore document structure and section order | — | 06/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-website | `fix/restore-sources` | 2ea62cf | fix(js): restore main.js bootstrap and function bodies | — | 06/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-website | `fix/restore-sources` | a5cc898 | fix(i18n): restore translation object structure | — | 06/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-website | `fix/restore-sources` | dcbdccb | fix(css): restore rule order for base, hero, showcases, how-it-works and FAQ | — | 06/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-website | `fix/restore-sources` | 6821bb0 | fix(css): restore missing braces and rule order for about, contact, terms and responsive | — | 06/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-website | `develop` | 26d9151 | Merge pull request #7 from upc-pre-202620-1acc0238-13981-nutrisync/fix/restore-sources | Fix/restore sources | 06/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-website | `main` | 25f9889 | Merge pull request #6 from upc-pre-202620-1acc0238-13981-nutrisync/develop | Release/1.0.0 | 06/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-website | `main` | 8098a5b | Create CNAME | — | 06/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-website | `main` | cfa70b0 | Delete CNAME | — | 06/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-website | `main` | 4ea8878 | Merge pull request #8 from upc-pre-202620-1acc0238-13981-nutrisync/develop | Release/1.0.1 | 06/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-website | `main` | b32908f | Create CNAME | — | 06/10/2026 |

**Mobile Application (Android)**

Los commits de la app no tienen un tipo `test` aparte: cada commit de funcionalidad incluye sus pruebas de JVM (ver sección 4.2.1.5).

<p class="caption"><strong>Tabla 240</strong><br><em>Commits del Sprint 1 de la aplicación móvil</em></p>

| Repository | Branch | Commit Id | Commit Message | Commit Message Body | Committed on |
|---|---|---|---|---|---|
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `main` | e939895 | Initial commit | — | 09/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `feature/foundation-design-system` | 9817d17 | chore(build): set up Gradle project, version catalog and wrapper | — | 09/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `feature/foundation-design-system` | ff46645 | feat(resources): add fonts, launcher icons, es/en strings and security configs | — | 09/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `feature/foundation-design-system` | 8682c36 | feat(core): add shared kernel, network, DI and offline sync queue | — | 09/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `feature/foundation-design-system` | 0be6819 | feat(designsystem): add Healthify M3 theme, icons, components and debug catalog | — | 09/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `develop` | 313f9fe | Merge pull request #1 from upc-pre-202620-1acc0238-13981-nutrisync/feature/foundation-design-system | Feature/foundation design system | 09/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `feature/iam-care-relationship` | ef4dd64 | feat(iam): add domain model, value objects and use cases | — | 09/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `feature/iam-care-relationship` | ffa741e | feat(iam): add auth API, session storage and mappers | — | 09/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `feature/iam-care-relationship` | 2bd8207 | feat(carerelationship): add invitation redemption and consent flow | — | 09/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `feature/iam-care-relationship` | 8fd2d7e | feat(iam): add splash, sign-up, sign-in and care-link screens | — | 09/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `develop` | f938347 | Merge pull request #2 from upc-pre-202620-1acc0238-13981-nutrisync/feature/iam-care-relationship | Feature/iam care relationship | 09/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `feature/monitoring-food-catalog` | afe38e5 | feat(foodcatalog): add reference food catalog with local cache | — | 09/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `feature/monitoring-food-catalog` | bf1f5c6 | feat(monitoring): add domain and use cases for progress and follow-ups | — | 09/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `feature/monitoring-food-catalog` | db4a4f2 | feat(monitoring): add monitoring repositories and mappers | — | 09/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `feature/monitoring-food-catalog` | 6afb611 | feat(monitoring): add progress, consultations and agenda screens | — | 09/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `develop` | ed87363 | Merge pull request #3 from upc-pre-202620-1acc0238-13981-nutrisync/feature/monitoring-food-catalog | Feature/monitoring food catalog | 09/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `feature/intake-diary` | 24bd3a5 | feat(intake): add diary, targets and weigh-in domain and use cases | — | 09/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `feature/intake-diary` | ee6af9e | feat(intake): add diary, photo and weight APIs, offline queue and mappers | — | 09/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `feature/intake-diary` | e4d1def | feat(intake): add diary and meal logging view models and components | — | 09/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `feature/intake-diary` | efd9962 | feat(intake): add diary, photo and weigh-in screens | — | 09/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `develop` | feb16dc | Merge pull request #4 from upc-pre-202620-1acc0238-13981-nutrisync/feature/intake-diary | Feature/intake diary | 09/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `feature/nutritional-care-app-shell` | 511baae | feat(nutritionalcare): add consultation, plan and review domain | — | 09/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `feature/nutritional-care-app-shell` | 8042596 | feat(nutritionalcare): add clinical record and plan repositories | — | 09/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `feature/nutritional-care-app-shell` | 73cdd4f | feat(nutritionalcare): add practitioner consultation and plan screens | — | 09/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `feature/nutritional-care-app-shell` | 7c1f07b | feat(app): wire navigation shells, Room database and entry points | — | 09/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `develop` | dd9c2e9 | Merge pull request #5 from upc-pre-202620-1acc0238-13981-nutrisync/feature/nutritional-care-app-shell | Feature/nutritional care app shell | 09/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `main` | c829f7b | Merge pull request #6 from upc-pre-202620-1acc0238-13981-nutrisync/develop | Release/1.0.0 | 09/10/2026 |

#### 4.2.1.5. Testing Suite Evidence for Sprint Review

El Sprint 1 tiene dos suites de pruebas automatizadas: la del backend y la de la aplicación móvil.

**Web Services (backend)**

La suite del backend está en el proyecto `Healthify.Platform.Tests`, dentro del repositorio `healthify-platform` (https://github.com/upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform). Se escribió con xUnit y NSubstitute. Las pruebas son de tres tipos:

- **Pruebas unitarias** de agregados, objetos de valor, políticas y calculadores del dominio.
- **Pruebas de integración en memoria** de los servicios de aplicación, los manejadores de eventos, las fachadas ACL y los controladores, con repositorios y reloj de prueba (`TestSupport`).
- **Pruebas de integración con MySQL**, que verifican la persistencia, las migraciones y las restricciones únicas. Se ejecutan solo cuando la variable `HEALTHIFY_IT_MYSQL` apunta a un servidor.

Los criterios de aceptación de las historias técnicas están redactados en Gherkin en la sección 2.4.1. En este sprint no se generaron archivos `.feature` ni archivos de pasos: los escenarios se automatizaron como pruebas de xUnit cuyo nombre describe el comportamiento verificado. El landing page no tiene pruebas automatizadas; se revisó de forma manual en el navegador, en español e inglés.

La suite se ejecutó con `dotnet test healthify-platform.sln` sobre el estado de `develop` el 09/10/2026 con resultado **1374 pruebas superadas, 0 con error y 35 omitidas** (1409 en total). Las 35 omitidas son las pruebas de integración con MySQL, que no se ejecutan sin `HEALTHIFY_IT_MYSQL`.

<p class="caption"><strong>Tabla 241</strong><br><em>Resultados de la suite de pruebas</em></p>

| Área de pruebas | Total | Superadas | Omitidas (MySQL) |
|---|:---:|:---:|:---:|
| Iam | 89 | 83 | 6 |
| CareRelationship | 90 | 90 | 0 |
| NutritionalCare | 525 | 515 | 10 |
| FoodCatalog | 64 | 64 | 0 |
| IntakeBodyResponse | 227 | 216 | 11 |
| MonitoringAdherence | 289 | 285 | 4 |
| ReadModels | 33 | 31 | 2 |
| Ai | 62 | 60 | 2 |
| Shared | 26 | 26 | 0 |
| Composition | 4 | 4 | 0 |
| **Total** | **1409** | **1374** | **35** |

Relación entre las historias técnicas y las clases de prueba. Entre paréntesis, el número de pruebas de cada clase.

<p class="caption"><strong>Tabla 242</strong><br><em>Relación entre historias técnicas y clases de prueba</em></p>

| Historia | Clases de prueba | Comportamientos verificados |
|---|---|---|
| TS01 | `PersonNameTests` (11), `RegisterAccountNameTests` (6), `PreferredLanguageTests` (18), `TemporaryLockoutTests` (5), `RefreshTokenRotationTests` (14), `RefreshRetryGraceTests` (7), `UsersByIdsFacadeTests` (4), `ErrorCodeExtensionTests` (19), `IamSessionMySqlTests` (5) | Validación de nombres, idioma `es` por defecto, bloqueo temporal de 15 minutos, rotación del token de renovación, reintento dentro del periodo de gracia, finalización de la sesión ante reúso y códigos de error estables. |
| TS02 | `PatientCannotSelfLinkTests` (3), `SwitchPractitionerTests` (15), `AiProcessingConsentTests` (13), `AiConsentEndsWithLinkTests` (7), `AiPreferencesTests` (18), `AcknowledgedAtTests` (3), `ErrorCodeExtensionTests` (31) | Un emisor no puede canjear su propia invitación, el cambio de nutricionista revoca el vínculo anterior en la misma transacción, el consentimiento para IA termina con el vínculo y el acuse de metas guarda solo el momento. |
| TS03 | `ConsultationLifecycleTests` (18), `ConsultationMeasurementTests` (15), `ConsultationDiagnosisTests` (16), `ConsultationRedoAndDiscardTests` (6), `ConsultationQueryAndRestTests` (19), `PatientBaselineTests` (23), `StructuredAssessmentValueObjectsTests` (43), `DiagnosisCodeTests` (21), `OneActiveDiagnosisPerPatientTests` (5), `ClosedAssessmentStaysImmutableTests` (4), `ClinicalDateTests` (6) | Pasos de la consulta guiada, un solo diagnóstico activo por paciente, evaluación cerrada inmutable, rangos clínicos válidos, categoría de IMC según la OMS y fecha clínica en la zona horaria de Lima. |
| TS04 | `ConsultationTargetsTests` (16), `PublishFromConsultationTests` (21), `OneActiveVersionPerPatientTests` (4), `PlanVersionDiffTests` (7), `PatientPlanVersionsTests` (6), `PatientMessagePerVersionTests` (9), `DefaultTargetParametersPolicyTests` (7), `PlanAdjustmentProposalTests` (26), `PlanProposalInReviewItemTests` (16), `ReviewInboxEvidenceTests` (15) | Cálculo y edición de metas, una sola versión activa, diferencia entre versiones, mensaje por versión, propuesta de ajuste dentro de los límites de seguridad y aceptación solo por el nutricionista de la bandeja. |
| TS05 | `AnalyzedPhotoLogTests` (9), `PhotoLogConfirmationTests` (9), `MealGroupLogTests` (11), `PlanAdherenceTests` (13), `PlanAdherenceCommandTests` (10), `RetroactiveLoggingWindowTests` (5), `DailyIntakeSummaryOffPlanTests` (3), `ResolveByNamesTests` (17), `AiEstimatedFoodTests` (35), `MealPhotoRecognitionTests` (24) | Una estimación sin confirmar no cuenta como ingesta, ventana de registro retroactivo de 48 horas, adherencia al plan (`InPlan`, `OffPlan`, `NotAnswered`), resolución de alimentos por nombre y alimentos estimados por IA con nutrientes coherentes. |
| TS06 | `FastedOnlyProtocolTests` (12), `WeightTrendRangeTests` (13), `WeightTrendSummaryTests` (4), `SelfWeighInMySqlTests` (5) | Solo las lecturas en ayunas entran en la tendencia, la tendencia se calcula como pendiente semanal y el rango de semanas se acota. |
| TS07 | `PatientRecordByRoleTests` (5), `PatientSummaryComposerTests` (7), `PatientMonitoringPanelComposerTests` (5), `PatientRosterComposerTests` (5), `DailyComplianceRangeTests` (14), `UnloggedIsNotNonCompliantTests` (8), `ComplianceSummaryTests` (3), `WindowHandoverOnSwitchTests` (5), `ConsistencyPromptAcknowledgementTests` (9) | El expediente del paciente nunca incluye diagnóstico, base de cálculo ni IMC; un día sin registros es «sin registro» y no incumplimiento; el panel y el listado leen cada fachada una sola vez. |
| TS08 | `SelfWeighInSyncTests` (11), `SyncPlanAdherenceTests` (6), `BatchGapDaysTests` (2), `OfflineDaysSignalTests` (4) | Un registro reenviado no se duplica, el servidor no cambia la hora registrada por el paciente, cada registro se procesa por separado y los días sin conexión se marcan una sola vez. |
| TS09 | `AiGenerationPipelineTests` (19), `AiInputPseudonymizerTests` (5), `AiSchemaAndPromptCatalogTests` (13), `GeminiLanguageModelClientTests` (15), `AiImageInputTests` (6), `GeneratedTextValidatorTests` (25), `MealIdeasTests` (37), `SharedKernelIndependenceTests` (2) | Sin consentimiento nunca se llama al modelo, las entradas se pseudonimizan, una salida que no cumple el esquema se rechaza, los textos para el paciente no mencionan diagnóstico ni acusan, un reintento ante errores 5xx y el módulo compartido no depende de ningún contexto. |
| TS10 | `ScheduleFollowUpPreparationTests` (9), `FollowUpPreparationAndModalityTests` (15), `FollowUpStateTransitionsTests` (11), `CancelAndRescheduleFollowUpTests` (8), `PreVisitCheckInTests` (17), `PreVisitCheckInCommandServiceTests` (10), `ConsultationCompletesFollowUpTests` (7), `DischargeCancelsFutureFollowUpsTests` (6), `PatientFollowUpsQueryTests` (6) | Estados de la cita, preparación y modalidad, cancelación y reprogramación solo por el nutricionista de la agenda, publicación de la consulta completa su cita y el alta cancela las citas futuras. |
| Transversal | `RateLimitingTests` (20), `ProblemDetailsErrorCodesTests` (6), `ServiceProviderCompositionTests` (4) | Límite de solicitudes por minuto, códigos de error en Problem Details, activación de todos los controladores desde el contenedor y generación del documento de Swagger. |

Commits de pruebas del Sprint 1:

<p class="caption"><strong>Tabla 243</strong><br><em>Commits de pruebas del backend en el Sprint 1</em></p>

| Repository | Branch | Commit Id | Commit Message | Commit Message Body | Committed on |
|---|---|---|---|---|---|
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/platform-foundation` | aad3e76 | test(shared): add shared test support, AI and rate-limit tests | — | 30/09/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/identity-and-care-links` | 4708780 | test(iam): add Iam tests | — | 01/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/identity-and-care-links` | aec0898 | test(care-relationship): add tests | — | 02/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/nutritional-care` | ade3bc7 | test(nutritional-care): add domain and application tests | — | 04/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/nutritional-care` | ad6e27b | test(nutritional-care): add MySQL integration tests | — | 04/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/food-catalog-and-intake` | 7fba450 | test(food-catalog): add tests | — | 05/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/food-catalog-and-intake` | 339bf40 | test(intake): add tests | — | 06/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/monitoring-and-read-models` | e4d485d | test(monitoring): add tests | — | 07/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/monitoring-and-read-models` | 3bdcd07 | test(read-models): add composer and session mapping tests | — | 08/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/monitoring-and-read-models` | 2c20434 | test(composition): add cross-context test support, AI pipeline and DI composition tests | — | 08/10/2026 |

**Mobile Application (Android)**

La suite de la app está en `app/src/test` del repositorio `healthify-android-app` (https://github.com/upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app). Son pruebas de JVM con JUnit 4, MockK, Turbine y `kotlinx-coroutines-test` sobre las cuatro capas de cada módulo: objetos de valor y entidades del dominio, casos de uso, repositorios y mappers de infraestructura, y ViewModels de presentación, con dobles de prueba en la carpeta `testing`. No hay pruebas instrumentadas (`androidTest`) en este sprint. Tampoco hay archivos `.feature`: los escenarios de las historias se automatizaron como pruebas cuyo nombre describe el comportamiento.

Se ejecutaron con `./gradlew :app:testDebugUnitTest` sobre la rama `main` el 09/10/2026, con resultado **567 pruebas superadas, 0 con error y 0 omitidas**, en 63 clases de prueba.

<p class="caption"><strong>Tabla 244</strong><br><em>Pruebas por módulo de la aplicación móvil</em></p>

| Módulo | Pruebas | Clases | Historias relacionadas |
|---|:---:|:---:|---|
| iam | 72 | 10 | US28, US29, US30 |
| carerelationship | 93 | 11 | US01 a US07, US24, US41 |
| foodcatalog | 12 | 2 | US10, US44 |
| intake | 151 | 16 | US08 a US13, US31, US42, US43 |
| monitoring | 64 | 7 | US14 a US16, US18, US19, US39, US40, US42 |
| nutritionalcare | 119 | 9 | US17, US18, US20 a US23, US25 a US27 |
| main | 20 | 2 | US23, US30, US43 |
| onboarding | 5 | 1 | US28, US29 |
| core/network | 20 | 4 | Transversal: red y renovación de sesión |
| core/sync | 11 | 1 | US31 |
| **Total** | **567** | **63** | |

Comportamientos verificados por módulo, con clases de ejemplo:

<p class="caption"><strong>Tabla 245</strong><br><em>Comportamientos verificados por módulo de la aplicación móvil</em></p>

| Módulo | Clases de prueba (n) | Comportamientos verificados |
|---|---|---|
| core | `TokenRefreshAuthenticatorTest` (8), `ProblemDetailsMapperTest` (7), `ApiCallTest` (4), `PendingSyncEngineTest` (11) | Un `401` renueva el par de tokens y reintenta con el nuevo, se envían `Authorization` y `Accept-Language` en las solicitudes protegidas, los errores Problem Details se traducen a mensajes, y la cola de operaciones conserva todo ante un fallo transitorio y no reintenta lo que el servidor rechazó. |
| iam | `SignInViewModelTest` (10), `SignUpViewModelTest` (10), `SignUpValueObjectsTest` (10), `SessionRepositoryImplTest` (6), `IamUseCasesTest` (9) | Sin conexión no se llama al backend, un inicio de sesión correcto avanza a la pantalla siguiente, y los datos de registro se validan en objetos de valor. |
| carerelationship | `ScanInvitationViewModelTest` (9), `SwitchPractitionerFlowTest` (4), `ConsentViewModelTest` (9), `AiFeaturesViewModelTest` (9), `TargetsAcknowledgementUseCasesTest` (6) | Un QR que no es una invitación se rechaza sin llamar al servidor, el cambio de nutricionista reemplaza el vínculo y pide el consentimiento del nuevo, y una función de IA no se activa sin consentimiento. |
| foodcatalog | `FoodCatalogTest` (8), `LocalFoodCatalogTest` (4) | La búsqueda necesita al menos dos caracteres, el catálogo del teléfono ordena primero los prefijos y los alimentos locales, y sin conexión responde solo con lo local. |
| intake | `MealPhotoViewModelTest` (19), `ManualMealViewModelTest` (9), `DiaryOfflineQueueTest` (10), `SelfWeighInSyncTest` (12), `JpegMetadataStripperTest` (6), `WeightTrendViewModelTest` (10), `ReminderTest` (4) | Un registro sin conexión se encola con su identificador y su hora local exactos, la foto se envía sin EXIF ni otros metadatos, el registro manual exige alimento, porción válida y respuesta sobre el plan, y los recordatorios parten apagados. |
| monitoring | `HowAmITodayViewModelTest` (4), `PractitionerAgendaTest` (19), `ConsultationsTest` (13), `WeeklySummaryTest` (8), `CheckInViewModelTest` (10) | Sin registros el día es una invitación y no un error, la agenda lista las citas desde ahora y rechaza momentos pasados sin llamar al backend. |
| nutritionalcare | `ConsultationStepsViewModelTest` (29), `ReviewInboxTest` (19), `ReviewInboxViewModelsTest` (16), `PatientTabsViewModelTest` (15), `PlanTextsTest` (6) | La consulta guiada vuelve al paso 2 si falta el diagnóstico, los valores propios exigen un motivo antes de enviarse, y el texto escrito por el nutricionista se muestra tal cual, sin traducirlo. |
| main | `PatientHomeViewModelTest` (15), `PatientSettingsViewModelTest` (5) | Sin conexión el inicio muestra las metas guardadas en el teléfono, y sin índice de consistencia no hay tarjeta. |

Commits de la app que incluyen pruebas (la columna Commit Message Body no aplica; las pruebas viajan dentro del commit de funcionalidad):

<p class="caption"><strong>Tabla 246</strong><br><em>Commits de la aplicación móvil que incluyen pruebas</em></p>

| Repository | Branch | Commit Id | Commit Message | Commit Message Body | Committed on |
|---|---|---|---|---|---|
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `feature/foundation-design-system` | 8682c36 | feat(core): add shared kernel, network, DI and offline sync queue | — | 09/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `feature/iam-care-relationship` | ef4dd64 | feat(iam): add domain model, value objects and use cases | — | 09/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `feature/iam-care-relationship` | ffa741e | feat(iam): add auth API, session storage and mappers | — | 09/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `feature/iam-care-relationship` | 2bd8207 | feat(carerelationship): add invitation redemption and consent flow | — | 09/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `feature/iam-care-relationship` | 8fd2d7e | feat(iam): add splash, sign-up, sign-in and care-link screens | — | 09/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `feature/monitoring-food-catalog` | afe38e5 | feat(foodcatalog): add reference food catalog with local cache | — | 09/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `feature/monitoring-food-catalog` | db4a4f2 | feat(monitoring): add monitoring repositories and mappers | — | 09/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `feature/monitoring-food-catalog` | 6afb611 | feat(monitoring): add progress, consultations and agenda screens | — | 09/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `feature/intake-diary` | 24bd3a5 | feat(intake): add diary, targets and weigh-in domain and use cases | — | 09/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `feature/intake-diary` | ee6af9e | feat(intake): add diary, photo and weight APIs, offline queue and mappers | — | 09/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `feature/intake-diary` | e4d1def | feat(intake): add diary and meal logging view models and components | — | 09/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `feature/nutritional-care-app-shell` | 511baae | feat(nutritionalcare): add consultation, plan and review domain | — | 09/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `feature/nutritional-care-app-shell` | 8042596 | feat(nutritionalcare): add clinical record and plan repositories | — | 09/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `feature/nutritional-care-app-shell` | 73cdd4f | feat(nutritionalcare): add practitioner consultation and plan screens | — | 09/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `feature/nutritional-care-app-shell` | 7c1f07b | feat(app): wire navigation shells, Room database and entry points | — | 09/10/2026 |

#### 4.2.1.6. Execution Evidence for Sprint Review

En el Sprint 1 se publicó el landing page, se desplegó el backend completo y se construyó la aplicación móvil. El landing page está disponible en https://landing.healthify.lat, en español y en inglés, con cuatro páginas y las secciones que cubren las historias US32 a US38 y US45. El backend está disponible en https://platform.healthify.lat y su documentación interactiva en https://platform.healthify.lat/swagger. La aplicación móvil Android 1.0 se instala con el APK de `assembleRelease` y consume el backend publicado. A continuación se presentan las vistas principales de cada producto.

Tres elementos del landing page quedan pendientes de conectar con productos que aún no se publican: el enlace «Iniciar sesión» apunta a un marcador interno hasta que exista la dirección de inicio de sesión de la aplicación, las diapositivas de video del carrusel se activan al configurar el identificador de YouTube de cada video, y el formulario de contacto valida los datos y muestra la confirmación en el navegador sin enviarlos a un servidor.

En la revisión del sprint, el Product Owner aceptó 45 de las 55 historias. Las diez restantes tenían implementada la mayor parte de su alcance, pero no cumplían todos sus escenarios de aceptación, por lo que volvieron al Product Backlog y se incluyeron en el Sprint 2 (sección 4.2.2.1):

- **US11 y TS05:** falta la sugerencia de respuesta a «¿Esta comida estaba en tu plan?» (escenario «Sugerencia de respuesta» y «Sugerencia de adherencia»).
- **US14:** el cumplimiento del día se evaluaba con la fecha UTC y no con el calendario del paciente, de modo que un registro hecho de noche en Lima podía contarse en el día siguiente.
- **US18 y TS07:** la opción «Descargar una copia de mis datos» de los ajustes era un marcador sin endpoint detrás (escenario «Descarga de mis datos» y «Exportación de datos del paciente»).
- **US19:** el backend permite cerrar una derivación, pero la app no ofrece la acción (escenario «Cierre de la derivación»).
- **US29 y TS01:** no existe la recuperación de contraseña; el enlace de la pantalla de inicio de sesión abre un aviso (escenario «Recuperación de contraseña»).
- **US32:** el inicio no muestra testimonios (escenario «Testimonios»).
- **US36:** los botones de acceso no llevan a la descarga de la aplicación, porque la app aún no se distribuye (escenario «Nutricionista interesado»).

**Landing Page**

Hero con carrusel de cuatro diapositivas (nutricionistas, pacientes, video del producto y video del equipo) y botones de acceso según el rol (US32, US36).

<p class="caption"><strong>Figura 148</strong><br><em>Captura del landing page: sección Hero</em></p>

![Hero](../assets/img/chapter4/sprint1/landing-hero.png)

Sección del problema (US32).

<p class="caption"><strong>Figura 149</strong><br><em>Captura del landing page: sección Problema</em></p>

![Problema](../assets/img/chapter4/sprint1/landing-problem.png)

Funciones para el paciente, con la lista de diez funciones y la pantalla de cada una (US33).

<p class="caption"><strong>Figura 150</strong><br><em>Captura del landing page: sección Para el paciente</em></p>

![Para el paciente](../assets/img/chapter4/sprint1/landing-patient.png)

Funciones para el nutricionista, con once funciones agrupadas por momento (US33).

<p class="caption"><strong>Figura 151</strong><br><em>Captura del landing page: sección Para el nutricionista</em></p>

![Para el nutricionista](../assets/img/chapter4/sprint1/landing-nutritionist.png)

Cómo funciona: consulta guiada en cuatro pasos y ciclo entre consultas (US36).

<p class="caption"><strong>Figura 152</strong><br><em>Captura del landing page: sección Cómo funciona</em></p>

![Cómo funciona](../assets/img/chapter4/sprint1/landing-how-it-works.png)

Preguntas frecuentes con acordeón y filtros por tema (US45).

<p class="caption"><strong>Figura 153</strong><br><em>Captura del landing page: preguntas frecuentes</em></p>

![Preguntas frecuentes](../assets/img/chapter4/sprint1/landing-faq.png)

Página «Nosotros»: hero, misión y visión, y equipo (US34).

<p class="caption"><strong>Figura 154</strong><br><em>Captura del landing page: página Nosotros</em></p>

![Nosotros](../assets/img/chapter4/sprint1/landing-about-hero.png)

<p class="caption"><strong>Figura 155</strong><br><em>Captura del landing page: misión y visión</em></p>

![Misión y visión](../assets/img/chapter4/sprint1/landing-about-purpose.png)

<p class="caption"><strong>Figura 156</strong><br><em>Captura del landing page: equipo</em></p>

![Equipo](../assets/img/chapter4/sprint1/landing-about-team.png)

Página de contacto y formulario con los mensajes de validación por campo (US37).

<p class="caption"><strong>Figura 157</strong><br><em>Captura del landing page: página Contacto</em></p>

![Contacto](../assets/img/chapter4/sprint1/landing-contact.png)

<p class="caption"><strong>Figura 158</strong><br><em>Captura del landing page: validación del formulario de contacto</em></p>

![Validación del formulario](../assets/img/chapter4/sprint1/landing-contact-validation.png)

Confirmación al enviar el formulario con datos válidos (US37).

<p class="caption"><strong>Figura 159</strong><br><em>Captura del landing page: confirmación del formulario</em></p>

![Confirmación del formulario](../assets/img/chapter4/sprint1/landing-contact-success.png)

Términos y condiciones, con tabla de contenido y una cláusula por pantalla, en inglés (US35, US38).

<p class="caption"><strong>Figura 160</strong><br><em>Captura del landing page: términos y condiciones</em></p>

![Términos y condiciones](../assets/img/chapter4/sprint1/landing-terms-body.png)

Footer con navegación, enlaces legales, redes, contacto y selector de idioma.

<p class="caption"><strong>Figura 161</strong><br><em>Captura del landing page: footer</em></p>

![Footer](../assets/img/chapter4/sprint1/landing-footer.png)

Cambio de idioma a inglés (US35).

<p class="caption"><strong>Figura 162</strong><br><em>Captura del landing page en inglés: hero</em></p>

![Hero en inglés](../assets/img/chapter4/sprint1/landing-hero-en.png)

<p class="caption"><strong>Figura 163</strong><br><em>Captura del landing page en inglés: sección del nutricionista</em></p>

![Nutricionista en inglés](../assets/img/chapter4/sprint1/landing-nutritionist-en.png)

**Mobile Application (Android)**

Las capturas corresponden a la aplicación ejecutada en un emulador Android con una sesión de paciente vinculada a su nutricionista, conectada al backend publicado. La app está disponible en español e inglés, con selector de idioma en los ajustes; las capturas están en inglés. Las pantallas del nutricionista (consulta guiada, agenda, bandeja de revisión) están cubiertas por las pruebas de ViewModel de la sección 4.2.1.5.

<p class="caption"><strong>Figura 164</strong><br><em>Capturas de la aplicación móvil en ejecución en un emulador Android</em></p>

<table>
  <tr>
    <td align="center"><img src="../assets/img/chapter4/sprint1/app-patient-home.png" alt="Inicio del paciente" width="190" /></td>
    <td align="center"><img src="../assets/img/chapter4/sprint1/app-patient-how-am-i-today.png" alt="Cómo voy hoy" width="190" /></td>
    <td align="center"><img src="../assets/img/chapter4/sprint1/app-patient-diary.png" alt="Diario del día" width="190" /></td>
    <td align="center"><img src="../assets/img/chapter4/sprint1/app-patient-manual-meal.png" alt="Registro a mano" width="190" /></td>
  </tr>
  <tr>
    <td valign="top"><strong>Inicio del paciente.</strong> Metas vigentes con el avance del día, macronutrientes, botón para registrar una comida y acceso a «Cómo voy hoy» (US14, US23).</td>
    <td valign="top"><strong>Cómo voy hoy.</strong> Describe el resultado del día en palabras, sin cifras en rojo (US14).</td>
    <td valign="top"><strong>Diario del día.</strong> Comidas con su origen (a mano o por foto con su confianza), confirmación, si estaban en el plan y acceso a las ideas con IA (US08 a US11, US42).</td>
    <td valign="top"><strong>Registro a mano.</strong> Búsqueda en el catálogo guardado en el teléfono, porción y hora, con ventana de 48 horas (US10).</td>
  </tr>
  <tr>
    <td align="center"><img src="../assets/img/chapter4/sprint1/app-patient-progress.png" alt="Progreso" width="190" /></td>
    <td align="center"><img src="../assets/img/chapter4/sprint1/app-patient-weigh-in.png" alt="Autopesaje" width="190" /></td>
    <td align="center"><img src="../assets/img/chapter4/sprint1/app-patient-record.png" alt="Mi expediente" width="190" /></td>
    <td align="center"><img src="../assets/img/chapter4/sprint1/app-patient-consultations.png" alt="Mis consultas" width="190" /></td>
  </tr>
  <tr>
    <td valign="top"><strong>Progreso.</strong> Tendencia de peso, que no se muestra hasta tener dos pesajes que sigan el protocolo (US13).</td>
    <td valign="top"><strong>Autopesaje.</strong> Peso, hora y pregunta sobre el protocolo de ayunas (US12).</td>
    <td valign="top"><strong>Mi expediente.</strong> Nutricionista vinculado, consultas, números clave, plan con pautas y restricciones, y derivaciones (US18, US23).</td>
    <td valign="top"><strong>Mis consultas.</strong> Próxima consulta y consultas anteriores (US18, US40).</td>
  </tr>
  <tr>
    <td align="center"><img src="../assets/img/chapter4/sprint1/app-patient-settings.png" alt="Ajustes" width="190" /></td>
    <td align="center"><img src="../assets/img/chapter4/sprint1/app-patient-ai-features.png" alt="Funciones de IA" width="190" /></td>
    <td align="center"><img src="../assets/img/chapter4/sprint1/app-patient-reminders.png" alt="Recordatorios" width="190" /></td>
    <td align="center"><img src="../assets/img/chapter4/sprint1/app-patient-pending-sync.png" alt="Sincronización pendiente" width="190" /></td>
  </tr>
  <tr>
    <td valign="top"><strong>Ajustes.</strong> Cuenta, recordatorios, idioma, funciones de IA, sincronización pendiente, retiro del consentimiento, cambio de nutricionista y acceso a la descarga de datos, que se completa en el Sprint 2 (US03, US07, US31, US41, US43).</td>
    <td valign="top"><strong>Funciones de IA.</strong> El paciente activa o desactiva cada función, y la app deja de usar su diario para ella al apagarla (US41).</td>
    <td valign="top"><strong>Recordatorios.</strong> Recordatorios de pesaje y de registro de comidas, apagados por defecto (US43).</td>
    <td valign="top"><strong>Sincronización pendiente.</strong> Registros hechos sin conexión que aún no se enviaron (US31).</td>
  </tr>
</table>

**Web Services**

La documentación de Swagger del backend publicado agrupa las operaciones por recurso. La primera captura muestra la cabecera del documento, el botón **Authorize** para el esquema Bearer y los primeros recursos.

<p class="caption"><strong>Figura 165</strong><br><em>Captura de Swagger: vista general de los servicios</em></p>

![Swagger: vista general](../assets/img/chapter4/sprint1/swagger-overview.png)

Consulta guiada del nutricionista, de la medición a la publicación del plan en cuatro pasos (TS03, TS04).

<p class="caption"><strong>Figura 166</strong><br><em>Captura de Swagger: servicios de consultas</em></p>

![Swagger: consultas](../assets/img/chapter4/sprint1/swagger-consultations.png)

Ingesta y respuesta corporal del paciente: diario, estimaciones, sincronización, autopesaje, tendencia, ideas de comida y análisis de foto (TS05, TS06, TS08).

<p class="caption"><strong>Figura 167</strong><br><em>Captura de Swagger: servicios de ingesta</em></p>

![Swagger: ingesta](../assets/img/chapter4/sprint1/swagger-intake.png)

Monitoreo y adherencia: seguimientos, resumen, índice de consistencia, derivaciones y agenda (TS07, TS10).

<p class="caption"><strong>Figura 168</strong><br><em>Captura de Swagger: servicios de monitoreo</em></p>

![Swagger: monitoreo](../assets/img/chapter4/sprint1/swagger-monitoring.png)

Las capturas de la sección 4.2.1.7 muestran además dos solicitudes ejecutadas contra el servicio publicado: la búsqueda anónima en el catálogo de alimentos, que responde `200`, y la lectura de una cuenta sin token, que responde `401`.

El video de demostración del Sprint 1 recorre el landing page en ambos idiomas, el formulario de contacto, la documentación del backend y la aplicación móvil.

**URL del video de demostración del Sprint 1:** [Video del Sprint 1](https://upcedupe-my.sharepoint.com/:v:/g/personal/u202417857_upc_edu_pe/IQDkwu1yzZXNQrSVWng49FMJAWd8AljnrQbej0wJ4HD9wOg?nav=eyJyZWZlcnJhbEluZm8iOnsicmVmZXJyYWxBcHAiOiJPbmVEcml2ZUZvckJ1c2luZXNzIiwicmVmZXJyYWxBcHBQbGF0Zm9ybSI6IldlYiIsInJlZmVycmFsTW9kZSI6InZpZXciLCJyZWZlcnJhbFZpZXciOiJNeUZpbGVzTGlua0NvcHkifX0&e=7Rp3ni)

#### 4.2.1.7. Services Documentation Evidence for Sprint Review

Los servicios del backend se documentan con OpenAPI mediante Swashbuckle. El documento generado describe **100 operaciones en 94 rutas** (45 `GET`, 44 `POST`, 9 `PUT` y 2 `DELETE`), con 160 esquemas, y cada operación declara un resumen, una descripción de su comportamiento y un `SwaggerResponse` por cada código de estado posible. Ocho operaciones están marcadas como obsoletas (`deprecated`); se conservan para clientes anteriores a la consulta guiada y al registro con confirmación de estimación.

<p class="caption"><strong>Tabla 247</strong><br><em>Recursos de documentación de los servicios</em></p>

| Recurso | Enlace |
|---|---|
| Swagger UI | https://platform.healthify.lat/swagger |
| Documento OpenAPI | https://platform.healthify.lat/swagger/v1/swagger.json |
| Repositorio de Web Services | https://github.com/upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform |

La aplicación móvil consume estos servicios a través de `BASE_URL = https://platform.healthify.lat/api/v1/`, definida en cada tipo de compilación.

Convenciones comunes a todos los endpoints:

- La ruta base es `/api/v1`. Las rutas usan sustantivos y las acciones que no son un CRUD se expresan como sub-recurso (`/invitations/redemption`, `/consultations/{id}/publication`).
- Todas las operaciones piden `Authorization: Bearer <token>` salvo las marcadas como **Anónimo**. El token se obtiene en `POST /authentication/sign-in` y lleva el rol (`Patient` o `Practitioner`), que fija el acceso a cada operación. En la columna **Acceso**, «Patient o Practitioner vinculado» significa que el acceso exige además un vínculo de cuidado activo entre ambos.
- Los errores se devuelven como `application/problem+json` (RFC 7807), con título y detalle en el idioma de `Accept-Language` (español o inglés) y un código estable en `extensions.code`, por ejemplo `AuthenticationRequired` o `AccountLocked`.
- Las solicitudes se limitan por usuario o por IP. Al excederse el límite, el servicio responde `429` con la cabecera `Retry-After`.
- Las operaciones de IA responden `403` cuando el paciente no dio su consentimiento, `429` al superar la cuota y `503` si el modelo no está disponible.
- La columna **Descripción en Swagger** reproduce el resumen de cada operación tal como figura en la documentación publicada, en inglés.

**IAM: autenticación, cuentas y sesiones (8 operaciones)**

<p class="caption"><strong>Tabla 248</strong><br><em>Operaciones documentadas en Swagger: IAM: autenticación, cuentas y sesiones</em></p>

| Método | Ruta | Descripción en Swagger | Acceso | Respuestas |
|---|---|---|---|---|
| `POST` | `/api/v1/authentication/sign-up` | Register an account | Anónimo | 201 · 400 · 409 · 429 · 500 |
| `POST` | `/api/v1/authentication/sign-in` | Sign in and receive the role claim | Anónimo | 200 · 401 · 429 · 500 |
| `POST` | `/api/v1/authentication/token-refreshes` | Refresh the session token | Anónimo | 200 · 401 · 429 · 500 |
| `POST` | `/api/v1/authentication/sign-out` | Sign out | Autenticado | 204 · 401 · 404 · 409 |
| `GET` | `/api/v1/users/{userId}` | Get an account | Dueño de la cuenta | 200 · 401 · 403 · 404 |
| `PUT` | `/api/v1/users/{userId}/preferred-language` | Change the preferred language of an account | Dueño de la cuenta | 204 · 400 · 401 · 403 · 404 |
| `GET` | `/api/v1/users/{userId}/sessions` | List the sessions of an account | Dueño de la cuenta | 200 · 401 · 403 |
| `GET` | `/api/v1/sessions/{sessionId}/navigation-shell` | Get the navigation shell of a session | Dueño de la cuenta | 200 · 401 · 403 · 404 |

**Care Relationship: invitaciones, vínculos, consentimiento e IA (14 operaciones)**

<p class="caption"><strong>Tabla 249</strong><br><em>Operaciones documentadas en Swagger: Care Relationship: invitaciones, vínculos, consentimiento e IA</em></p>

| Método | Ruta | Descripción en Swagger | Acceso | Respuestas |
|---|---|---|---|---|
| `POST` | `/api/v1/invitations` | Issue an invitation | Practitioner | 201 · 400 · 401 · 403 · 500 |
| `GET` | `/api/v1/invitations/{invitationId}` | Get the status of an invitation | Practitioner | 200 · 401 · 403 · 404 |
| `POST` | `/api/v1/invitations/redemption` | Redeem an invitation | Patient | 201 · 400 · 401 · 403 · 404 · 409 · 422 |
| `GET` | `/api/v1/care-links/{careLinkId}` | Get a care link | Patient o Practitioner vinculado | 200 · 401 · 403 · 404 |
| `GET` | `/api/v1/care-links/{careLinkId}/targets-read-status` | Get the targets read status of a care link | Patient o Practitioner vinculado | 200 · 401 · 403 · 404 |
| `POST` | `/api/v1/care-links/{careLinkId}/consent` | Grant consent | Patient | 200 · 400 · 401 · 403 · 404 · 409 |
| `DELETE` | `/api/v1/care-links/{careLinkId}/consent` | Withdraw consent | Patient | 204 · 401 · 403 · 404 |
| `PUT` | `/api/v1/care-links/{careLinkId}/ai-processing-consent` | Turn AI processing on or off | Patient | 204 · 401 · 403 · 404 · 409 |
| `POST` | `/api/v1/care-links/{careLinkId}/targets-acknowledgement` | Acknowledge the active targets | Patient | 200 · 401 · 403 · 404 · 422 |
| `POST` | `/api/v1/care-links/{careLinkId}/discharge` | Discharge the patient | Practitioner | 200 · 400 · 401 · 403 · 404 · 409 |
| `GET` | `/api/v1/patients/{patientId}/care-links/active` | Get the active care link of a patient | Patient o Practitioner vinculado | 200 · 401 · 403 · 404 |
| `GET` | `/api/v1/practitioners/{practitionerId}/patients` | List the patients of a practitioner | Practitioner | 200 · 401 · 403 |
| `GET` | `/api/v1/patients/{patientId}/ai-preferences` | Get the AI preferences of a patient | Patient | 200 · 401 · 403 |
| `PUT` | `/api/v1/patients/{patientId}/ai-preferences` | Choose the AI functions | Patient | 200 · 401 · 403 · 409 |

**Nutritional Care: datos base, consulta guiada, plan y bandeja de revisión (33 operaciones)**

<p class="caption"><strong>Tabla 250</strong><br><em>Operaciones documentadas en Swagger: Nutritional Care: datos base, consulta guiada, plan y bandeja de revisión</em></p>

| Método | Ruta | Descripción en Swagger | Acceso | Respuestas |
|---|---|---|---|---|
| `POST` | `/api/v1/patients/{patientId}/baseline` | Record the patient baseline | Practitioner | 201 · 400 · 401 · 403 · 409 · 500 |
| `PUT` | `/api/v1/patients/{patientId}/baseline` | Edit the patient baseline | Practitioner | 200 · 400 · 401 · 403 · 404 · 500 |
| `GET` | `/api/v1/patients/{patientId}/baseline` | Get the patient baseline | Practitioner | 200 · 401 · 403 · 404 |
| `PUT` | `/api/v1/consultations/{consultationId}/measurement` | Step 1: record the measurement | Practitioner | 200 · 400 · 401 · 403 · 404 · 409 · 422 · 500 |
| `POST` | `/api/v1/consultations/{consultationId}/diagnosis-suggestion` | Step 2: suggest a diagnosis | Practitioner | 200 · 401 · 403 · 404 · 422 · 429 · 500 |
| `POST` | `/api/v1/consultations/{consultationId}/guideline-suggestions` | Step 4: suggest guidelines for the diagnosis | Practitioner | 200 · 401 · 403 · 404 · 422 · 429 · 500 |
| `PUT` | `/api/v1/consultations/{consultationId}/diagnosis` | Step 2: issue the diagnosis | Practitioner | 200 · 400 · 401 · 403 · 404 · 409 · 422 · 500 |
| `POST` | `/api/v1/consultations/{consultationId}/target-proposal` | Step 3: propose the targets | Practitioner | 200 · 400 · 401 · 403 · 404 · 409 · 422 · 500 |
| `PUT` | `/api/v1/consultations/{consultationId}/targets` | Step 3: prescribe the targets | Practitioner | 200 · 400 · 401 · 403 · 404 · 409 · 422 · 500 |
| `PUT` | `/api/v1/consultations/{consultationId}/publication-draft` | Step 4: save the publication draft | Practitioner | 200 · 400 · 401 · 403 · 404 · 409 · 422 · 500 |
| `POST` | `/api/v1/consultations/{consultationId}/publication` | Step 4: publish and close the consultation | Practitioner | 200 · 400 · 401 · 403 · 404 · 409 · 422 · 500 |
| `DELETE` | `/api/v1/consultations/{consultationId}` | Discard a consultation | Practitioner | 204 · 401 · 403 · 404 · 409 · 500 |
| `POST` | `/api/v1/patients/{patientId}/consultations` | Start a consultation | Practitioner | 201 · 401 · 403 · 409 · 422 · 500 |
| `GET` | `/api/v1/patients/{patientId}/consultations` | List the consultations of a patient | Practitioner | 200 · 400 · 401 · 403 |
| `GET` | `/api/v1/patients/{patientId}/consultations/in-progress` | Get the consultation in progress | Practitioner | 200 · 401 · 403 · 404 |
| `GET` | `/api/v1/patients/{patientId}/nutritional-assessments` | List the assessments of a patient | Practitioner | 200 · 401 · 403 |
| `GET` | `/api/v1/patients/{patientId}/nutritional-diagnoses/active` | Get the active diagnosis of a patient | Practitioner | 200 · 401 · 403 · 404 |
| `GET` | `/api/v1/patients/{patientId}/nutrition-plans` | List the plan versions of a patient | Practitioner | 200 · 401 · 403 |
| `GET` | `/api/v1/patients/{patientId}/nutrition-plans/active` | Get the active plan of a patient | Practitioner | 200 · 401 · 403 · 404 |
| `GET` | `/api/v1/patients/{patientId}/plan-versions` | List my plan versions | Patient | 200 · 401 · 403 |
| `GET` | `/api/v1/review-items` | List the review items | Practitioner | 200 · 400 · 401 |
| `GET` | `/api/v1/review-items/{reviewItemId}/plan-proposal` | Read the AI plan proposal of a review item | Practitioner | 200 · 202 · 401 · 403 · 404 |
| `POST` | `/api/v1/review-items/{reviewItemId}/plan-proposal/acceptance` | Assign the proposed plan | Practitioner | 200 · 400 · 401 · 403 · 404 · 409 · 422 |
| `POST` | `/api/v1/review-items/{reviewItemId}/resolution` | Resolve a review item | Practitioner | 200 · 400 · 401 · 403 · 404 |
| `POST` | `/api/v1/nutrition-plans/target-proposals` | Propose targets (deprecated) | Practitioner | 201 · 400 · 401 · 403 · 422 |
| `POST` | `/api/v1/nutrition-plans/{planId}/prescribed-targets` | Prescribe the targets (deprecated) | Practitioner | 200 · 400 · 401 · 403 · 404 · 409 |
| `POST` | `/api/v1/nutrition-plans/{planId}/publication` | Publish the nutrition plan (deprecated) | Practitioner | 200 · 400 · 401 · 403 · 404 · 409 · 422 |
| `POST` | `/api/v1/nutrition-plans/{planId}/adjustments` | Adjust the plan between visits | Practitioner | 201 · 400 · 401 · 403 · 404 · 409 |
| `POST` | `/api/v1/nutritional-assessments` | Record a nutritional assessment (deprecated) | Practitioner | 201 · 400 · 401 · 403 · 500 |
| `POST` | `/api/v1/nutritional-assessments/{assessmentId}/clinical-measurements` | Take a clinical measurement (deprecated) | Practitioner | 201 · 400 · 401 · 403 · 404 · 409 |
| `POST` | `/api/v1/nutritional-assessments/{assessmentId}/closure` | Close the assessment (deprecated) | Practitioner | 200 · 401 · 403 · 404 · 409 |
| `GET` | `/api/v1/nutritional-assessments/{assessmentId}` | Get an assessment | Practitioner | 200 · 401 · 403 · 404 |
| `POST` | `/api/v1/nutritional-diagnoses` | Issue a nutritional diagnosis (deprecated) | Practitioner | 201 · 400 · 401 · 403 · 404 · 409 · 422 |

**Food Catalog: catálogo de alimentos (5 operaciones)**

<p class="caption"><strong>Tabla 251</strong><br><em>Operaciones documentadas en Swagger: Food Catalog: catálogo de alimentos</em></p>

| Método | Ruta | Descripción en Swagger | Acceso | Respuestas |
|---|---|---|---|---|
| `GET` | `/api/v1/patients/{patientId}/local-food-catalog` | Get the local food catalog of a patient | Patient | 200 · 401 · 403 |
| `GET` | `/api/v1/reference-foods` | Search the food catalog | Anónimo | 200 · 500 |
| `GET` | `/api/v1/reference-foods/{referenceFoodId}` | Get one catalog entry | Anónimo | 200 · 404 |
| `POST` | `/api/v1/reference-foods/local-overrides` | Create a local override | Practitioner | 201 · 400 · 401 · 403 · 409 |
| `POST` | `/api/v1/reference-foods/catalog-imports` | Request a catalog import | Practitioner | 202 · 401 · 403 · 422 · 503 |

**Intake & Body Response: diario y respuesta corporal (15 operaciones)**

<p class="caption"><strong>Tabla 252</strong><br><em>Operaciones documentadas en Swagger: Intake &amp; Body Response: diario y respuesta corporal</em></p>

| Método | Ruta | Descripción en Swagger | Acceso | Respuestas |
|---|---|---|---|---|
| `POST` | `/api/v1/diary-entries/photo-logs` | Log a meal from a photo | Patient | 201 · 400 · 401 · 403 · 404 · 409 · 422 |
| `POST` | `/api/v1/diary-entries/manual-logs` | Log a meal by hand | Patient | 201 · 400 · 401 · 403 · 409 · 422 |
| `POST` | `/api/v1/diary-entries/manual-logs/batch` | Log a meal of several foods | Patient | 201 · 400 · 401 · 403 · 409 · 422 · 500 |
| `POST` | `/api/v1/diary-entries/off-plan-logs` | Log an off-plan meal (deprecated) | Patient | 201 · 400 · 401 · 403 · 422 |
| `POST` | `/api/v1/diary-entries/{diaryEntryId}/estimate-confirmation` | Confirm the proposed estimate | Patient | 200 · 400 · 401 · 403 · 404 · 409 · 422 |
| `POST` | `/api/v1/diary-entries/{diaryEntryId}/estimate-adjustment` | Adjust the proposed estimate | Patient | 200 · 400 · 401 · 403 · 404 · 409 · 422 |
| `POST` | `/api/v1/diary-entries/synchronization` | Synchronise the entries queued offline | Patient | 200 · 401 · 403 |
| `GET` | `/api/v1/patients/{patientId}/active-targets` | Get the active targets of a patient | Patient | 200 · 401 · 403 · 404 |
| `GET` | `/api/v1/patients/{patientId}/diary-entries` | Get the diary of a patient | Patient | 200 · 401 · 403 |
| `GET` | `/api/v1/patients/{patientId}/weight-trend` | Get the weight trend of a patient | Patient | 200 · 401 · 403 · 404 |
| `GET` | `/api/v1/patients/{patientId}/pending-sync-queue` | Get the entries still waiting to be reconciled | Patient | 200 · 401 · 403 |
| `POST` | `/api/v1/patients/{patientId}/meal-ideas` | Generate meal ideas for what is left today | Patient | 200 · 400 · 401 · 403 · 404 · 422 · 429 · 500 · 502 · 503 |
| `POST` | `/api/v1/patients/{patientId}/meal-photo-analyses` | Recognize the dish of a meal photo | Patient | 201 · 400 · 401 · 403 · 413 · 422 · 429 · 500 · 503 |
| `POST` | `/api/v1/self-weigh-ins` | Record a self weigh-in | Patient | 201 · 400 · 401 · 403 |
| `POST` | `/api/v1/self-weigh-ins/synchronization` | Synchronise the self weigh-ins queued offline | Patient | 200 · 401 · 403 |

**Monitoring & Adherence: interpretación y seguimiento (20 operaciones)**

<p class="caption"><strong>Tabla 253</strong><br><em>Operaciones documentadas en Swagger: Monitoring &amp; Adherence: interpretación y seguimiento</em></p>

| Método | Ruta | Descripción en Swagger | Acceso | Respuestas |
|---|---|---|---|---|
| `POST` | `/api/v1/patients/{patientId}/consistency-index/prompt-acknowledgement` | Acknowledge the consistency prompt | Patient | 204 · 401 · 403 · 409 · 500 |
| `PUT` | `/api/v1/scheduled-follow-ups/{followUpId}/check-in` | Send or edit the check in of a visit | Patient | 200 · 400 · 401 · 403 · 404 · 409 |
| `GET` | `/api/v1/scheduled-follow-ups/{followUpId}/check-in` | Get the check in of a visit | Patient o Practitioner vinculado | 200 · 401 · 403 · 404 |
| `GET` | `/api/v1/patients/{patientId}/weekly-summaries/latest` | Get the latest weekly summary | Patient | 200 · 401 · 403 · 404 · 503 |
| `GET` | `/api/v1/patients/{patientId}/suggested-questions` | Get questions to bring to the visit | Patient | 200 · 401 · 403 · 404 · 429 · 502 · 503 |
| `GET` | `/api/v1/patients/{patientId}/monitoring-summary` | Get the monitoring summary of a patient | Practitioner | 200 · 400 · 401 · 403 · 429 · 502 · 503 |
| `GET` | `/api/v1/patients/{patientId}/evaluation-windows` | Get the evaluation windows of a patient | Patient o Practitioner vinculado | 200 · 401 · 403 |
| `GET` | `/api/v1/patients/{patientId}/evaluation-windows/current` | Get the evaluation window that is still counting | Patient o Practitioner vinculado | 200 · 401 · 403 · 404 |
| `GET` | `/api/v1/patients/{patientId}/daily-compliance` | Get the day-by-day outcome of a patient | Patient | 200 · 400 · 401 · 403 |
| `GET` | `/api/v1/patients/{patientId}/deviations` | Get the deviations read from a patient window | Practitioner | 200 · 401 · 403 |
| `GET` | `/api/v1/patients/{patientId}/consistency-index` | Get the consistency index of a patient | Patient | 200 · 401 · 403 · 422 |
| `GET` | `/api/v1/patients/{patientId}/referrals` | Get the referrals of a patient | Patient o Practitioner vinculado | 200 · 401 · 403 |
| `GET` | `/api/v1/patients/{patientId}/scheduled-follow-ups/next` | Get the next visit of a patient | Patient o Practitioner vinculado | 200 · 401 · 403 · 404 |
| `GET` | `/api/v1/patients/{patientId}/scheduled-follow-ups` | Get the visits of a patient | Patient o Practitioner vinculado | 200 · 400 · 401 · 403 |
| `POST` | `/api/v1/referrals` | Record a referral | Practitioner | 201 · 400 · 401 · 403 |
| `POST` | `/api/v1/referrals/{referralId}/closure` | Close a referral | Practitioner | 200 · 401 · 404 · 409 · 500 |
| `POST` | `/api/v1/scheduled-follow-ups` | Schedule a follow up | Practitioner | 201 · 400 · 401 · 403 · 409 |
| `POST` | `/api/v1/scheduled-follow-ups/{followUpId}/cancellation` | Cancel a visit | Practitioner | 204 · 400 · 401 · 403 · 404 · 409 |
| `POST` | `/api/v1/scheduled-follow-ups/{followUpId}/rescheduling` | Reschedule a visit | Practitioner | 200 · 400 · 401 · 403 · 404 · 409 |
| `GET` | `/api/v1/practitioners/{practitionerId}/scheduled-follow-ups` | Get the agenda of a practitioner | Practitioner | 200 · 400 · 401 · 403 |

**Read Models: vistas compuestas (5 operaciones)**

<p class="caption"><strong>Tabla 254</strong><br><em>Operaciones documentadas en Swagger: Read Models: vistas compuestas</em></p>

| Método | Ruta | Descripción en Swagger | Acceso | Respuestas |
|---|---|---|---|---|
| `GET` | `/api/v1/patients/{patientId}/consultations-overview` | Get the consultations of a patient | Patient o Practitioner vinculado | 200 · 401 · 403 |
| `GET` | `/api/v1/patients/{patientId}/monitoring-panel` | Get the monitoring panel of a patient | Practitioner | 200 · 401 · 403 |
| `GET` | `/api/v1/patients/{patientId}/record` | Get the unified record of a patient | Patient o Practitioner vinculado | 200 · 401 · 403 |
| `GET` | `/api/v1/practitioners/{practitionerId}/patient-roster` | Get the patient roster of a practitioner | Practitioner | 200 · 401 · 403 |
| `GET` | `/api/v1/patients/{patientId}/summary` | Get the summary of a patient | Practitioner | 200 · 401 · 403 |

**Ejemplos de uso**

Los valores de los ejemplos son datos de muestra. Los campos y tipos provienen del documento OpenAPI publicado.

*1. Registrar una cuenta: `POST /api/v1/authentication/sign-up` (anónimo)*

El cuerpo lleva el correo, la contraseña, el rol y los nombres. Si el correo ya existe, responde `409`; si algún dato no es válido, `400`.

```json
{
  "email": "camila.rojas@ejemplo.com",
  "password": "Str0ngPass!2026",
  "role": "Patient",
  "givenNames": "Camila",
  "familyNames": "Rojas"
}
```

Respuesta `201 Created`. La cuenta nueva queda en español y el registro no da acceso a datos clínicos hasta que exista un vínculo de cuidado.

```json
{
  "userId": 12,
  "email": "camila.rojas@ejemplo.com",
  "role": "Patient",
  "createdAt": "2026-10-09T15:02:11Z",
  "givenNames": "Camila",
  "familyNames": "Rojas",
  "fullName": "Camila Rojas",
  "preferredLanguage": "es"
}
```

*2. Iniciar sesión: `POST /api/v1/authentication/sign-in` (anónimo)*

El cuerpo lleva `email` y `password`. No pide el rol: el token lo trae de la cuenta. Tras cinco intentos fallidos la cuenta se bloquea y el servicio responde `401` con el código `AccountLocked`.

```json
{ "email": "camila.rojas@ejemplo.com", "password": "Str0ngPass!2026" }
```

Respuesta `200 OK`. `token` es el token de acceso; `refreshToken` se usa en `POST /authentication/token-refreshes` y rota en cada uso.

```json
{
  "userId": 12,
  "email": "camila.rojas@ejemplo.com",
  "role": "Patient",
  "sessionId": 40,
  "token": "eyJhbGciOiJIUzI1NiIs...",
  "startedAt": "2026-10-09T15:03:40Z",
  "givenNames": "Camila",
  "familyNames": "Rojas",
  "preferredLanguage": "es",
  "refreshToken": "q7Zk...",
  "expiresAt": "2026-10-09T15:33:40Z"
}
```

<p class="caption"><strong>Figura 169</strong><br><em>Captura de Swagger: operación de inicio de sesión</em></p>

![Swagger: iniciar sesión](../assets/img/chapter4/sprint1/swagger-sign-in.png)

*3. Canjear una invitación: `POST /api/v1/invitations/redemption` (Patient)*

El paciente escanea el QR que el nutricionista generó con `POST /api/v1/invitations`. El cuerpo lleva el `token` de la invitación y `replaceActiveLink`. Si el paciente ya tiene un nutricionista, responde `409` salvo que `replaceActiveLink` sea `true`; en ese caso el vínculo anterior termina en el mismo momento. Un emisor no puede canjear su propia invitación.

```json
{ "token": "INV-4F7K2", "replaceActiveLink": false }
```

Respuesta `201 Created`. El vínculo nace inactivo (`isActive: false`) hasta que el paciente dé su consentimiento con `POST /api/v1/care-links/{careLinkId}/consent`.

```json
{
  "careLinkId": 7,
  "patientId": 12,
  "practitionerId": 3,
  "isActive": false,
  "hasConsent": false,
  "establishedAt": "2026-10-09T15:10:02Z",
  "aiProcessingGranted": false
}
```

*4. Registrar una comida a mano: `POST /api/v1/diary-entries/manual-logs` (Patient)*

El paciente debe indicar si la comida estaba en su plan (`InPlan`, `OffPlan` o `NotAnswered`). Si la aplicación envía su propio `clientEntryId`, reenviar la misma comida devuelve la entrada ya guardada y no crea otra.

```json
{
  "patientId": 12,
  "localTimestamp": "2026-10-09T13:05:00",
  "referenceFoodId": 1,
  "portionGrams": 180,
  "planAdherence": "InPlan",
  "clientEntryId": "0b1d2c4e-5f6a-4c8b-9d0e-1a2b3c4d5e6f"
}
```

Respuesta `201 Created`. Lo escrito a mano cuenta como confirmado desde el inicio.

```json
{
  "diaryEntryId": 85,
  "patientId": 12,
  "localTimestamp": "2026-10-09T13:05:00",
  "localDate": "2026-10-09",
  "provenance": "Manual",
  "confirmedReferenceFoodId": 1,
  "confirmedPortionGrams": 180,
  "syncState": "Synced",
  "planAdherence": "InPlan",
  "isCountedTowardsTargets": true,
  "foodName": "Arroz blanco cocido"
}
```

*5. Consultar la tendencia de peso: `GET /api/v1/patients/{patientId}/weight-trend?weeks=4` (Patient)*

El parámetro `weeks` va de 1 a 52 y vale 4 por defecto. El servicio no devuelve un «peso de hoy»: devuelve la serie, el cambio en el rango, la pendiente semanal y cuántas lecturas se dejaron fuera por no haberse tomado en ayunas. Responde `200`; `404` si el paciente no tiene lecturas.

*6. Programar un seguimiento: `POST /api/v1/scheduled-follow-ups` (Practitioner)*

El nutricionista se toma de la sesión y se exige un vínculo de cuidado activo. `scheduledFor` debe ser una fecha futura y `preparation` es opcional. Responde `201`, `400` si la fecha ya pasó y `409` si el paciente ya tiene una cita programada.

```json
{
  "patientId": 12,
  "scheduledFor": "2026-10-16T10:00:00",
  "preparation": ["Fasting", "BringBloodTests"],
  "modality": "InPerson"
}
```

Solicitudes ejecutadas desde Swagger contra el servicio publicado:

La búsqueda de alimentos es anónima y consulta primero el catálogo propio y, si hay pocos resultados, las bases externas. La respuesta `200` devuelve para cada alimento su identificador, nombre, energía y macronutrientes por 100 g. Las cabeceras de la respuesta muestran que el dominio se sirve a través de Cloudflare.

<p class="caption"><strong>Figura 170</strong><br><em>Captura de Swagger: búsqueda en el catálogo de alimentos</em></p>

![Swagger: búsqueda en el catálogo](../assets/img/chapter4/sprint1/swagger-reference-foods.png)

Una operación protegida sin token responde `401` con un Problem Details cuyo código es `AuthenticationRequired`.

<p class="caption"><strong>Figura 171</strong><br><em>Captura de Swagger: solicitud sin autenticación</em></p>

![Swagger: solicitud sin autenticación](../assets/img/chapter4/sprint1/swagger-unauthorized.png)

Commits relacionados con la documentación de servicios. La configuración de Swagger entró con el arranque de la aplicación y las anotaciones de cada operación con los commits de endpoints de cada bounded context:

<p class="caption"><strong>Tabla 255</strong><br><em>Commits relacionados con la documentación de servicios</em></p>

| Repository | Branch | Commit Id | Commit Message | Committed on |
|---|---|---|---|---|
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/platform-foundation` | abdff5a | feat(shared): add problem details, route convention and rate limiting | 29/09/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/platform-foundation` | c5a11b4 | feat(app): add composition root bootstrap | 29/09/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/identity-and-care-links` | 50f9d0e | feat(iam): add authentication, session and user endpoints | 01/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/identity-and-care-links` | 0b8b2e0 | feat(care-relationship): add invitation, care link and AI preference endpoints | 02/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/nutritional-care` | 018541e | feat(nutritional-care): add REST resources, transforms and ACL contract | 03/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/nutritional-care` | 31b6be9 | feat(nutritional-care): add clinical endpoints | 04/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/food-catalog-and-intake` | f8b13fd | feat(food-catalog): add reference food and local catalog endpoints | 05/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/food-catalog-and-intake` | a9e6b76 | feat(intake): add diary, weigh-in, meal idea and photo analysis endpoints | 06/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/monitoring-and-read-models` | 6d5e67f | feat(monitoring): add monitoring, follow-up, referral and AI summary endpoints | 07/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/monitoring-and-read-models` | 6c4d74c | feat(read-models): add composite view endpoints | 08/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/usda-base-url-fix` | 44830dd | docs(readme): add project title and product overview | 08/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/usda-base-url-fix` | f150130 | docs(readme): add architecture section | 08/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/usda-base-url-fix` | ed5b9f3 | docs(readme): add bounded contexts section | 08/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/usda-base-url-fix` | e045ed1 | docs(readme): add running instructions | 09/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/usda-base-url-fix` | 7417da2 | docs(readme): add configuration and tests section | 09/10/2026 |

#### 4.2.1.8. Software Deployment Evidence for Sprint Review

Durante el Sprint 1 se desplegaron el landing page y el backend, y se generó la versión de la aplicación móvil. El landing page se publicó en GitHub Pages con el dominio propio `landing.healthify.lat`. El backend se empaquetó en contenedores de Docker, se publicó en la máquina virtual de Oracle Cloud con el dominio `platform.healthify.lat` y se automatizó la creación de sus versiones con GitHub Actions. La configuración general de cada producto está descrita en la sección 4.1.4; aquí se resumen los pasos realizados durante el sprint.

**Landing Page**

*Repositorio y ramas.* Se creó el repositorio público `healthify-website` en la organización del curso, con las ramas `main` (publicación) y `develop` (integración). Las cinco ramas de funcionalidad se integraron en `develop` mediante los pull requests #1 a #5, y la corrección de fuentes mediante el pull request #7.

<p class="caption"><strong>Figura 172</strong><br><em>Captura de GitHub: repositorio del landing page</em></p>

![Repositorio del landing page](../assets/img/chapter4/sprint1/gh-website-repo.png)

*Releases.* Se integró `develop` en `main` con el pull request #6 (`Release/1.0.0`) y se publicó la versión `v1.0.0`. Antes de la versión siguiente se restauraron, en la rama `fix/restore-sources` (pull request #7), la estructura de `index.html`, el arranque y las funciones de `main.js`, el objeto de traducciones y el orden de las reglas de la hoja de estilos. La versión `v1.0.1` se publicó con el pull request #8.

<p class="caption"><strong>Figura 173</strong><br><em>Captura de GitHub: tags del landing page</em></p>

![Tags del landing page](../assets/img/chapter4/sprint1/gh-website-tags.png)

*GitHub Pages y dominio propio.* GitHub Pages publica el contenido de `main` (carpeta raíz). El dominio `landing.healthify.lat` se definió con el archivo `CNAME` de la raíz, que se creó, se eliminó y se volvió a crear el 06/10/2026 (commits `8098a5b`, `cfa70b0` y `b32908f`) hasta quedar configurado el dominio.

*URL de despliegue:* https://landing.healthify.lat

**Web Services (backend)**

*Repositorio, ramas y versiones.* Se creó el repositorio público `healthify-platform`. Cada bounded context se desarrolló en una rama `feature/*` y se integró en `develop` mediante los pull requests #1, #3, #4, #5, #6 y #8. Los pull requests #2, #7 y #9 integraron `develop` en `main` y corresponden a las versiones `v0.1.0`, `v0.5.0` y `v1.0.0`.

<p class="caption"><strong>Figura 174</strong><br><em>Captura de GitHub: repositorio del backend</em></p>

![Repositorio del backend](../assets/img/chapter4/sprint1/gh-platform-repo.png)

*Release automático.* El flujo `Release` (`.github/workflows/release.yml`) se ejecuta con cada push a `main`: restaura y compila la solución en *Release*, lee `<Version>` de `Healthify.Platform.csproj` y crea el release `v<versión>` con notas generadas a partir de los pull requests. La primera ejecución (versión 0.1.0) falló en la compilación porque `Program.cs` de la base ya registraba el contexto IAM, que se integró en el pull request siguiente; las ejecuciones de las versiones 0.5.0 y 1.0.0 terminaron correctamente.

<p class="caption"><strong>Figura 175</strong><br><em>Captura de GitHub Actions: ejecuciones del flujo Release</em></p>

![Ejecuciones del flujo Release](../assets/img/chapter4/sprint1/gh-platform-actions.png)

<p class="caption"><strong>Figura 176</strong><br><em>Captura de GitHub: releases del backend</em></p>

![Releases del backend](../assets/img/chapter4/sprint1/gh-platform-releases.png)

*Contenedores.* El `Dockerfile` usa dos etapas: `dotnet/sdk:10.0` restaura y publica en *Release*, y `dotnet/aspnet:10.0` ejecuta el resultado en el puerto 8080. El `docker-compose.yml` define `healthify-api` y `healthify-mysql` (MySQL 8.4 con volumen persistente y comprobación de salud); la API espera a que la base de datos esté disponible y aplica las migraciones al iniciar.

*Máquina virtual y dominio.* Se desplegó siguiendo el procedimiento de la sección 4.1.4:

1. Clonar el repositorio en la rama `main` en la máquina virtual de Oracle Cloud.
2. Definir las variables de entorno sin guardarlas en el repositorio: `JWT_SECRET` (obligatoria, de al menos 32 caracteres), las credenciales de MySQL y `USDA_API_KEY`. Las funciones de IA quedan desactivadas por defecto (`Ai__Enabled`).
3. Ejecutar `docker compose up --build -d`.
4. Apuntar el dominio `platform.healthify.lat` a la máquina virtual.
5. Comprobar el servicio en `/swagger` y con la búsqueda anónima de alimentos, como se muestra en la sección 4.2.1.7.

*URLs de despliegue:*

- API: https://platform.healthify.lat
- Documentación: https://platform.healthify.lat/swagger

**Mobile Application (Android)**

*Repositorio, ramas y versión.* Se creó el repositorio público `healthify-android-app`. Cada módulo se desarrolló en una rama `feature/*` y se integró en `develop` con los pull requests #1 a #5. El pull request #6 integró `develop` en `main` y corresponde a la versión `v1.0.0` (`versionName` 1.0, `versionCode` 1).

<p class="caption"><strong>Figura 177</strong><br><em>Captura de GitHub: repositorio de la aplicación móvil</em></p>

![Repositorio de la aplicación móvil](../assets/img/chapter4/sprint1/gh-android-repo.png)

<p class="caption"><strong>Figura 178</strong><br><em>Captura de GitHub: release de la aplicación móvil</em></p>

![Release de la aplicación móvil](../assets/img/chapter4/sprint1/gh-android-releases.png)

*Compilación.* La app se compila con Gradle, con `minSdk` 24 y `targetSdk` 37. La dirección del backend (`BASE_URL`) se fija en `https://platform.healthify.lat/api/v1/` en los tipos de compilación `debug` y `release`. El 09/10/2026 se ejecutó `./gradlew :app:testDebugUnitTest`, con las 567 pruebas superadas, y `./gradlew :app:assembleRelease`, que generó `app-release-unsigned.apk` de 38,8 MiB (`app/build/outputs/apk/release/`).

*Instalación.* En este sprint la app no se publica en una tienda ni tiene un flujo de integración continua. El APK se instala en dispositivos Android 7.0 (API 24) o superior, y para las capturas de la sección 4.2.1.6 se instaló en un emulador desde Android Studio. 

#### 4.2.1.9. Team Collaboration Insights during Sprint

Los cinco integrantes participaron en la implementación de los tres productos del sprint. Cada uno lideró un bounded context del backend, un módulo de la app y una parte del landing page (sección 4.2.1.2) y registró sus commits en esas ramas. La integración a `develop` y `main` la hizo Nevatrix.

Backend (`healthify-platform`):

<p class="caption"><strong>Figura 179</strong><br><em>Captura de GitHub: contribuyentes del backend</em></p>

![Contribuyentes del backend](../assets/img/chapter4/sprint1/gh-platform-contributors.png)

Landing page (`healthify-website`):

<p class="caption"><strong>Figura 180</strong><br><em>Captura de GitHub: contribuyentes del landing page</em></p>

![Contribuyentes del landing page](../assets/img/chapter4/sprint1/gh-website-contributors.png)

Aplicación móvil (`healthify-android-app`):

<p class="caption"><strong>Figura 181</strong><br><em>Captura de GitHub: contribuyentes de la aplicación móvil</em></p>

![Contribuyentes de la aplicación móvil](../assets/img/chapter4/sprint1/gh-android-contributors.png)

<div style="page-break-after: always"></div>

### 4.2.2. Sprint 2

#### 4.2.2.1. Sprint Planning 2

El Sprint 2 se desarrolló entre el 10/10/2026 y el 04/11/2026. Abarca cuatro productos: el **landing page**, los **RESTful Web Services**, la **aplicación móvil Android** del paciente y una aplicación nueva para el nutricionista, construida en **Flutter**. El sprint retoma las diez historias que el Product Owner no aceptó en el Sprint 1 (sección 4.2.1.6), implementa en Flutter las historias del rol nutricionista y aplica los ajustes que salieron de las entrevistas de validación (sección 4.3).

<p class="caption"><strong>Tabla 256</strong><br><em>Datos de la reunión de Sprint Planning 2</em></p>
<table>
  <tr>
    <th colspan="2">Sprint #</th>
    <th colspan="2">Sprint 2</th>
  </tr>
  <tr>
    <th colspan="4">Sprint Planning Background</th>
  </tr>
  <tr>
    <td colspan="2">Date</td>
    <td colspan="2">2026-10-10</td>
  </tr>
  <tr>
    <td colspan="2">Time</td>
    <td colspan="2">10:00 AM (GMT-5)</td>
  </tr>
  <tr>
    <td colspan="2">Location</td>
    <td colspan="2">Reunión virtual</td>
  </tr>
  <tr>
    <td colspan="2">Prepared By</td>
    <td colspan="2">Villarreal Bazan, Angel Martin</td>
  </tr>
  <tr>
    <td colspan="2">Attendees (to planning meeting)</td>
    <td colspan="2">Del Aguila Del Aguila, Olenka Priscilla / Espinoza Cruz, Angela Milagros / Mora Rivera, Joel Fernando / Vergaray Calderon, Rose Almendra / Villarreal Bazan, Angel Martin</td>
  </tr>
  <tr>
    <td colspan="2">Sprint 1 Review Summary</td>
    <td colspan="2">Se publicó el landing page en https://landing.healthify.lat, se desplegó el backend con sus seis bounded contexts en https://platform.healthify.lat y se generó la versión 1.0 de la app Android. El Product Owner aceptó 45 de las 55 historias (197 de 236 Story Points). Las diez restantes quedaron con escenarios pendientes: la sugerencia de respuesta al registrar una comida (US11, TS05), la evaluación del día con el calendario del paciente (US14), la descarga de datos (US18, TS07), el cierre de derivaciones en la app (US19), la recuperación de contraseña (US29, TS01), los testimonios (US32) y el enlace de descarga de la app (US36).</td>
  </tr>
  <tr>
    <td colspan="2">Sprint 1 Retrospective Summary</td>
    <td colspan="2">Funcionó dividir el trabajo por bounded context, con una rama y un pull request por aspecto, y mantener las suites del backend y de la app en verde. Como mejora, el equipo acordó automatizar la compilación y las pruebas de las apps en cada pull request y distribuir los APK firmados, porque en el Sprint 1 la app Android no tenía integración continua y se instalaba desde Android Studio.</td>
  </tr>
  <tr>
    <th colspan="4">Sprint Goal &amp; User Stories</th>
  </tr>
  <tr>
    <td colspan="2">Sprint 2 Goal</td>
    <td colspan="2">Nuestro enfoque está en entregar al nutricionista su propia app en Flutter, completar las historias pendientes del Sprint 1 (recuperación de contraseña, descarga de datos, sugerencia de respuesta al registrar una comida, cierre de derivaciones, testimonios y enlace de descarga) y distribuir las dos apps firmadas por Firebase App Distribution. Creemos que esto da a los nutricionistas una herramienta pensada para la consulta, a los pacientes más control sobre su cuenta y sus datos, y a los visitantes del landing page una forma directa de instalar Healthify. Esto se confirmará cuando un nutricionista instale «Healthify para nutricionistas» desde Firebase, cree su cuenta aceptando los términos, invite a un paciente con QR y complete una consulta guiada; cuando un paciente recupere su contraseña con el código enviado a su correo, descargue el ZIP con sus datos y vea la sugerencia al registrar una comida; y cuando un visitante descargue la app desde el botón del landing page.</td>
  </tr>
  <tr>
    <td colspan="2">Sprint 2 Velocity</td>
    <td colspan="2">106 Story Points</td>
  </tr>
  <tr>
    <td colspan="2">Sum of Story Points</td>
    <td colspan="2">106 Story Points (39 de las historias que vuelven del Sprint 1 y 67 de las historias del nutricionista implementadas en Flutter)</td>
  </tr>
</table>

La velocidad baja de 236 a 106 Story Points porque el Sprint 1 comprometió más de lo que el equipo pudo cerrar (197 puntos aceptados) y porque la app Flutter parte de cero. Historias incluidas en el Sprint 2:

<p class="caption"><strong>Tabla 257</strong><br><em>Historias de usuario incluidas en el Sprint 2</em></p>

| Épico | Story ID | Título | Origen | Story Points |
|---|---|---|---|:---:|
| EP10 | US32 | Visualización de la propuesta de valor de Healthify | Pendiente del Sprint 1 | 2 |
| EP10 | US36 | Acceso al inicio de uso de Healthify desde el Landing Page | Pendiente del Sprint 1 | 2 |
| EP_TS | TS01 | Servicios de registro, autenticación y autorización | Pendiente del Sprint 1 | 5 |
| EP_TS | TS05 | Servicios de registro de ingesta alimentaria | Pendiente del Sprint 1 | 5 |
| EP_TS | TS07 | Servicios de monitoreo y expediente del paciente | Pendiente del Sprint 1 | 8 |
| EP02 | US11 | Indicación de adherencia al plan en un registro | Pendiente del Sprint 1 | 2 |
| EP04 | US14 | Consulta del cumplimiento nutricional diario | Pendiente del Sprint 1 | 5 |
| EP05 | US18 | Acceso al expediente personal unificado | Pendiente del Sprint 1 | 5 |
| EP05 | US19 | Registro de derivación a otro especialista | Pendiente del Sprint 1 y app Flutter | 2 |
| EP08 | US29 | Inicio de sesión | Pendiente del Sprint 1 y app Flutter | 3 |
| EP01 | US04 | Generación de invitación QR para un nuevo paciente | App Flutter | 5 |
| EP01 | US05 | Consulta de pacientes con vínculo activo | App Flutter | 3 |
| EP01 | US06 | Alta del paciente al finalizar el tratamiento | App Flutter | 2 |
| EP02 | US44 | Alimentos locales del catálogo | App Flutter | 2 |
| EP04 | US16 | Consulta del monitoreo del paciente | App Flutter | 5 |
| EP04 | US17 | Revisión y resolución de señales de seguimiento | App Flutter | 5 |
| EP04 | US39 | Agenda de consultas | App Flutter | 5 |
| EP05 | US20 | Acceso al expediente unificado del paciente | App Flutter | 5 |
| EP06 | US21 | Registro y finalización de la evaluación nutricional | App Flutter | 5 |
| EP06 | US22 | Emisión del diagnóstico nutricional | App Flutter | 5 |
| EP07 | US25 | Obtención de propuesta de metas nutricionales calculadas | App Flutter | 5 |
| EP07 | US26 | Prescripción y publicación del plan nutricional | App Flutter | 8 |
| EP07 | US27 | Ajuste del plan nutricional entre consultas | App Flutter | 5 |
| EP08 | US28 | Creación de cuenta | App Flutter | 3 |
| EP08 | US30 | Cierre de sesión | App Flutter | 1 |
| EP08 | US43 | Preferencias de la cuenta: idioma y recordatorios | App Flutter | 3 |
| | | **Total** | | **106** |

Algunas historias de la app Flutter también recibieron cambios en la app Android durante el sprint: la aceptación de los términos al crear la cuenta (US28), el descarte de una consulta en curso (US21), la cartera agrupada por acción pendiente (US05) y los recordatorios de consulta (US43). Esos cambios figuran como tareas de cada historia en la sección 4.2.2.3.

#### 4.2.2.2. Aspect Leaders and Collaborators

Los aspectos del Sprint 2 siguen la división del Sprint 1: en el landing page, cada aspecto es un grupo de páginas; en el backend y en las apps, un bounded context, un módulo o un bloque transversal. La app Flutter se dividió en los mismos módulos que la app Android para que cada integrante trabajara sobre el código que ya conocía. La columna de un aspecto marca con **L** al líder, que responde por su diseño, sus commits y su pull request, y con **C** a quienes colaboran en él.

**Landing Page**

- **Estilos V10 y testimonios:** hoja de estilos sobre los tokens de Figma V10, logo blanco, header y testimonios del inicio.
- **Inicio V10:** nueva estructura del inicio, con la consulta paso a paso, las secciones por rol y los botones de descarga.
- **Nosotros y Contacto:** rediseño de «Nosotros» y de la página de contacto con selector de caso y resumen de errores.
- **Términos y textos:** página de términos con índice fijo y móvil, textos V10 en español e inglés y capturas según el idioma.
- **Interacción, capturas y descarga:** carrusel de pasos, trampa de foco del menú móvil, validación del formulario, exportación de capturas de la app y panel para descargar la app del nutricionista o la del paciente.

<p class="caption"><strong>Tabla 258</strong><br><em>Líderes y colaboradores del landing page en el Sprint 2</em></p>

| Team Member (Last Name, First Name) | GitHub Username | Estilos V10 y testimonios | Inicio V10 | Nosotros y Contacto | Términos y textos | Interacción, capturas y descarga |
|---|---|:---:|:---:|:---:|:---:|:---:|
| Del Aguila Del Aguila, Olenka Priscilla | olenkisha14 | C | C | C | C | L |
| Espinoza Cruz, Angela Milagros | Emy127 | C | C | L | C | C |
| Mora Rivera, Joel Fernando | xJoelFMRx | C | L | C | C | C |
| Vergaray Calderon, Rose Almendra | rosealmendra | C | C | C | L | C |
| Villarreal Bazan, Angel Martin | Nevatrix | L | C | C | C | C |

**Backend (RESTful Web Services)**

- **Exportación de datos:** consultas de cada bounded context, compositor de CSV, escritor ZIP y endpoint de exportación (TS07).
- **Día clínico:** calendarios con la fecha del paciente, reparación de los días evaluados con la fecha UTC y consulta del diario por rango (US14).
- **Recuperación de contraseña:** código por correo, verificación, token de un solo uso y cambio de contraseña (TS01).
- **Sugerencia de plan e ingesta del día:** reglas de la sugerencia, cálculo de la ingesta del día, nombres del catálogo en los prompts y endpoints `plan-fit` y `daily-intake` (TS05).
- **Release, IA y limpieza:** versiones, registro de servicios, migraciones, nivel de razonamiento de Gemini y retiro de los endpoints obsoletos.

<p class="caption"><strong>Tabla 259</strong><br><em>Líderes y colaboradores del backend en el Sprint 2</em></p>

| Team Member (Last Name, First Name) | GitHub Username | Exportación de datos | Día clínico | Recuperación de contraseña | Sugerencia de plan e ingesta del día | Release, IA y limpieza |
|---|---|:---:|:---:|:---:|:---:|:---:|
| Del Aguila Del Aguila, Olenka Priscilla | olenkisha14 | C | | L | C | C |
| Espinoza Cruz, Angela Milagros | Emy127 | C | L | C | C | C |
| Mora Rivera, Joel Fernando | xJoelFMRx | C | C | C | L | C |
| Vergaray Calderon, Rose Almendra | rosealmendra | L | C | C | C | C |
| Villarreal Bazan, Angel Martin | Nevatrix | C | C | C | C | L |

**Mobile Application (Android, paciente)**

- **Inicio y energía del día:** medidor de energía, semana registrada, aviso al superar la meta y avisos que se expanden (US14).
- **Exportación y expediente:** descarga de mis datos y hojas de detalle de versiones del plan, evaluaciones y derivaciones (US18).
- **Cuenta y términos:** recuperación de contraseña, visibilidad de la contraseña y aceptación de los términos al registrarse (US28, US29).
- **Sugerencia de plan:** consumo de `plan-fit` en el registro a mano y por foto, con *debounce* y carga de ideas (US11).
- **Nutricionista, derivaciones y CI/CD:** cierre de derivaciones, descarte de consulta, cartera agrupada, menús laterales, firma, Firebase App Distribution y releases en GitHub (US05, US19, US21).

<p class="caption"><strong>Tabla 260</strong><br><em>Líderes y colaboradores de la aplicación Android en el Sprint 2</em></p>

| Team Member (Last Name, First Name) | GitHub Username | Inicio y energía del día | Exportación y expediente | Cuenta y términos | Sugerencia de plan | Nutricionista, derivaciones y CI/CD |
|---|---|:---:|:---:|:---:|:---:|:---:|
| Del Aguila Del Aguila, Olenka Priscilla | olenkisha14 | C | C | L | C | C |
| Espinoza Cruz, Angela Milagros | Emy127 | C | L | C | C | C |
| Mora Rivera, Joel Fernando | xJoelFMRx | C | C | C | L | C |
| Vergaray Calderon, Rose Almendra | rosealmendra | L | C | C | C | C |
| Villarreal Bazan, Angel Martin | Nevatrix | C | C | C | C | L |

**Mobile Application (Flutter, nutricionista)**

- **Foundation & Design System:** proyecto, dependencias, red con Problem Details y renovación de token, conectividad, localización, tema, componentes y CI.
- **IAM & Onboarding:** splash, bienvenida, registro, inicio de sesión, recuperación de contraseña, sesión local y cambio de idioma (US28, US29, US43).
- **Care Links & Shell:** cartera, invitación con QR, alta, shell con menú, cierre de sesión y ajustes (US04, US05, US06, US30, US43).
- **Expediente y consulta guiada:** pestañas del paciente, seguimiento, datos base y los cuatro pasos de la consulta (US16, US20 a US22, US25, US26).
- **Bandeja, agenda y release:** bandeja de revisión, propuesta de ajuste, agenda, derivaciones, recordatorios, ícono, splash nativo y flujo de distribución (US17, US19, US27, US39, US43).
- **Catálogo, términos y derivaciones:** catálogo de alimentos y alimentos locales, aceptación de términos, ajustes de las entrevistas y cierre de derivaciones (US19, US28, US44).

<p class="caption"><strong>Tabla 261</strong><br><em>Líderes y colaboradores de la aplicación Flutter en el Sprint 2</em></p>

| Team Member (Last Name, First Name) | GitHub Username | Foundation & Design System | IAM & Onboarding | Care Links & Shell | Expediente y consulta guiada | Bandeja, agenda y release | Catálogo, términos y derivaciones |
|---|---|:---:|:---:|:---:|:---:|:---:|:---:|
| Del Aguila Del Aguila, Olenka Priscilla | olenkisha14 | C | L | C | C | C | C |
| Espinoza Cruz, Angela Milagros | Emy127 | C | C | C | C | L | C |
| Mora Rivera, Joel Fernando | xJoelFMRx | C | C | L | C | C | C |
| Vergaray Calderon, Rose Almendra | rosealmendra | C | C | C | L | C | C |
| Villarreal Bazan, Angel Martin | Nevatrix | L | C | C | C | C | L |

En la app Flutter, cada módulo de los cinco primeros aspectos lo escribió su líder en una sola rama, y los demás colaboraron revisando el pull request y usando el núcleo de Foundation. El último aspecto se repartió entre los cinco integrantes. Nevatrix integró todas las ramas a `develop` y `main` en los cuatro repositorios.

#### 4.2.2.3. Sprint Backlog 2

El objetivo del Sprint 2 es entregar la app Flutter del nutricionista, cerrar las historias pendientes del Sprint 1 y distribuir las apps firmadas. Las tareas sin historia asociada sostienen a varias historias: el rediseño V10 del landing page, el núcleo de la app Flutter, los menús laterales, el CI/CD, la traducción de comentarios, el retiro de los endpoints obsoletos y los ajustes que pidieron las entrevistas de validación.

<p class="caption"><strong>Figura 182</strong><br><em>Tablero de Trello del Sprint 2</em></p>

![Board Sprint 2](../assets/img/chapter4/sprint2/trello.png)

URL del Board (Trello): [Enlace del Trello](https://trello.com/b/kg0Z81tZ/sprint-backlog-2-healthify)

<p class="caption"><strong>Tabla 262</strong><br><em>Sprint Backlog 2: tareas por historia de usuario</em></p>

| US ID | US Title | Task ID | Task Title | Description | Est. (h) | Assigned To | Status |
|---|---|---|---|---|:---:|---|---|
| — | — | T01 | Reconstruir los estilos sobre los tokens V10 | Reescribir `styles.css` con los colores, la escala tipográfica y los radios de Figma V10, con diseño *mobile first* y cortes en 1024 px y 1200 px. | 6 | Villarreal Bazan, Angel Martin | Done |
| — | — | T02 | Agregar la variante blanca del logo | Exportar el logo en blanco para el header y el footer sobre fondo oscuro. | 1 | Villarreal Bazan, Angel Martin | Done |
| US36 | Acceso al inicio de uso de Healthify desde el Landing Page | T03 | Rediseñar el inicio según Figma V10 | Rehacer `index.html` con el hero, la consulta paso a paso, entre consultas, las secciones por rol, la prueba social y el cierre, con los botones «Descargar para Android» enlazados a Firebase App Distribution. | 8 | Mora Rivera, Joel Fernando | Done |
| — | — | T04 | Exportar las capturas del nutricionista y de la consulta en español | Exportar de Figma en WebP las pantallas del nutricionista y de la consulta guiada en español. | 2 | Mora Rivera, Joel Fernando | Done |
| — | — | T05 | Implementar el carrusel de pasos, la trampa de foco y la validación | Agregar en `main.js` el carrusel con *scroll-snap* de la consulta paso a paso, la trampa de foco del menú móvil con cierre por `Esc` y la validación del formulario de contacto. | 5 | Del Aguila Del Aguila, Olenka Priscilla | Done |
| — | — | T06 | Exportar las capturas del paciente en español y de la consulta en inglés | Exportar las pantallas del paciente en español y las de la consulta en inglés. | 2 | Del Aguila Del Aguila, Olenka Priscilla | Done |
| — | — | T07 | Agregar los textos V10 y las capturas según el idioma | Agregar las claves V10 a `i18n.js` y cambiar la ruta de cada captura de la app al cambiar de idioma. | 4 | Vergaray Calderon, Rose Almendra | Done |
| — | — | T08 | Exportar las capturas del paciente en inglés | Exportar las pantallas del paciente en inglés con los mismos nombres de archivo que en español. | 1 | Vergaray Calderon, Rose Almendra | Done |
| — | — | T09 | Rediseñar la página de términos | Rehacer `terms.html` con índice fijo en escritorio e índice desplegable (`<details>`) en móvil. | 4 | Vergaray Calderon, Rose Almendra | Done |
| — | — | T10 | Rediseñar la página «Nosotros» | Rehacer `about-us.html` con historia, misión y visión, valores, equipo y preguntas frecuentes con filtros. | 4 | Espinoza Cruz, Angela Milagros | Done |
| — | — | T11 | Rediseñar la página de contacto | Agregar el selector de caso (nutricionista, paciente, alianzas) y un resumen de errores que enlaza a cada campo inválido. | 5 | Espinoza Cruz, Angela Milagros | Done |
| — | — | T12 | Exportar las capturas del nutricionista en inglés | Exportar las pantallas del nutricionista en inglés. | 1 | Espinoza Cruz, Angela Milagros | Done |
| US32 | Visualización de la propuesta de valor de Healthify | T13 | Agregar los testimonios con efecto de mensaje | Mostrar en el inicio un testimonio de nutricionista y uno de paciente como burbujas de chat que aparecen al hacer scroll. | 4 | Villarreal Bazan, Angel Martin | Done |
| — | — | T14 | Ajustar el header y documentar la versión V10 | Cambiar el comportamiento del header al hacer scroll, actualizar las claves de traducción y describir en el README la estructura V10. | 2 | Villarreal Bazan, Angel Martin | Done |
| TS07 | Servicios de monitoreo y expediente del paciente | T15 | Exponer el perfil y el historial de vínculos para la exportación | Agregar en IAM y Care Relationship las consultas que entregan el perfil de la cuenta y el historial de vínculos del paciente. | 3 | Del Aguila Del Aguila, Olenka Priscilla | Done |
| TS07 | Servicios de monitoreo y expediente del paciente | T16 | Exponer las versiones publicadas del plan | Agregar en Nutritional Care la consulta de las versiones publicadas del plan para la exportación. | 2 | Vergaray Calderon, Rose Almendra | Done |
| TS07 | Servicios de monitoreo y expediente del paciente | T17 | Exponer el diario y los autopesajes | Agregar en Intake & Body Response la consulta del diario y de los autopesajes del paciente. | 2 | Mora Rivera, Joel Fernando | Done |
| TS07 | Servicios de monitoreo y expediente del paciente | T18 | Exponer el historial de seguimientos | Agregar en Monitoring & Adherence la consulta de las consultas agendadas del paciente. | 2 | Espinoza Cruz, Angela Milagros | Done |
| TS07 | Servicios de monitoreo y expediente del paciente | T19 | Implementar el compositor, el escritor ZIP y el endpoint de exportación | Armar un CSV por tabla, empaquetarlos en ZIP y exponer `GET /patients/{patientId}/data-export` solo para el propio paciente. | 8 | Vergaray Calderon, Rose Almendra | Done |
| TS07 | Servicios de monitoreo y expediente del paciente | T20 | Agregar los mensajes y las pruebas de la exportación | Localizar los encabezados de los CSV en español e inglés y escribir `PatientDataExportTests`. | 4 | Del Aguila Del Aguila, Olenka Priscilla | Done |
| TS07 | Servicios de monitoreo y expediente del paciente | T21 | Registrar los servicios de exportación | Registrar el compositor, el escritor y las consultas de cada contexto en la composición de la aplicación. | 1 | Villarreal Bazan, Angel Martin | Done |
| US14 | Consulta del cumplimiento nutricional diario | T22 | Agregar los calendarios de fecha clínica | Crear el calendario con el desfase declarado por el paciente y el calendario de fecha clínica para evaluar cada día. | 4 | Espinoza Cruz, Angela Milagros | Done |
| US14 | Consulta del cumplimiento nutricional diario | T23 | Evaluar los días con el calendario del paciente | Evaluar el cumplimiento del día con la fecha del paciente y reparar al arrancar los días evaluados con la fecha UTC. | 4 | Espinoza Cruz, Angela Milagros | Done |
| US14 | Consulta del cumplimiento nutricional diario | T24 | Consultar el diario por rango de días | Consultar en la base de datos el diario de un rango de días y agregar el índice por paciente y fecha. | 3 | Mora Rivera, Joel Fernando | Done |
| US14 | Consulta del cumplimiento nutricional diario | T25 | Escribir las pruebas del día clínico y del rango | Escribir `ClinicalDayEvaluationTests` y `DiaryRangeMySqlTests`. | 4 | Vergaray Calderon, Rose Almendra | Done |
| US14 | Consulta del cumplimiento nutricional diario | T26 | Registrar el trabajo de reparación | Registrar el trabajo que repara los días al iniciar y la migración del índice del diario. | 1 | Villarreal Bazan, Angel Martin | Done |
| TS05 | Servicios de registro de ingesta alimentaria | T27 | Usar los nombres del catálogo en IA y en el reconocimiento de fotos | Pasar los nombres del catálogo al prompt de ideas de comida y al reconocimiento de fotos, y resolver las alternativas que devuelve el modelo. | 6 | Mora Rivera, Joel Fernando | Done |
| TS05 | Servicios de registro de ingesta alimentaria | T28 | Coincidir solo palabras completas en el catálogo | Buscar por palabras completas en el nombre del alimento, sin coincidencias dentro de otras palabras. | 2 | Vergaray Calderon, Rose Almendra | Done |
| — | — | T29 | Acotar el razonamiento de Gemini | Leer `Ai:Gemini:ThinkingLevel`, fijarlo en producción y dar más espacio de respuesta a las ideas de comida, con su prueba. | 4 | Villarreal Bazan, Angel Martin | Done |
| TS05 | Servicios de registro de ingesta alimentaria | T30 | Definir las reglas de la sugerencia de plan | Crear las reglas que revisan las restricciones del plan y comparan la energía del alimento con lo que queda del día. | 3 | Del Aguila Del Aguila, Olenka Priscilla | Done |
| TS05 | Servicios de registro de ingesta alimentaria | T31 | Calcular la sugerencia y adjuntarla al análisis de foto | Calcular la sugerencia a partir del plan y del diario, y devolverla junto con el análisis de una foto. | 4 | Mora Rivera, Joel Fernando | Done |
| TS05 | Servicios de registro de ingesta alimentaria | T32 | Exponer `GET /patients/{patientId}/plan-fit` | Crear el recurso, el ensamblador y el endpoint de la sugerencia, y aceptar la fecha local en el análisis de foto. | 5 | Espinoza Cruz, Angela Milagros | Done |
| TS05 | Servicios de registro de ingesta alimentaria | T33 | Escribir las pruebas de la sugerencia | Escribir `PlanFitTests` con restricciones del plan, energía restante y ausencia de plan. | 3 | Vergaray Calderon, Rose Almendra | Done |
| TS05 | Servicios de registro de ingesta alimentaria | T34 | Calcular la ingesta del día | Crear el modelo y la consulta de la ingesta del día y calcularla con las metas vigentes y las entradas confirmadas. | 4 | Del Aguila Del Aguila, Olenka Priscilla | Done |
| TS05 | Servicios de registro de ingesta alimentaria | T35 | Exponer `GET /patients/{patientId}/daily-intake` | Crear el recurso, el ensamblador y el endpoint de la ingesta del día, con `DailyIntakeTests`. | 4 | Vergaray Calderon, Rose Almendra | Done |
| TS05 | Servicios de registro de ingesta alimentaria | T36 | Registrar las consultas de sugerencia e ingesta | Registrar los servicios de consulta y fijar las versiones 1.4.0 y 1.5.0. | 1 | Villarreal Bazan, Angel Martin | Done |
| TS01 | Servicios de registro, autenticación y autorización | T37 | Modelar el restablecimiento de contraseña | Crear el código de seis dígitos, sus intentos, su vencimiento y los mensajes localizados. | 4 | Del Aguila Del Aguila, Olenka Priscilla | Done |
| TS01 | Servicios de registro, autenticación y autorización | T38 | Configurar el envío de correo | Agregar MailKit y la configuración `Smtp__*` con el tiempo de vida del código. | 2 | Mora Rivera, Joel Fernando | Done |
| TS01 | Servicios de registro, autenticación y autorización | T39 | Implementar el hash del código, el correo y la persistencia | Guardar el código con hash, enviarlo por SMTP en el idioma de la cuenta y persistir las solicitudes. | 5 | Mora Rivera, Joel Fernando | Done |
| TS01 | Servicios de registro, autenticación y autorización | T40 | Implementar el servicio de comandos del restablecimiento | Atender la solicitud del código y el cambio de contraseña, con el cierre de todas las sesiones de la cuenta. | 4 | Vergaray Calderon, Rose Almendra | Done |
| TS01 | Servicios de registro, autenticación y autorización | T41 | Exponer los endpoints del restablecimiento | Crear `password-reset-requests`, `password-reset-verifications` y `password-resets` con su documentación OpenAPI. | 4 | Espinoza Cruz, Angela Milagros | Done |
| TS01 | Servicios de registro, autenticación y autorización | T42 | Verificar el código y emitir el token de restablecimiento | Canjear el código correcto por un token de un solo uso y bloquear el código tras cinco intentos fallidos. | 4 | Vergaray Calderon, Rose Almendra | Done |
| TS01 | Servicios de registro, autenticación y autorización | T43 | Persistir y buscar los tokens de restablecimiento | Guardar el token con hash y su vencimiento. | 2 | Mora Rivera, Joel Fernando | Done |
| TS01 | Servicios de registro, autenticación y autorización | T44 | Escribir las pruebas y la documentación del restablecimiento | Escribir `PasswordResetTests` y documentar las variables SMTP en el README. | 4 | Del Aguila Del Aguila, Olenka Priscilla | Done |
| TS01 | Servicios de registro, autenticación y autorización | T45 | Agregar las migraciones y registrar los servicios | Crear las migraciones de códigos y de verificación y registrar los servicios del restablecimiento. | 2 | Villarreal Bazan, Angel Martin | Done |
| — | — | T46 | Retirar los ocho endpoints obsoletos | Eliminar los comandos, controladores, ensambladores, registros y pruebas de los endpoints marcados como `deprecated` en el Sprint 1. | 8 | Espinoza Cruz, Angela Milagros | Done |
| — | — | T47 | Limpiar los comentarios de documentación del código | Quitar las referencias a requisitos y traducir los comentarios XML de cada contexto al inglés. | 5 | Del Aguila Del Aguila, Olenka Priscilla | Done |
| US18 | Acceso al expediente personal unificado | T48 | Implementar la descarga de mis datos | Agregar el dominio, los casos de uso, el servicio, el escritor de archivos y el repositorio de la exportación, y reemplazar el marcador de los ajustes por la descarga real. | 8 | Espinoza Cruz, Angela Milagros | Done |
| US18 | Acceso al expediente personal unificado | T49 | Agregar los textos y el estado de la exportación | Agregar los mensajes de la exportación en español e inglés y el estado de la descarga en el ViewModel de ajustes. | 3 | Vergaray Calderon, Rose Almendra | Done |
| US18 | Acceso al expediente personal unificado | T50 | Agregar las hojas de detalle del expediente | Mostrar el detalle de cada versión del plan, evaluación y derivación desde el expediente y el plan. | 6 | Villarreal Bazan, Angel Martin | Done |
| US18 | Acceso al expediente personal unificado | T51 | Llevar el detalle al modelo del expediente | Agregar al modelo del expediente los datos de versión del plan, evaluación y derivación, y abrir las hojas desde las pantallas. | 5 | Mora Rivera, Joel Fernando | Done |
| US14 | Consulta del cumplimiento nutricional diario | T52 | Mostrar el medidor de energía y la semana en el inicio | Cargar la ingesta del día desde las metas vigentes y mostrar el medidor de energía y los días con registro de la semana. | 8 | Vergaray Calderon, Rose Almendra | Done |
| US14 | Consulta del cumplimiento nutricional diario | T53 | Armar la semana registrada y leer la ingesta del día | Construir la semana a partir de los días de cumplimiento y leer la ingesta con `daily-intake`. | 5 | Mora Rivera, Joel Fernando | Done |
| US14 | Consulta del cumplimiento nutricional diario | T54 | Mostrar un aviso cuando se supera la meta de energía | Agregar una tarjeta que acompaña sin reprochar cuando el día supera la meta, con sus textos. | 3 | Vergaray Calderon, Rose Almendra | Done |
| US14 | Consulta del cumplimiento nutricional diario | T55 | Leer la meta de energía como en el expediente | Usar la misma banda de tolerancia que la adherencia del expediente y cubrirla con pruebas. | 3 | Del Aguila Del Aguila, Olenka Priscilla | Done |
| US11 | Indicación de adherencia al plan en un registro | T56 | Definir el dominio de la sugerencia de plan | Crear los modelos y el contrato del repositorio, con los textos de la sugerencia y de la carga de ideas. | 3 | Villarreal Bazan, Angel Martin | Done |
| US11 | Indicación de adherencia al plan en un registro | T57 | Implementar los DTOs, el servicio y los mappers de la sugerencia | Consumir `plan-fit` e integrarlo en el dominio y los casos de uso del registro por foto. | 4 | Del Aguila Del Aguila, Olenka Priscilla | Done |
| US11 | Indicación de adherencia al plan en un registro | T58 | Implementar el repositorio y mostrar la sugerencia en el formulario | Registrar el repositorio con inyección de dependencias y mostrar la sugerencia en el formulario de comida. | 5 | Mora Rivera, Joel Fernando | Done |
| US11 | Indicación de adherencia al plan en un registro | T59 | Manejar el *debounce* y la carga de ideas | Esperar a que el paciente deje de escribir antes de pedir la sugerencia y mostrar la carga de las ideas de comida. | 4 | Vergaray Calderon, Rose Almendra | Done |
| US11 | Indicación de adherencia al plan en un registro | T60 | Conectar la sugerencia a los ViewModels y probarla | Conectar la sugerencia a los ViewModels de registro a mano y por foto, con sus fakes y pruebas. | 5 | Espinoza Cruz, Angela Milagros | Done |
| US29 | Inicio de sesión | T61 | Modelar la recuperación de contraseña | Crear los objetos de valor del código y del token, la entidad, el contrato y los casos de uso. | 4 | Del Aguila Del Aguila, Olenka Priscilla | Done |
| US29 | Inicio de sesión | T62 | Implementar los endpoints y el repositorio de la recuperación | Agregar los DTOs y los tres endpoints al servicio y al repositorio de autenticación. | 4 | Mora Rivera, Joel Fernando | Done |
| US29 | Inicio de sesión | T63 | Implementar el estado y el ViewModel de la recuperación | Manejar los pasos de correo, código y nueva contraseña, con los fakes de prueba. | 5 | Espinoza Cruz, Angela Milagros | Done |
| US29 | Inicio de sesión | T64 | Construir la pantalla de recuperación | Crear la pantalla «Olvidé mi contraseña» y navegar a ella desde el inicio de sesión en lugar del aviso. | 5 | Vergaray Calderon, Rose Almendra | Done |
| US29 | Inicio de sesión | T65 | Conectar la ruta y los textos de la recuperación | Agregar la ruta al grafo de navegación y los mensajes en español e inglés. | 2 | Villarreal Bazan, Angel Martin | Done |
| US29 | Inicio de sesión | T66 | Mostrar el ojo tachado con la contraseña visible | Agregar el ícono de visibilidad desactivada y usarlo mientras la contraseña está visible. | 2 | Del Aguila Del Aguila, Olenka Priscilla | Done |
| US28 | Creación de cuenta | T67 | Agregar la casilla y los enlaces legales | Crear el componente de casilla del sistema de diseño y los enlaces a los términos y al aviso de privacidad. | 3 | Villarreal Bazan, Angel Martin | Done |
| US28 | Creación de cuenta | T68 | Exigir la aceptación de los términos al registrarse | Agregar la fila de aceptación y bloquear el registro hasta marcarla. | 4 | Del Aguila Del Aguila, Olenka Priscilla | Done |
| US28 | Creación de cuenta | T69 | Agregar los términos al estado del registro | Llevar la aceptación al estado de la pantalla y mostrar el error en la vista previa. | 3 | Vergaray Calderon, Rose Almendra | Done |
| US28 | Creación de cuenta | T70 | Mostrar los términos en la pantalla de registro | Ubicar la fila de términos en la pantalla de registro, con sus textos. | 3 | Espinoza Cruz, Angela Milagros | Done |
| US28 | Creación de cuenta | T71 | Escribir las pruebas de los términos | Cubrir la aceptación en las pruebas del ViewModel de registro. | 2 | Villarreal Bazan, Angel Martin | Done |
| US19 | Registro de derivación a otro especialista | T72 | Cerrar una derivación desde el expediente | Definir los modelos, casos de uso y textos, consumir `POST /referrals/{referralId}/closure` y pedir confirmación antes de cerrar. | 8 | Villarreal Bazan, Angel Martin | Done |
| US19 | Registro de derivación a otro especialista | T73 | Implementar el repositorio del cierre y sus pruebas | Implementar la llamada al endpoint en el repositorio de monitoreo y escribir `CloseReferralTest`. | 5 | Del Aguila Del Aguila, Olenka Priscilla | Done |
| US21 | Registro y finalización de la evaluación nutricional | T74 | Descartar una consulta en curso | Consumir el descarte de la consulta y manejarlo en el paso de medición con un botón de eliminar. | 8 | Espinoza Cruz, Angela Milagros | Done |
| US21 | Registro y finalización de la evaluación nutricional | T75 | Manejar el descarte en el paso de medición | Confirmar el descarte y volver al expediente sin guardar la medición. | 3 | Vergaray Calderon, Rose Almendra | Done |
| US05 | Consulta de pacientes con vínculo activo | T76 | Agrupar la cartera por acción pendiente | Clasificar a los pacientes según la acción que requieren y agregar la búsqueda por nombre. | 6 | Del Aguila Del Aguila, Olenka Priscilla | Done |
| US43 | Preferencias de la cuenta: idioma y recordatorios | T77 | Programar recordatorios de consulta | Crear el modelo de recordatorio y programarlo con WorkManager, pidiendo el permiso de notificaciones. | 7 | Espinoza Cruz, Angela Milagros | Done |
| — | — | T78 | Agregar el menú principal del paciente | Agregar el cajón lateral con Mi plan, Mis consultas, Pendientes, Ajustes y Cerrar sesión, y el botón de cámara en la barra inferior. | 10 | Vergaray Calderon, Rose Almendra | Done |
| — | — | T79 | Agregar el menú principal del nutricionista | Mover los ajustes del nutricionista al menú lateral y quitar la pestaña de ajustes de la barra inferior. | 8 | Espinoza Cruz, Angela Milagros | Done |
| — | — | T80 | Configurar la firma y la distribución | Firmar el release con un *upload keystore*, leer `versionCode` de Gradle y configurar Firebase App Distribution. | 6 | Villarreal Bazan, Angel Martin | Done |
| — | — | T81 | Agregar los flujos de CI y de distribución | Crear `ci.yml` (lint, pruebas y build de depuración) y `distribute.yml` (build firmado a Firebase y release en GitHub). | 6 | Vergaray Calderon, Rose Almendra | Done |
| — | — | T82 | Documentar el CI/CD y los secretos | Describir los flujos, los secretos del repositorio y la firma local en el README. | 3 | Mora Rivera, Joel Fernando | Done |
| — | — | T83 | Traducir los comentarios del código al inglés | Traducir los comentarios de todos los módulos, las pruebas y la configuración de Gradle. | 10 | Del Aguila Del Aguila, Olenka Priscilla | Done |
| — | — | T84 | Aplicar los ajustes de las entrevistas de validación | Fijar la acción de consulta en el expediente, explicar la confirmación pendiente en el diario, aclarar la pestaña de peso, rotular el botón de registro y quitar la transición al volver. | 8 | Mora Rivera, Joel Fernando | Done |
| — | — | T85 | Pulir la interfaz | Agregar el sufijo de unidad al campo de texto, el texto de apoyo a las filas con interruptor, el nuevo ícono de lanzador y mover «Agregar alimento local» sobre la búsqueda. | 5 | Villarreal Bazan, Angel Martin | Done |
| — | — | T86 | Crear el proyecto Flutter y fijar las dependencias | Crear `healthify-flutter-app`, fijar las dependencias y excluir del repositorio los archivos de firma. | 2 | Villarreal Bazan, Angel Martin | Done |
| — | — | T87 | Construir el núcleo compartido | Agregar los errores de dominio, el tipo `Result`, el cliente HTTP con Problem Details, el cliente autenticado con renovación de token, el observador de conectividad y el *service locator*. | 8 | Villarreal Bazan, Angel Martin | Done |
| — | — | T88 | Construir el sistema de diseño | Agregar los colores, la tipografía, las dimensiones, los íconos, los botones, los campos, los selectores, los diálogos, las hojas y las barras de navegación. | 8 | Villarreal Bazan, Angel Martin | Done |
| — | — | T89 | Configurar la localización y el CI | Configurar `flutter gen-l10n` en español e inglés y el flujo `ci.yml` (análisis, pruebas y APK de depuración). | 3 | Villarreal Bazan, Angel Martin | Done |
| US29 | Inicio de sesión | T90 | Implementar la sesión y el inicio de sesión | Crear las entidades, los objetos de valor, los casos de uso, los DTOs, los repositorios, la sesión local con renovación de token y la pantalla de inicio de sesión. | 8 | Del Aguila Del Aguila, Olenka Priscilla | Done |
| US28 | Creación de cuenta | T91 | Construir la pantalla de registro | Crear la pantalla de creación de cuenta para el rol nutricionista. | 3 | Del Aguila Del Aguila, Olenka Priscilla | Done |
| US29 | Inicio de sesión | T92 | Agregar la recuperación de contraseña | Implementar el flujo de correo, código y nueva contraseña con los endpoints del Sprint 2. | 4 | Del Aguila Del Aguila, Olenka Priscilla | Done |
| — | — | T93 | Agregar el splash, la bienvenida y la puerta de sesión | Crear el splash, la bienvenida, la pantalla de sesión vencida y el enrutador raíz según la sesión. | 4 | Del Aguila Del Aguila, Olenka Priscilla | Done |
| US43 | Preferencias de la cuenta: idioma y recordatorios | T94 | Cambiar el idioma dentro de la app | Cambiar entre español e inglés sin reiniciar la app. | 2 | Del Aguila Del Aguila, Olenka Priscilla | Done |
| US05 | Consulta de pacientes con vínculo activo | T95 | Construir la cartera de pacientes | Crear el dominio, los DTOs, el servicio y el repositorio de vínculos y la pantalla «Mis pacientes». | 6 | Mora Rivera, Joel Fernando | Done |
| US04 | Generación de invitación QR para un nuevo paciente | T96 | Invitar a un paciente con QR | Generar la invitación con vencimiento y mostrar el código QR. | 3 | Mora Rivera, Joel Fernando | Done |
| US06 | Alta del paciente al finalizar el tratamiento | T97 | Dar de alta a un paciente | Agregar el flujo de alta con confirmación. | 2 | Mora Rivera, Joel Fernando | Done |
| US30 | Cierre de sesión | T98 | Construir el shell y cerrar sesión | Crear las rutas, el cubit y el menú del shell, con confirmación antes de cerrar sesión. | 4 | Mora Rivera, Joel Fernando | Done |
| US43 | Preferencias de la cuenta: idioma y recordatorios | T99 | Construir los ajustes y la hoja de idioma | Agregar los ajustes del nutricionista con su cuenta, el idioma y el cierre de sesión. | 3 | Mora Rivera, Joel Fernando | Done |
| US20 | Acceso al expediente unificado del paciente | T100 | Construir el expediente del paciente | Crear el dominio clínico y sus códigos, los casos de uso, los DTOs y las pestañas Resumen, Historia y Plan. | 8 | Vergaray Calderon, Rose Almendra | Done |
| US16 | Consulta del monitoreo del paciente | T101 | Mostrar el seguimiento del paciente | Agregar los datos del panel de monitoreo y la pestaña Seguimiento. | 4 | Vergaray Calderon, Rose Almendra | Done |
| US21 | Registro y finalización de la evaluación nutricional | T102 | Registrar los datos base y la medición | Crear el formulario de datos base, los comandos y validaciones de la consulta y el paso de medición. | 5 | Vergaray Calderon, Rose Almendra | Done |
| US22 | Emisión del diagnóstico nutricional | T103 | Construir el paso de diagnóstico | Mostrar el diagnóstico sugerido con su fundamento y permitir confirmarlo o elegir otro. | 3 | Vergaray Calderon, Rose Almendra | Done |
| US25 | Obtención de propuesta de metas nutricionales calculadas | T104 | Construir el paso de metas | Mostrar las metas calculadas y permitir editar sus parámetros. | 3 | Vergaray Calderon, Rose Almendra | Done |
| US26 | Prescripción y publicación del plan nutricional | T105 | Construir el paso de publicación | Elegir restricciones e indicaciones y publicar el plan, con las rutas de la consulta. | 3 | Vergaray Calderon, Rose Almendra | Done |
| US17 | Revisión y resolución de señales de seguimiento | T106 | Construir la bandeja de revisión | Crear el dominio, el repositorio y las pantallas de la bandeja y de cada elemento. | 5 | Espinoza Cruz, Angela Milagros | Done |
| US27 | Ajuste del plan nutricional entre consultas | T107 | Construir la propuesta de ajuste | Mostrar la propuesta de ajuste del plan y permitir aceptarla o editarla. | 3 | Espinoza Cruz, Angela Milagros | Done |
| US39 | Agenda de consultas | T108 | Construir la agenda | Crear el dominio, el repositorio, la agenda y la pantalla para agendar una consulta. | 5 | Espinoza Cruz, Angela Milagros | Done |
| US19 | Registro de derivación a otro especialista | T109 | Registrar derivaciones desde la agenda | Agregar la pantalla para registrar una derivación. | 2 | Espinoza Cruz, Angela Milagros | Done |
| US43 | Preferencias de la cuenta: idioma y recordatorios | T110 | Programar recordatorios locales de consulta | Programar una notificación local antes de cada consulta. | 3 | Espinoza Cruz, Angela Milagros | Done |
| — | — | T111 | Integrar la bandeja y la agenda y preparar el release | Conectar la bandeja y la agenda al shell, agregar el ícono y el splash nativo, fijar el `applicationId` del nutricionista y crear `distribute.yml`. | 6 | Espinoza Cruz, Angela Milagros | Done |
| US44 | Alimentos locales del catálogo | T112 | Modelar el catálogo de alimentos | Crear los objetos de valor de búsqueda y las entidades de alimento de referencia. | 3 | Vergaray Calderon, Rose Almendra | Done |
| US44 | Alimentos locales del catálogo | T113 | Implementar el repositorio del catálogo | Crear el contrato, los casos de uso, los DTOs, los mappers, el servicio remoto y el repositorio. | 6 | Mora Rivera, Joel Fernando | Done |
| US44 | Alimentos locales del catálogo | T114 | Construir las pantallas del catálogo y del alimento local | Crear los estados y cubits del catálogo y del alimento local y sus pantallas. | 6 | Del Aguila Del Aguila, Olenka Priscilla | Done |
| US44 | Alimentos locales del catálogo | T115 | Abrir el catálogo desde el menú | Registrar el módulo, agregar las rutas y el acceso desde el menú lateral. | 2 | Espinoza Cruz, Angela Milagros | Done |
| US44 | Alimentos locales del catálogo | T116 | Escribir las pruebas del catálogo | Cubrir el dominio, el repositorio, los cubits, las pantallas y la navegación del catálogo. | 5 | Villarreal Bazan, Angel Martin | Done |
| US28 | Creación de cuenta | T117 | Exigir la aceptación de los términos | Agregar `url_launcher`, los enlaces legales, la casilla y la fila de aceptación en el registro, con sus pruebas. | 5 | Del Aguila Del Aguila, Olenka Priscilla | Done |
| — | — | T118 | Aplicar los ajustes de las entrevistas de validación | Explicar la confirmación pendiente en el diario y fijar el botón de consulta en la pestaña Historia. | 4 | Mora Rivera, Joel Fernando | Done |
| US19 | Registro de derivación a otro especialista | T119 | Cerrar una derivación desde la historia | Agregar el caso de uso, el servicio y el repositorio del cierre y el diálogo de confirmación, con sus pruebas. | 6 | Villarreal Bazan, Angel Martin | Done |
| — | — | T120 | Corregir la prueba que fallaba en CI | Actualizar la prueba de la pantalla del paciente y sus fakes (texto de la derivación y hora del último guardado), que fallaba desde el pull request #15, y publicar la versión 1.3.1. | 2 | Villarreal Bazan, Angel Martin | Done |
| US36 | Acceso al inicio de uso de Healthify desde el Landing Page | T121 | Agregar los íconos y estilos de los botones de descarga | Agregar los íconos vectoriales de Flutter y Android y los estilos de los botones y del panel de descarga. | 2 | Del Aguila Del Aguila, Olenka Priscilla | Done |
| US36 | Acceso al inicio de uso de Healthify desde el Landing Page | T122 | Implementar el panel de descarga del header | Convertir el botón «Descargar» del header en un panel desplegable accesible (`aria-expanded`, cierre con Escape y al hacer clic fuera) y agregar sus textos en español e inglés. | 3 | Del Aguila Del Aguila, Olenka Priscilla | Done |
| US36 | Acceso al inicio de uso de Healthify desde el Landing Page | T123 | Ofrecer la descarga de las dos apps en el sitio | Mostrar los botones «Nutricionista» (Flutter) y «Paciente» (Android) en el hero y en el menú móvil, y llevar el panel del header y los enlaces del footer a Nosotros, Contacto y Términos. | 4 | Del Aguila Del Aguila, Olenka Priscilla | Done |
| US32 | Visualización de la propuesta de valor de Healthify | T124 | Agregar los videos del equipo y del producto | Enlazar los videos «El equipo de Healthify» y «Así funciona Healthify» en el carrusel del hero con su miniatura de YouTube, apuntar el cierre y el footer a la app del nutricionista y actualizar el README. | 2 | Villarreal Bazan, Angel Martin | Done |

La estimación total es de 519 horas en 124 tareas. Las 124 tareas quedaron en Done. Las cinco últimas se agregaron al cierre del sprint. La primera corrige la prueba que fallaba en el CI de la app Flutter desde el pull request #15; el pull request #21 la arregló antes de publicar la versión 1.3.1 (sección 4.2.2.5). Las otras cuatro corresponden al landing page `v2.2.0`: la descarga separada de la app del nutricionista y la del paciente, y los videos del hero.

#### 4.2.2.4. Development Evidence for Sprint Review

En el Sprint 2 el equipo trabajó sobre cuatro repositorios. En el landing page se rehízo el sitio sobre el diseño V10 de Figma y se agregaron los testimonios, los videos del hero y la descarga separada de la app del nutricionista y la del paciente. En el backend se agregaron la exportación de datos, la evaluación del día con el calendario del paciente, la recuperación de contraseña, la sugerencia de plan y la ingesta del día, y se retiraron los ocho endpoints obsoletos. En la app Android se completaron las historias pendientes del paciente, se agregaron los menús laterales y se automatizaron la compilación y la distribución. La app Flutter del nutricionista se creó en este sprint y llegó a la versión 1.3.0.

El trabajo siguió GitFlow como en el Sprint 1: cada bloque se hizo en una rama `feature/*` (o `refactor/*`) y se integró en `develop` con un pull request; los pull requests de `develop` a `main` corresponden a los releases. La columna **Branch** indica la rama en la que se hizo el commit, y las ramas `develop` y `main` solo muestran los merges de pull requests. Cada commit aparece una sola vez.

<p class="caption"><strong>Tabla 263</strong><br><em>Pull requests y releases por producto en el Sprint 2</em></p>

| Producto | Repositorio | Pull requests | Releases |
|---|---|:---:|---|
| Web Services | `healthify-platform` | 14 (#10 a #23) | `v1.1.0`, `v1.1.1`, `v1.2.0`, `v1.3.0`, `v1.4.0`, `v1.5.0`, `v1.6.0` |
| Landing Page | `healthify-website` | 6 (#9 a #14) | `v2.0.0`, `v2.1.0`, `v2.2.0` |
| Mobile Application (Android) | `healthify-android-app` | 29 (#7 a #35; #29 se cerró sin integrar) | `v1.4.0` a `v2.1.0` (11 versiones) |
| Mobile Application (Flutter) | `healthify-flutter-app` | 22 (#1 a #22) | `v1.0.0`, `v1.1.0`, `v1.2.0`, `v1.3.0`, `v1.3.1` |

<p class="caption"><strong>Figura 183</strong><br><em>Captura de GitHub: pull requests del backend</em></p>

![Pull requests del backend](../assets/img/chapter4/sprint2/gh-platform-pulls.png)

<p class="caption"><strong>Figura 184</strong><br><em>Captura de GitHub: pull requests del landing page</em></p>

![Pull requests del landing page](../assets/img/chapter4/sprint2/gh-website-pulls.png)

<p class="caption"><strong>Figura 185</strong><br><em>Captura de GitHub: pull requests de la aplicación Android</em></p>

![Pull requests de la aplicación Android](../assets/img/chapter4/sprint2/gh-android-pulls.png)

<p class="caption"><strong>Figura 186</strong><br><em>Captura de GitHub: pull requests de la aplicación Flutter</em></p>

![Pull requests de la aplicación Flutter](../assets/img/chapter4/sprint2/gh-flutter-pulls.png)

**Web Services (backend)**

<p class="caption"><strong>Tabla 264</strong><br><em>Commits del Sprint 2 del backend</em></p>

| Repository | Branch | Commit Id | Commit Message | Commit Message Body | Committed on |
|---|---|---|---|---|---|
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/data-export-and-clinical-day` | 26ebb20 | feat(care-relationship): add care link history lookup for the data export | — | 14/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/data-export-and-clinical-day` | a9b3e52 | feat(iam): expose the account profile for the data export | — | 14/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/data-export-and-clinical-day` | e9b8856 | feat(nutritional-care): expose published plan versions for the data export | — | 14/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/data-export-and-clinical-day` | 29db362 | feat(intake): expose diary and self weigh-ins for the data export | — | 15/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/data-export-and-clinical-day` | 5d4b398 | feat(monitoring): expose the follow-up history for the data export | — | 15/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/data-export-and-clinical-day` | 0c23d67 | feat(read-models): add localized data export messages | — | 15/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/data-export-and-clinical-day` | 774c615 | feat(read-models): add the patient data export composer and writer | — | 16/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/data-export-and-clinical-day` | 957bc0a | feat(read-models): add the patient data export endpoint | — | 16/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/data-export-and-clinical-day` | 152f2e5 | feat(app): register the patient data export services | — | 16/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/data-export-and-clinical-day` | 42c6057 | test(read-models): add patient data export tests | — | 17/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/data-export-and-clinical-day` | 5855fbf | feat(intake): query the diary over a range of days in the database | — | 17/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/data-export-and-clinical-day` | e0f967f | test(intake): add diary range tests | — | 17/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/data-export-and-clinical-day` | 9d0479b | feat(monitoring): add the declared offset and clinical date calendars | — | 18/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/data-export-and-clinical-day` | f39491f | feat(monitoring): evaluate snapshot days on the patient and clinical calendar | — | 18/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/data-export-and-clinical-day` | ba83583 | feat(monitoring): repair days evaluated against the UTC date at start-up | — | 19/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/data-export-and-clinical-day` | 09274ef | feat(app): register the clinical day repair worker | — | 19/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/data-export-and-clinical-day` | 5c2b447 | test(monitoring): add clinical day evaluation tests | — | 19/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/data-export-and-clinical-day` | 1d9faf1 | feat(intake): add catalog-name prompts for meal ideas and photo recognition | — | 19/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/data-export-and-clinical-day` | af832b8 | feat(intake): feed catalog names to meal ideas and resolve photo alternatives | — | 20/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/data-export-and-clinical-day` | c02dfdb | test(intake): add catalog vocabulary and alternative resolution tests | — | 20/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/data-export-and-clinical-day` | 116ce34 | fix(food-catalog): match whole words only in food names | — | 20/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/data-export-and-clinical-day` | ecf5165 | chore(migrations): add the diary entry patient timestamp index migration | — | 20/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/data-export-and-clinical-day` | 513bc81 | chore(csproj): set project version to 1.1.0 | — | 21/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `develop` | 0621177 | Merge pull request #10 from upc-pre-202620-1acc0238-13981-nutrisync/feature/data-export-and-clinical-day | Feature/data export and clinical day | 21/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `main` | dbb91cb | Merge pull request #11 from upc-pre-202620-1acc0238-13981-nutrisync/develop | Release/1.1.0 | 21/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/gemini-thinking-level-fix` | e8ec491 | fix(shared): bound the Gemini thinking with Ai:Gemini:ThinkingLevel | — | 26/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/gemini-thinking-level-fix` | 1a064e2 | test(shared): cover the Gemini thinking level | — | 26/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/gemini-thinking-level-fix` | a3b7f7e | chore(config): bound the Gemini thinking level in production | — | 26/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/gemini-thinking-level-fix` | 038c83b | fix(intake): give meal ideas room for the Gemini answer | — | 27/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/gemini-thinking-level-fix` | e723fb9 | chore(csproj): set project version to 1.1.1 | — | 27/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `develop` | fc5416c | Merge pull request #12 from upc-pre-202620-1acc0238-13981-nutrisync/feature/gemini-thinking-level-fix | Feature/gemini thinking level fix | 27/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `main` | c880109 | Merge pull request #13 from upc-pre-202620-1acc0238-13981-nutrisync/develop | Release/1.1.1 | 27/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/password-recovery` | e6b4ebd | feat(iam): add the password reset domain model | — | 27/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/password-recovery` | e5a4015 | feat(iam): add localized password reset messages | — | 27/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/password-recovery` | 2de2cce | build(deps): add MailKit for the password reset email | — | 27/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/password-recovery` | 2b3eac7 | chore(config): add SMTP and password reset settings | — | 27/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/password-recovery` | 8105aa0 | feat(iam): add the password reset command service | — | 28/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/password-recovery` | d06b3da | feat(iam): add reset code hashing, SMTP mailing and persistence | — | 28/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/password-recovery` | ac57c0d | feat(iam): add the password reset endpoints | — | 28/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/password-recovery` | e822002 | feat(app): register the password reset services | — | 28/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/password-recovery` | 80f0212 | test(iam): add password reset tests | — | 28/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/password-recovery` | 06ed4e2 | chore(migrations): add the password reset codes migration | — | 28/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/password-recovery` | fbd4bf5 | docs(readme): document the SMTP settings | — | 28/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/password-recovery` | 73e2632 | chore(csproj): set project version to 1.2.0 | — | 28/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `develop` | 16365a7 | Merge pull request #14 from upc-pre-202620-1acc0238-13981-nutrisync/feature/password-recovery | Feature/password recovery | 28/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `main` | b7c002a | Merge pull request #15 from upc-pre-202620-1acc0238-13981-nutrisync/develop | Release/1.2.0 | 28/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/password-reset-verification` | 716a0fb | feat(iam): add the password reset verification domain model | — | 28/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/password-reset-verification` | 051831b | feat(iam): persist and look up reset tokens | — | 28/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/password-reset-verification` | a51bfab | feat(iam): verify the code and reset the password with a token | — | 28/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/password-reset-verification` | faef8b9 | feat(iam): add the verification endpoint and token-based reset | — | 28/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/password-reset-verification` | d030d54 | chore(migrations): add the password reset verification migration | — | 28/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/password-reset-verification` | d446aaa | chore(csproj): set project version to 1.3.0 | — | 28/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `develop` | 2dd1191 | Merge pull request #16 from upc-pre-202620-1acc0238-13981-nutrisync/feature/password-reset-verification | Feature/password reset verification | 28/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `main` | 2b925d8 | Merge pull request #17 from upc-pre-202620-1acc0238-13981-nutrisync/develop | Release/1.3.0 | 28/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/plan-fit-suggestion` | ca00984 | feat(intake): add the plan fit suggestion rules | — | 28/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/plan-fit-suggestion` | f825557 | feat(intake): add the plan fit query and the local date of a photo analysis | — | 28/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/plan-fit-suggestion` | a84324e | feat(intake): compute the plan fit from the plan and the diary | — | 28/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/plan-fit-suggestion` | 0e7b6de | feat(intake): attach the plan fit to the meal photo analysis | — | 28/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/plan-fit-suggestion` | 2c96ce0 | feat(intake): add the plan fit resources and assemblers | — | 28/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/plan-fit-suggestion` | aa0d68c | feat(intake): add the plan fit endpoint | — | 28/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/plan-fit-suggestion` | 7138174 | feat(intake): accept the local date on meal photo analysis | — | 28/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/plan-fit-suggestion` | 59b0e3d | feat(app): register the plan fit query service | — | 28/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/plan-fit-suggestion` | 9ab616a | test(intake): add plan fit tests | — | 28/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/plan-fit-suggestion` | 30cefeb | chore(csproj): set project version to 1.4.0 | — | 28/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `develop` | ec520b3 | Merge pull request #18 from upc-pre-202620-1acc0238-13981-nutrisync/feature/plan-fit-suggestion | Feature/plan fit suggestion | 28/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `main` | 8e9f69e | Merge pull request #19 from upc-pre-202620-1acc0238-13981-nutrisync/develop | Release/1.4.0 | 28/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/daily-intake` | cbf9f22 | feat(intake): add the daily intake model and query | — | 28/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/daily-intake` | 91a2b00 | feat(intake): compute the daily intake from the plan and the diary | — | 28/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/daily-intake` | f3e6e4c | feat(intake): add the daily intake resource and assembler | — | 29/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/daily-intake` | d448e76 | feat(intake): add the daily intake endpoint | — | 29/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/daily-intake` | e7622e1 | feat(app): register the daily intake query service | — | 29/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/daily-intake` | f2ff207 | test(intake): add daily intake tests | — | 29/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/daily-intake` | 96407ae | chore(csproj): set project version to 1.5.0 | — | 29/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `develop` | 3642e9d | Merge pull request #20 from upc-pre-202620-1acc0238-13981-nutrisync/feature/daily-intake | Feature/daily intake | 29/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `main` | 6c4243e | Merge pull request #21 from upc-pre-202620-1acc0238-13981-nutrisync/develop | Release/1.5.0 | 29/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `refactor/retire-legacy-clinical-endpoints` | 46088b4 | refactor(care): remove obsolete clinical commands and command services | — | 29/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `refactor/retire-legacy-clinical-endpoints` | 8e6fd83 | refactor(care): remove deprecated endpoints from clinical controllers | — | 29/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `refactor/retire-legacy-clinical-endpoints` | 3f2adae | refactor(care): remove nutritional diagnoses controller and legacy resources | — | 29/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `refactor/retire-legacy-clinical-endpoints` | 48c17b4 | refactor(care): clean up legacy nutritional care assemblers | — | 29/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `refactor/retire-legacy-clinical-endpoints` | 4c89ec7 | test(care): remove deprecated clinical assessment and diagnosis contract tests | — | 29/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `refactor/retire-legacy-clinical-endpoints` | 8935a62 | refactor(app): remove deprecated nutritional care service registrations | — | 29/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `refactor/retire-legacy-clinical-endpoints` | 975a230 | docs(shared): clean up requirement tags and standardize doc comments in shared module | — | 29/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `refactor/retire-legacy-clinical-endpoints` | dd676d1 | docs(iam): clean up requirement references in iam context | — | 29/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `refactor/retire-legacy-clinical-endpoints` | df815b4 | docs(care): clean up requirement tags across care relationship context | — | 29/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `refactor/retire-legacy-clinical-endpoints` | 46e72f5 | docs(catalog): clean up requirement references in food catalog context | — | 29/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `refactor/retire-legacy-clinical-endpoints` | 1fe794a | docs(intake): remove requirement tags and translate doc comments in intake body response | — | 29/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `refactor/retire-legacy-clinical-endpoints` | 8a89115 | docs(monitoring): standardize documentation in monitoring adherence context | — | 29/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `refactor/retire-legacy-clinical-endpoints` | 075f5f8 | docs(care): clean up specification tags in nutritional care context | — | 29/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `refactor/retire-legacy-clinical-endpoints` | 711e65f | docs(readmodels): clean up requirement tags and comments in read models | — | 29/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `refactor/retire-legacy-clinical-endpoints` | 38da0da | chore(csproj): set project version to 1.6.0 | — | 29/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `develop` | f24756e | Merge pull request #22 from upc-pre-202620-1acc0238-13981-nutrisync/refactor/retire-legacy-clinical-endpoints | Refactor/retire legacy clinical endpoints | 29/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `main` | f4d6129 | Merge pull request #23 from upc-pre-202620-1acc0238-13981-nutrisync/develop | Release/1.6.0 | 29/10/2026 |

**Landing Page**

<p class="caption"><strong>Tabla 265</strong><br><em>Commits del Sprint 2 del landing page</em></p>

| Repository | Branch | Commit Id | Commit Message | Commit Message Body | Committed on |
|---|---|---|---|---|---|
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-website | `feature/redesign-website` | f8a1d24 | feat(assets): add white logo variant | — | 31/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-website | `feature/redesign-website` | 10688fa | feat(assets): add Spanish consultation flow screens | — | 31/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-website | `feature/redesign-website` | 504a417 | feat(assets): add Spanish patient app screens | — | 31/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-website | `feature/redesign-website` | 42ee793 | feat(assets): add Spanish nutritionist app screens | — | 31/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-website | `feature/redesign-website` | 238da22 | feat(assets): add English consultation flow screens | — | 31/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-website | `feature/redesign-website` | 3dcbc5c | feat(assets): add English patient app screens | — | 31/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-website | `feature/redesign-website` | cfe5a0c | feat(assets): add English nutritionist app screens | — | 31/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-website | `feature/redesign-website` | d004977 | refactor(css): rebuild styles on Figma V10 tokens with mobile-first layouts | — | 31/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-website | `feature/redesign-website` | cc491ba | feat(i18n): add V10 strings and language-aware app screenshots | — | 31/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-website | `feature/redesign-website` | a56a0ab | feat(js): add steps carousel, menu focus trap and contact form validation | — | 31/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-website | `feature/redesign-website` | 44ddd68 | feat(index): redesign home page to Figma V10 | — | 01/11/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-website | `feature/redesign-website` | a3adbf5 | feat(about): redesign about us page to V1.1 | — | 01/11/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-website | `feature/redesign-website` | c52163d | feat(contact): redesign contact page with case selector and error summary | — | 01/11/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-website | `feature/redesign-website` | c5bc4bc | feat(terms): redesign terms page with sticky and mobile index | — | 01/11/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-website | `feature/redesign-website` | 3cf147d | docs(readme): document V10 structure, layout and pending review | — | 01/11/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-website | `feature/redesign-website` | 4f2e987 | docs(README): update readme | — | 01/11/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-website | `develop` | 9270519 | Merge pull request #9 from upc-pre-202620-1acc0238-13981-nutrisync/feature/redesign-website | Feature/redesign website | 01/11/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-website | `main` | b711a58 | Merge pull request #10 from upc-pre-202620-1acc0238-13981-nutrisync/develop | Develop | 01/11/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-website | `feature/testimonials` | 5d8b771 | chore(css): update header behavior | — | 02/11/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-website | `feature/testimonials` | 683b4e7 | chore(index): add a message effect to testimonials | — | 02/11/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-website | `feature/testimonials` | 6182803 | chore: update i18n keys | — | 02/11/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-website | `feature/testimonials` | ade8db0 | chore: add effects for index | — | 02/11/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-website | `develop` | c26da06 | Merge pull request #11 from upc-pre-202620-1acc0238-13981-nutrisync/feature/testimonials | Feature/testimonials | 02/11/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-website | `main` | 1c3d830 | Merge pull request #12 from upc-pre-202620-1acc0238-13981-nutrisync/develop | Release/2.1.0 | 02/11/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-website | `feature/dual-app-download` | f9b3b4b | feat(assets): add platform vector icons and download button styles | — | 03/11/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-website | `feature/dual-app-download` | ed25348 | feat(js): implement accessible disclosure panel for header download menu | — | 03/11/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-website | `feature/dual-app-download` | df709a2 | feat(i18n): add spanish and english localization strings for app downloads | — | 03/11/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-website | `feature/dual-app-download` | 9f97b67 | feat(home): add dual app download options to header, hero and mobile drawer | — | 03/11/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-website | `feature/dual-app-download` | 84cc6ef | feat(pages): update header download disclosure and footer links across secondary pages | — | 03/11/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-website | `feature/dual-app-download` | fc14b06 | chore: update about-the-team and about-the-product | — | 04/11/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-website | `feature/dual-app-download` | 71e19d6 | chore: update README | — | 04/11/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-website | `develop` | dffbcf6 | Merge pull request #13 from upc-pre-202620-1acc0238-13981-nutrisync/feature/dual-app-download | Feature/dual app download | 04/11/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-website | `main` | 07e609f | Merge pull request #14 from upc-pre-202620-1acc0238-13981-nutrisync/develop | Release/2.2.0 | 04/11/2026 |

**Mobile Application (Android)**

<p class="caption"><strong>Tabla 266</strong><br><em>Commits del Sprint 2 de la aplicación Android</em></p>

| Repository | Branch | Commit Id | Commit Message | Commit Message Body | Committed on |
|---|---|---|---|---|---|
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `feature/data-export-and-ui-polish` | 0b1ed56 | feat(branding): redraw launcher icon background and foreground | — | 19/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `feature/data-export-and-ui-polish` | 769f38e | feat(branding): replace webp launcher icons with legacy-API icon | — | 19/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `feature/data-export-and-ui-polish` | 0ea9a08 | feat(designsystem): add unit suffix to HealthifyTextField | — | 19/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `feature/data-export-and-ui-polish` | 7bbefa0 | refactor(nutritionalcare): use text field suffix for clinical units | — | 19/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `feature/data-export-and-ui-polish` | 7d672b7 | feat(designsystem): add supporting text to HealthifySwitchRow | — | 19/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `feature/data-export-and-ui-polish` | ea418db | fix(intake): show reminder times inside the switch row | — | 19/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `feature/data-export-and-ui-polish` | ea485c8 | feat(i18n): add AI ideas consent and rate-limit messages | — | 19/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `feature/data-export-and-ui-polish` | f219fd7 | fix(intake): show a distinct meal ideas error per backend code | — | 19/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `feature/data-export-and-ui-polish` | cee6a04 | feat(i18n): add energy goal exceeded messages | — | 20/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `feature/data-export-and-ui-polish` | 37d862a | feat(main): show an encouraging card when the daily energy goal is exceeded | — | 20/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `feature/data-export-and-ui-polish` | 335697d | feat(i18n): add data export messages | — | 20/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `feature/data-export-and-ui-polish` | 4290b6f | feat(main): add data export domain and use cases | — | 20/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `feature/data-export-and-ui-polish` | a852cac | feat(main): add data export service, file writer and repository | — | 20/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `feature/data-export-and-ui-polish` | c18cb63 | feat(main): add data export state and handling in settings view model | — | 20/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `feature/data-export-and-ui-polish` | 42df13b | feat(main): replace the data export placeholder with a real download | — | 20/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `develop` | 6dcd4be | Merge pull request #7 from upc-pre-202620-1acc0238-13981-nutrisync/feature/data-export-and-ui-polish | Feature/data export and UI polish | 21/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `main` | 190437d | Merge pull request #8 from upc-pre-202620-1acc0238-13981-nutrisync/develop | Release/1.1.0 | 21/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `feature/patient-main-menu-and-consultation-discard` | fb84a08 | feat(i18n): add patient main menu and consultation discard messages | — | 22/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `feature/patient-main-menu-and-consultation-discard` | ca84a43 | feat(designsystem): add menu and delete icons | — | 22/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `feature/patient-main-menu-and-consultation-discard` | f7e83c4 | feat(nutritionalcare): add the discard consultation endpoint, repository and use case | — | 22/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `feature/patient-main-menu-and-consultation-discard` | 7ad9147 | feat(nutritionalcare): handle discarding the consultation in the measurement step | — | 23/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `feature/patient-main-menu-and-consultation-discard` | 54663e8 | feat(nutritionalcare): add a delete action to the measurement step | — | 23/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `feature/patient-main-menu-and-consultation-discard` | 24bdd47 | refactor(main): unify the home notice cards into a shared component | — | 23/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `feature/patient-main-menu-and-consultation-discard` | 4561b2a | feat(designsystem): add an end drawer for side menus | — | 24/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `feature/patient-main-menu-and-consultation-discard` | c1608fa | feat(main): add the patient shell view model with the menu state | — | 24/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `feature/patient-main-menu-and-consultation-discard` | aa8b81b | feat(main): add the patient main menu content | — | 24/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `feature/patient-main-menu-and-consultation-discard` | 3c015dc | feat(designsystem): replace the settings tab with a register meal camera button | — | 25/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `feature/patient-main-menu-and-consultation-discard` | a783c3a | feat(ui): add the main menu button to the diary, progress and record tabs | — | 25/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `feature/patient-main-menu-and-consultation-discard` | af8bdf7 | feat(main): add menu and reminders actions to home and drop the register meal card | — | 25/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `feature/patient-main-menu-and-consultation-discard` | d8ba023 | feat(main): open the main menu from the patient shell and move settings into it | — | 26/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `feature/patient-main-menu-and-consultation-discard` | e15d014 | feat(carerelationship): show AI feature descriptions inside their switch rows | — | 26/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `feature/patient-main-menu-and-consultation-discard` | db2781e | feat(foodcatalog): move the add local food button above the search field | — | 26/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `develop` | 963da48 | Merge pull request #9 from upc-pre-202620-1acc0238-13981-nutrisync/feature/patient-main-menu-and-consultation-discard | Feature/patient main menu and consultation discard | 27/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `main` | 068be17 | Merge pull request #10 from upc-pre-202620-1acc0238-13981-nutrisync/develop | Release/1.1.0 | 27/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `feature/password-recovery` | 7018d70 | feat(iam): add password reset code and token value objects | — | 28/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `feature/password-recovery` | dab40c6 | feat(iam): add password reset entity, repository contract and use cases | — | 28/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `feature/password-recovery` | c305b62 | test(iam): add password reset operations to the fake authentication repository | — | 28/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `feature/password-recovery` | 7af8cb9 | feat(iam): add password reset endpoints and DTOs | — | 28/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `feature/password-recovery` | a716ca1 | feat(iam): implement password reset in the authentication repository | — | 28/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `feature/password-recovery` | 29b26a9 | feat(i18n): add password recovery messages | — | 28/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `feature/password-recovery` | 7776920 | feat(iam): add forgot password state and view model | — | 28/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `feature/password-recovery` | 8892107 | feat(iam): add forgot password screen | — | 28/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `feature/password-recovery` | f128244 | refactor(iam): navigate from sign-in to password recovery instead of a placeholder dialog | — | 28/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `feature/password-recovery` | 4f9e04e | feat(iam): wire the forgot password route into the navigation graph | — | 28/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `develop` | 81f86c2 | Merge pull request #11 from upc-pre-202620-1acc0238-13981-nutrisync/feature/password-recovery | Feature/password recovery | 28/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `main` | 6c16248 | Merge pull request #12 from upc-pre-202620-1acc0238-13981-nutrisync/develop | Release/1.2.0 | 28/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `feature/practitioner-settings-menu` | 0e40787 | feat(i18n): add practitioner main menu texts | — | 28/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `feature/practitioner-settings-menu` | 6ec928d | feat(main): add practitioner main menu drawer content | — | 28/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `feature/practitioner-settings-menu` | 25c684a | feat(main): add practitioner shell state and view model | — | 28/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `feature/practitioner-settings-menu` | c5945f7 | refactor(designsystem): drop the Settings tab from the practitioner navigation bar | — | 28/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `feature/practitioner-settings-menu` | e102441 | feat(main): add the menu button to patient roster, review inbox and agenda | — | 28/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `feature/practitioner-settings-menu` | f31b01f | feat(main): open the practitioner menu from the shell | — | 28/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `feature/practitioner-settings-menu` | bf29441 | refactor(main): make practitioner settings an internal screen state | — | 28/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `feature/practitioner-settings-menu` | d9c95a0 | refactor(main): show practitioner settings as a full screen with back navigation | — | 28/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `feature/practitioner-settings-menu` | 240f0e6 | chore(i18n): remove the unused practitioner settings food catalog text | — | 28/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `feature/practitioner-settings-menu` | f6bc089 | feat(navigation): route practitioner settings from the shell menu | — | 28/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `develop` | 9964316 | Merge pull request #13 from upc-pre-202620-1acc0238-13981-nutrisync/feature/practitioner-settings-menu | Feature/practitioner settings menu | 28/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `main` | d8dabb9 | Merge pull request #14 from upc-pre-202620-1acc0238-13981-nutrisync/develop | Release/1.3.0 | 28/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `feature/home-gauge-roster-and-reminders` | 2e4e08a | feat(carerelationship): classify roster patients by pending action | — | 29/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `feature/home-gauge-roster-and-reminders` | d7e5bec | feat(carerelationship): group the roster by action with patient search | — | 29/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `feature/home-gauge-roster-and-reminders` | b3dbe8b | feat(intake): read the daily intake from active targets | — | 29/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `feature/home-gauge-roster-and-reminders` | c0083d5 | feat(monitoring): add the logged week built from compliance days | — | 29/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `feature/home-gauge-roster-and-reminders` | 12d8520 | feat(main): load the daily gauge and logged week into the home state | — | 29/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `feature/home-gauge-roster-and-reminders` | 9787205 | feat(main): show the daily energy gauge and the week on home | — | 29/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `feature/home-gauge-roster-and-reminders` | 70a076f | feat(monitoring): add the consultation reminder model and scheduling port | — | 29/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `feature/home-gauge-roster-and-reminders` | 77b0e99 | feat(monitoring): schedule consultation reminders with WorkManager | — | 29/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `feature/home-gauge-roster-and-reminders` | 2d6b433 | feat(main): request notification permission and refresh reminders from the shells | — | 29/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `feature/home-gauge-roster-and-reminders` | fab78e8 | feat(nutritionalcare): add plan version, evaluation and referral detail to the record data | — | 29/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `feature/home-gauge-roster-and-reminders` | ff4f46b | feat(nutritionalcare): add detail sheets for plan versions, evaluations and referrals | — | 29/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `feature/home-gauge-roster-and-reminders` | 7268620 | feat(nutritionalcare): open the detail sheets from the record and plan screens | — | 29/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `feature/home-gauge-roster-and-reminders` | 439a0a5 | feat(navigation): open a plan version straight from a past consultation | — | 29/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `feature/home-gauge-roster-and-reminders` | 01b104a | fix(main): keep the settings content above the navigation bar | — | 29/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `feature/home-gauge-roster-and-reminders` | cea8ac1 | feat(main): swipe between the tabs of the practitioner patient screen | — | 29/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `develop` | ecfe600 | Merge pull request #15 from upc-pre-202620-1acc0238-13981-nutrisync/feature/home-gauge-roster-and-reminders | Feature/home gauge roster and reminders | 29/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `main` | 6c4a9ff | Merge pull request #16 from upc-pre-202620-1acc0238-13981-nutrisync/develop | Release/1.4.0 | 29/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `feature/home-gauge-roster-and-reminders` | 71a7ba1 | fix: update progress bar | — | 29/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `develop` | b79c723 | Merge pull request #17 from upc-pre-202620-1acc0238-13981-nutrisync/feature/home-gauge-roster-and-reminders | fix: update progress bar | 29/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `main` | 9672a7d | Merge pull request #18 from upc-pre-202620-1acc0238-13981-nutrisync/develop | Release/1.4.1 | 29/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `feature/plan-fit-suggestion` | 248d44e | feat(intake): add localization strings for AI plan fit suggestions and meal ideas loading | — | 29/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `feature/plan-fit-suggestion` | 1b8f1b3 | feat(intake): define domain models and repository contract for plan fit suggestions | — | 29/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `feature/plan-fit-suggestion` | 8c91321 | feat(intake): integrate plan fit suggestion in meal photo domain and use cases | — | 29/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `feature/plan-fit-suggestion` | 1e2d7e1 | feat(intake): implement DTOs, API service endpoints and mappers for plan fit | — | 29/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `feature/plan-fit-suggestion` | ef16811 | feat(intake): implement plan fit repository and configure dependency injection | — | 29/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `feature/plan-fit-suggestion` | 83d965e | feat(intake): update meal form UI components to display AI plan fit suggestions | — | 29/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `feature/plan-fit-suggestion` | 4ee3766 | feat(intake): add live loading indicator to meal ideas screen | — | 29/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `feature/plan-fit-suggestion` | e5c70ac | feat(intake): manage plan fit debounce state and integrate suggester in meal form | — | 29/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `feature/plan-fit-suggestion` | cec3b5f | feat(intake): connect plan fit suggestions to manual meal and photo view models | — | 29/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `feature/plan-fit-suggestion` | add4308 | test(intake): add test fakes and unit tests for plan fit suggestions and flow | — | 29/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `develop` | 959da33 | Merge pull request #19 from upc-pre-202620-1acc0238-13981-nutrisync/feature/plan-fit-suggestion | Feature/plan fit suggestion | 29/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `main` | dea80a7 | Merge pull request #20 from upc-pre-202620-1acc0238-13981-nutrisync/develop | Release/1.5.0 | 29/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `feature/home-notice-and-password-visibility` | 3939b47 | feat(designsystem): add the crossed-eye visibility-off icon | — | 29/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `feature/home-notice-and-password-visibility` | e1337a6 | fix(designsystem): show the crossed eye while the password is visible | — | 29/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `feature/home-notice-and-password-visibility` | f2bf2f2 | fix(main): keep the gauge center text inside the arc | — | 29/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `feature/home-notice-and-password-visibility` | 71a2b93 | feat(i18n): add expand and collapse texts for home notices | — | 29/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `feature/home-notice-and-password-visibility` | f182743 | feat(main): let long home notices expand and collapse on tap | — | 29/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `develop` | 626a20a | Merge pull request #21 from upc-pre-202620-1acc0238-13981-nutrisync/feature/home-notice-and-password-visibility | Feature/home notice and password visibility | 29/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `main` | 29b8127 | Merge pull request #22 from upc-pre-202620-1acc0238-13981-nutrisync/develop | Release/1.5.1 | 29/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `feature/codebase-english-comments` | b7c3eeb | docs(build): translate gradle build configs, manifests, resources and navigation comments | — | 29/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `feature/codebase-english-comments` | 9636db7 | docs(core): translate core design system, database, and network architecture comments | — | 29/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `feature/codebase-english-comments` | 6325b55 | docs(iam): translate authentication, session and onboarding feature comments | — | 29/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `feature/codebase-english-comments` | dae0042 | docs(carerelationship): translate patient-practitioner care relationship comments | — | 29/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `feature/codebase-english-comments` | b50aa4b | docs(main): translate main patient shell, home, settings and food catalog comments | — | 29/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `feature/codebase-english-comments` | 8d9acd9 | docs(intake): translate meal intake domain, use cases, and infrastructure comments | — | 29/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `feature/codebase-english-comments` | 6f345dc | docs(intake): translate meal intake presentation screens, components and viewmodel comments | — | 29/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `feature/codebase-english-comments` | 72fae56 | docs(monitoring): translate patient monitoring, check-ins, and reminders comments | — | 29/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `feature/codebase-english-comments` | 5cc74d6 | docs(nutritionalcare): translate nutritional care plans and practitioner review comments | — | 29/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `feature/codebase-english-comments` | d978b71 | docs(testing): translate unit tests, fakes, and mock infrastructure comments | — | 29/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `develop` | 276ffef | Merge pull request #23 from upc-pre-202620-1acc0238-13981-nutrisync/feature/codebase-english-comments | Feature/codebase english comments | 29/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `main` | 405a25b | Merge pull request #24 from upc-pre-202620-1acc0238-13981-nutrisync/develop | Release/1.6.0 | 29/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `feature/ci-cd-app-distribution` | db6c231 | build(app): sign release builds with an upload keystore | — | 29/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `feature/ci-cd-app-distribution` | e451f3d | build(app): read versionCode from a Gradle property | — | 29/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `feature/ci-cd-app-distribution` | 0f15497 | build(deps): add the Firebase App Distribution plugin to the catalog | — | 29/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `feature/ci-cd-app-distribution` | 28a2bb4 | build(app): configure Firebase App Distribution for release builds | — | 29/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `feature/ci-cd-app-distribution` | 9049d63 | ci(workflows): run lint, unit tests and the debug build on pull requests | — | 29/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `feature/ci-cd-app-distribution` | c72a298 | ci(workflows): distribute signed release builds to Firebase testers | — | 29/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `feature/ci-cd-app-distribution` | ebde25d | docs(readme): describe the CI/CD workflows | — | 29/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `feature/ci-cd-app-distribution` | 3776011 | docs(readme): list the repository secrets | — | 29/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `feature/ci-cd-app-distribution` | fe466c9 | docs(readme): explain local release signing | — | 29/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `feature/ci-cd-app-distribution` | 224af9e | build(app): bump version to 1.7.0 | — | 29/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `develop` | 0e198c4 | Merge pull request #25 from upc-pre-202620-1acc0238-13981-nutrisync/feature/ci-cd-app-distribution | Feature/ci cd app distribution | 29/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `main` | dca5f3b | Merge pull request #26 from upc-pre-202620-1acc0238-13981-nutrisync/develop | Release/1.7.0 | 29/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `feature/github-release` | d3b7c3f | chore(ci/cd): add github release | — | 29/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `feature/github-release` | 72f4cec | chore: update version to 1.7.1 | — | 29/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `develop` | 60c7fb6 | Merge pull request #27 from upc-pre-202620-1acc0238-13981-nutrisync/feature/github-release | Feature/GitHub release | 29/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `main` | c39cd4e | Merge pull request #28 from upc-pre-202620-1acc0238-13981-nutrisync/develop | Release/1.7.1 | 29/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `feature/sign-up-terms-acceptance` | 88b9da1 | feat(core): add legal links | — | 30/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `feature/sign-up-terms-acceptance` | dd9e50e | feat(designsystem): add checkbox component | — | 30/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `feature/sign-up-terms-acceptance` | 65a5edd | feat(iam): add terms acceptance strings | — | 30/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `feature/sign-up-terms-acceptance` | 44f2ce5 | feat(iam): add terms acceptance row | — | 30/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `feature/sign-up-terms-acceptance` | babdef6 | feat(iam): add terms to the sign-up state | — | 30/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `feature/sign-up-terms-acceptance` | 24cde6c | feat(iam): require accepting the terms on sign-up | — | 30/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `feature/sign-up-terms-acceptance` | 8d6e47e | feat(iam): show the terms on the sign-up screen | — | 30/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `feature/sign-up-terms-acceptance` | 5d09c1b | feat(iam): preview the terms error | — | 30/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `feature/sign-up-terms-acceptance` | ecbd3d3 | test(iam): cover the sign-up terms | — | 30/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `feature/sign-up-terms-acceptance` | 0e336a5 | build(app): bump version to 1.8.0 | — | 30/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `develop` | e798366 | Merge pull request #30 from upc-pre-202620-1acc0238-13981-nutrisync/feature/sign-up-terms-acceptance | Feature/sign up terms acceptance | 30/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `main` | bcd15f7 | Merge pull request #31 from upc-pre-202620-1acc0238-13981-nutrisync/develop | Release/1.8.0 | 30/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `feature/interview-validation-fixes` | e64ce8c | feat(navigation): drop the screen transitions on back | — | 31/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `feature/interview-validation-fixes` | ea52cae | fix(home): read the energy goal like the record adherence | — | 31/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `feature/interview-validation-fixes` | 522a401 | test(home): cover the tolerance band of the energy goal | — | 31/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `feature/interview-validation-fixes` | d83de78 | feat(designsystem): label the log meal button | — | 31/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `feature/interview-validation-fixes` | c6eb129 | feat(intake): clarify the weight tab and its trend summary | — | 31/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `feature/interview-validation-fixes` | 28b610f | feat(monitoring): explain pending confirmation in the diary | — | 31/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `feature/interview-validation-fixes` | d965629 | feat(nutritionalcare): pin the consultation action in the record tab | — | 31/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `feature/interview-validation-fixes` | 78c8b08 | build(app): bump version to 2.0.0 | — | 31/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `develop` | 17fd10b | Merge pull request #32 from upc-pre-202620-1acc0238-13981-nutrisync/feature/interview-validation-fixes | Feature/interview validation fixes | 02/11/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `main` | a6ac178 | Merge pull request #33 from upc-pre-202620-1acc0238-13981-nutrisync/develop | Release/2.0.0 | 02/11/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `feature/close-referral` | e0f5f54 | feat(monitoring): define domain models, use cases and strings for closing referrals | — | 02/11/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `feature/close-referral` | 36fb949 | feat(monitoring): implement referral closure api endpoint and repository logic | — | 02/11/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `feature/close-referral` | 0327cd2 | feat(nutritionalcare): add referral closure flow and confirmation dialog in patient record tab | — | 02/11/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `feature/close-referral` | 610fea2 | test(monitoring): add unit tests and fakes for referral closure handling | — | 02/11/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `feature/close-referral` | a057f4b | build(app): bump version to 2.1.0 | — | 02/11/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `develop` | 4179713 | Merge pull request #34 from upc-pre-202620-1acc0238-13981-nutrisync/feature/close-referral | Feature/close referral | 02/11/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `main` | 4149f4c | Merge pull request #35 from upc-pre-202620-1acc0238-13981-nutrisync/develop | Release/2.1.0 | 02/11/2026 |

**Mobile Application (Flutter)**

El repositorio se creó el 09/10/2026 y el núcleo, los módulos y la primera versión se integraron el 30/10/2026, en las ramas `feature/core-foundation`, `feature/auth-onboarding`, `feature/patient-care-links`, `feature/patient-record-consultation` y `feature/inbox-agenda-release`.

<p class="caption"><strong>Tabla 267</strong><br><em>Commits del Sprint 2 de la aplicación Flutter</em></p>

| Repository | Branch | Commit Id | Commit Message | Commit Message Body | Committed on |
|---|---|---|---|---|---|
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-flutter-app | `main` | 1294373 | Initial commit | — | 09/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-flutter-app | `feature/setup` | 933be39 | chore: initial setup | — | 30/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-flutter-app | `develop` | cf46116 | Merge pull request #1 from upc-pre-202620-1acc0238-13981-nutrisync/feature/setup | chore: initial setup | 30/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-flutter-app | `main` | 6a76a70 | Merge pull request #2 from upc-pre-202620-1acc0238-13981-nutrisync/develop | Release/0.1.0 | 30/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-flutter-app | `feature/core-foundation` | 7132b38 | chore(git): ignore release signing files | — | 30/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-flutter-app | `feature/core-foundation` | 361bfc2 | chore(deps): pin app and dev dependencies | — | 30/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-flutter-app | `feature/core-foundation` | a618414 | feat(assets): add fonts, logos and icon set | — | 30/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-flutter-app | `feature/core-foundation` | c8cff30 | feat(common): add domain errors, result and shared helpers | — | 30/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-flutter-app | `feature/core-foundation` | 229dc6e | feat(network): add api client and problem details mapping | — | 30/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-flutter-app | `feature/core-foundation` | f9a54cc | feat(network): add authenticated client and token refresh | — | 30/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-flutter-app | `feature/core-foundation` | 879457b | feat(core): add connectivity observer and service locator | — | 30/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-flutter-app | `feature/core-foundation` | f2f8777 | feat(l10n): add localization setup | — | 30/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-flutter-app | `feature/core-foundation` | 93d7c3f | feat(theme): add colors, typography, dimens and icons | — | 30/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-flutter-app | `feature/core-foundation` | 3058ecc | feat(designsystem): add buttons, fields and selectors | — | 30/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-flutter-app | `feature/core-foundation` | 889d9c7 | feat(designsystem): add dialogs, sheets and navigation bars | — | 30/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-flutter-app | `feature/core-foundation` | e3d6695 | feat(designsystem): add state widgets and display helpers | — | 30/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-flutter-app | `feature/core-foundation` | d3a6966 | feat(app): bootstrap app with placeholder screen | — | 30/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-flutter-app | `feature/core-foundation` | 795558e | ci(workflow): add analyze, test and debug build pipeline | — | 30/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-flutter-app | `feature/core-foundation` | 47d64ac | docs(readme): add running and checks guide | — | 30/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-flutter-app | `feature/core-foundation` | e8ab734 | chore(release): bump version to 0.2.0 | — | 30/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-flutter-app | `develop` | 272510a | Merge pull request #3 from upc-pre-202620-1acc0238-13981-nutrisync/feature/core-foundation | Feature/core foundation | 30/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-flutter-app | `main` | b97bd05 | Merge pull request #4 from upc-pre-202620-1acc0238-13981-nutrisync/develop | Release/0.2.0 | 30/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-flutter-app | `feature/auth-onboarding` | 08672f6 | feat(iam): add domain entities and value objects | — | 30/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-flutter-app | `feature/auth-onboarding` | 34db4b1 | feat(iam): add session and account use cases | — | 30/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-flutter-app | `feature/auth-onboarding` | 6611bd4 | feat(iam): add auth dtos and remote services | — | 30/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-flutter-app | `feature/auth-onboarding` | 398fbf8 | feat(iam): add mappers and repositories | — | 30/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-flutter-app | `feature/auth-onboarding` | 2d2ec91 | feat(iam): add local session and token refresher | — | 30/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-flutter-app | `feature/auth-onboarding` | 89625fd | feat(iam): register iam module | — | 30/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-flutter-app | `feature/auth-onboarding` | 5c1948a | feat(iam): add sign-in screen | — | 30/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-flutter-app | `feature/auth-onboarding` | ee0a86b | feat(iam): add sign-up screen | — | 30/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-flutter-app | `feature/auth-onboarding` | 9260a11 | feat(iam): add forgot password flow | — | 30/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-flutter-app | `feature/auth-onboarding` | b50b4a0 | feat(iam): add session expired and shell loading screens | — | 30/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-flutter-app | `feature/auth-onboarding` | abc3cd6 | feat(iam): add in-app language switching | — | 30/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-flutter-app | `feature/auth-onboarding` | 26db14b | feat(onboarding): add splash screen | — | 30/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-flutter-app | `feature/auth-onboarding` | 5b42549 | feat(onboarding): add welcome screen | — | 30/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-flutter-app | `feature/auth-onboarding` | 03c080e | feat(navigation): add session gate and root router | — | 30/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-flutter-app | `feature/auth-onboarding` | 8a8b0e3 | test(iam): cover auth screens layout | — | 30/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-flutter-app | `feature/auth-onboarding` | 3d70c14 | chore(release): bump version to 0.3.0 | — | 30/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-flutter-app | `develop` | 5c96f8a | Merge pull request #5 from upc-pre-202620-1acc0238-13981-nutrisync/feature/auth-onboarding | Feature/auth onboarding | 30/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-flutter-app | `main` | 85b578b | Merge pull request #6 from upc-pre-202620-1acc0238-13981-nutrisync/develop | Release/0.3.0 | 30/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-flutter-app | `feature/patient-care-links` | 2abf8d5 | feat(carerelationship): add roster and invitation domain | — | 30/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-flutter-app | `feature/patient-care-links` | dbfbf44 | feat(carerelationship): add care link use cases | — | 30/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-flutter-app | `feature/patient-care-links` | 70584df | feat(carerelationship): add dtos and service | — | 30/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-flutter-app | `feature/patient-care-links` | 96d1392 | feat(carerelationship): add mappers | — | 30/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-flutter-app | `feature/patient-care-links` | 7a346a5 | feat(carerelationship): add repository and module | — | 30/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-flutter-app | `feature/patient-care-links` | e834236 | feat(roster): add patient roster screen | — | 30/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-flutter-app | `feature/patient-care-links` | 7abf3f5 | feat(invitation): add invite patient with qr | — | 30/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-flutter-app | `feature/patient-care-links` | b77a428 | feat(discharge): add discharge patient flow | — | 30/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-flutter-app | `feature/patient-care-links` | 3edacac | feat(shell): add shell routes and cubit | — | 30/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-flutter-app | `feature/patient-care-links` | fe6be2d | feat(shell): add shell screen and menu | — | 30/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-flutter-app | `feature/patient-care-links` | 99d84e1 | feat(shell): add sign-out confirmation | — | 30/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-flutter-app | `feature/patient-care-links` | a089112 | feat(settings): add practitioner settings state | — | 30/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-flutter-app | `feature/patient-care-links` | 2aa0db8 | feat(settings): add settings screen and language sheet | — | 30/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-flutter-app | `feature/patient-care-links` | 4c1e05a | feat(navigation): wire shell and care link routes | — | 30/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-flutter-app | `feature/patient-care-links` | e7a17dc | test(carerelationship): cover screens layout | — | 30/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-flutter-app | `feature/patient-care-links` | dddf1cb | chore(release): bump version to 0.4.0 | — | 30/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-flutter-app | `develop` | 876a2fd | Merge pull request #7 from upc-pre-202620-1acc0238-13981-nutrisync/feature/patient-care-links | Feature/patient care links | 30/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-flutter-app | `main` | cb43c44 | Merge pull request #8 from upc-pre-202620-1acc0238-13981-nutrisync/develop | Release/0.4.0 | 30/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-flutter-app | `feature/patient-record-consultation` | b9491b1 | feat(nutritionalcare): add clinical domain and codes | — | 30/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-flutter-app | `feature/patient-record-consultation` | d3e9878 | feat(nutritionalcare): add practitioner care use cases | — | 30/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-flutter-app | `feature/patient-record-consultation` | edcbe44 | feat(nutritionalcare): add dtos, mappers and repositories | — | 30/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-flutter-app | `feature/patient-record-consultation` | e524241 | feat(baseline): add patient baseline form | — | 30/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-flutter-app | `feature/patient-record-consultation` | 514aa79 | feat(patient): add summary tab | — | 30/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-flutter-app | `feature/patient-record-consultation` | df75a49 | feat(patient): add plan tab | — | 30/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-flutter-app | `feature/patient-record-consultation` | 4d571c3 | feat(monitoring): add monitoring panel data | — | 30/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-flutter-app | `feature/patient-record-consultation` | 76b6abd | feat(monitoring): add patient follow-up tab | — | 30/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-flutter-app | `feature/patient-record-consultation` | c61b85f | feat(patient): add patient file, history and record | — | 30/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-flutter-app | `feature/patient-record-consultation` | a856abf | feat(consultation): add consultation commands and validations | — | 30/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-flutter-app | `feature/patient-record-consultation` | 70fade8 | feat(consultation): add consultation dtos | — | 30/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-flutter-app | `feature/patient-record-consultation` | 53e5285 | feat(consultation): add measurement step | — | 30/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-flutter-app | `feature/patient-record-consultation` | c085541 | feat(consultation): add diagnosis and targets steps | — | 30/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-flutter-app | `feature/patient-record-consultation` | 520732d | feat(consultation): add publication step | — | 30/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-flutter-app | `feature/patient-record-consultation` | 590dfef | feat(navigation): wire patient file and consultation routes | — | 30/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-flutter-app | `feature/patient-record-consultation` | f2b4393 | chore(release): bump version to 0.5.0 | — | 30/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-flutter-app | `develop` | 879977c | Merge pull request #9 from upc-pre-202620-1acc0238-13981-nutrisync/feature/patient-record-consultation | Feature/patient record consultation | 30/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-flutter-app | `main` | 45a1575 | Merge pull request #10 from upc-pre-202620-1acc0238-13981-nutrisync/develop | Release/0.5.0 | 30/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-flutter-app | `feature/inbox-agenda-release` | ed21520 | feat(review): add review inbox domain and repository | — | 30/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-flutter-app | `feature/inbox-agenda-release` | b8fbf23 | feat(review): add inbox and review item screens | — | 30/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-flutter-app | `feature/inbox-agenda-release` | 5ec9608 | feat(review): add adjust proposal screen | — | 30/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-flutter-app | `feature/inbox-agenda-release` | 625708f | feat(agenda): add agenda domain and repository | — | 30/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-flutter-app | `feature/inbox-agenda-release` | 7e06358 | feat(agenda): add agenda screen | — | 30/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-flutter-app | `feature/inbox-agenda-release` | 324cb27 | feat(agenda): add scheduling and referral screens | — | 30/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-flutter-app | `feature/inbox-agenda-release` | 962ed0e | feat(reminders): add local consultation reminders | — | 30/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-flutter-app | `feature/inbox-agenda-release` | 6868e33 | feat(navigation): wire inbox and agenda into the shell | — | 30/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-flutter-app | `feature/inbox-agenda-release` | 78cd878 | test(navigation): add app wiring and adaptive layout tests | — | 30/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-flutter-app | `feature/inbox-agenda-release` | 157c152 | feat(branding): add launcher icon and native splash | — | 30/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-flutter-app | `feature/inbox-agenda-release` | a9c1ebc | feat(app): set practitioner application id | — | 30/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-flutter-app | `feature/inbox-agenda-release` | 9246198 | ci(release): add signed build and distribution workflow | — | 30/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-flutter-app | `feature/inbox-agenda-release` | f112394 | docs(readme): add ci/cd overview | — | 30/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-flutter-app | `feature/inbox-agenda-release` | d744135 | docs(readme): add repository secrets | — | 30/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-flutter-app | `feature/inbox-agenda-release` | 6ec16f0 | docs(readme): add local release signing guide | — | 30/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-flutter-app | `feature/inbox-agenda-release` | 22cf563 | chore(release): bump version to 0.6.0 | — | 30/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-flutter-app | `develop` | 98a1280 | Merge pull request #11 from upc-pre-202620-1acc0238-13981-nutrisync/feature/inbox-agenda-release | Feature/inbox agenda release | 30/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-flutter-app | `main` | 628a931 | Merge pull request #12 from upc-pre-202620-1acc0238-13981-nutrisync/develop | Release/0.6.0 | 30/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-flutter-app | `feature/inbox-agenda-release` | d09ed9a | chore: update README | — | 30/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-flutter-app | `feature/inbox-agenda-release` | 9109273 | chore: update version to 1.0.0 | — | 30/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-flutter-app | `develop` | 29170fa | Merge pull request #13 from upc-pre-202620-1acc0238-13981-nutrisync/feature/inbox-agenda-release | Feature/inbox agenda release | 30/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-flutter-app | `main` | a107197 | Merge pull request #14 from upc-pre-202620-1acc0238-13981-nutrisync/develop | Release/1.0.0 | 30/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-flutter-app | `feature/food-catalog-and-terms` | 3bfdc78 | feat(foodcatalog): add food search value objects | — | 30/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-flutter-app | `feature/food-catalog-and-terms` | e15c374 | feat(foodcatalog): add reference food entities | — | 30/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-flutter-app | `feature/food-catalog-and-terms` | 68c10f6 | feat(foodcatalog): add repository contract and use cases | — | 30/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-flutter-app | `feature/food-catalog-and-terms` | 5747c00 | feat(foodcatalog): add reference food dtos and mappers | — | 30/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-flutter-app | `feature/food-catalog-and-terms` | 3537498 | feat(foodcatalog): add remote service and repository | — | 30/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-flutter-app | `feature/food-catalog-and-terms` | 852ded4 | feat(l10n): add food catalog strings | — | 30/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-flutter-app | `feature/food-catalog-and-terms` | ca11ea0 | feat(l10n): add local food strings | — | 30/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-flutter-app | `feature/food-catalog-and-terms` | 851d4e8 | feat(foodcatalog): add catalog screen states | — | 30/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-flutter-app | `feature/food-catalog-and-terms` | 59b31c6 | feat(foodcatalog): add catalog cubit | — | 30/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-flutter-app | `feature/food-catalog-and-terms` | dd5acfa | feat(foodcatalog): add local food cubit | — | 30/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-flutter-app | `feature/food-catalog-and-terms` | 7469c31 | feat(foodcatalog): register the catalog module | — | 30/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-flutter-app | `feature/food-catalog-and-terms` | 41a145b | feat(foodcatalog): add catalog screen | — | 30/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-flutter-app | `feature/food-catalog-and-terms` | 7a01cb1 | feat(foodcatalog): add local food screen | — | 30/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-flutter-app | `feature/food-catalog-and-terms` | 0aaf562 | feat(navigation): add food catalog routes | — | 30/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-flutter-app | `feature/food-catalog-and-terms` | 66f896f | feat(main): open the food catalog from the menu | — | 30/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-flutter-app | `feature/food-catalog-and-terms` | 4b69d13 | test(foodcatalog): add fakes and domain tests | — | 30/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-flutter-app | `feature/food-catalog-and-terms` | 36146d6 | test(foodcatalog): cover the repository | — | 30/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-flutter-app | `feature/food-catalog-and-terms` | 386de6e | test(foodcatalog): cover the cubits | — | 30/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-flutter-app | `feature/food-catalog-and-terms` | 56ac804 | test(foodcatalog): cover the screens | — | 30/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-flutter-app | `feature/food-catalog-and-terms` | c59cfca | test(navigation): cover the food catalog flow | — | 30/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-flutter-app | `feature/food-catalog-and-terms` | 5cbd506 | build(deps): add url_launcher | — | 30/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-flutter-app | `feature/food-catalog-and-terms` | 830fb5d | feat(core): add legal links | — | 30/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-flutter-app | `feature/food-catalog-and-terms` | fbf59a8 | feat(designsystem): add checkbox component | — | 30/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-flutter-app | `feature/food-catalog-and-terms` | ed6f410 | feat(l10n): add terms acceptance strings | — | 30/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-flutter-app | `feature/food-catalog-and-terms` | ba0761c | feat(iam): add terms acceptance row | — | 30/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-flutter-app | `feature/food-catalog-and-terms` | bd7e74d | feat(iam): require accepting the terms on sign-up | — | 30/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-flutter-app | `feature/food-catalog-and-terms` | c2ea72e | feat(iam): show the terms on the sign-up screen | — | 30/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-flutter-app | `feature/food-catalog-and-terms` | 077442d | test(iam): cover the sign-up terms | — | 30/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-flutter-app | `feature/food-catalog-and-terms` | 11c7c07 | test(iam): cover the terms acceptance row | — | 30/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-flutter-app | `feature/food-catalog-and-terms` | e6d6362 | chore(release): bump version to 1.1.0 | — | 30/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-flutter-app | `develop` | 8d2613f | Merge pull request #15 from upc-pre-202620-1acc0238-13981-nutrisync/feature/food-catalog-and-terms | Feature/food catalog and terms | 30/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-flutter-app | `main` | b5d64e1 | Merge pull request #16 from upc-pre-202620-1acc0238-13981-nutrisync/develop | Release/1.1.0 | 30/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-flutter-app | `feature/interview-validation-fixes` | 2bb8a67 | feat(l10n): add the pending confirmation hint | — | 01/11/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-flutter-app | `feature/interview-validation-fixes` | b9d040b | feat(monitoring): explain pending confirmation in the diary | — | 01/11/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-flutter-app | `feature/interview-validation-fixes` | cfa0816 | refactor(nutritionalcare): extract the consultation primary button | — | 01/11/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-flutter-app | `feature/interview-validation-fixes` | c379eec | feat(main): pin the consultation button in the history tab | — | 01/11/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-flutter-app | `feature/interview-validation-fixes` | a725a85 | test(main): expect the consultation button in the history tab | — | 01/11/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-flutter-app | `feature/interview-validation-fixes` | fc49cc0 | chore(release): bump version to 1.2.0 | — | 01/11/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-flutter-app | `develop` | c995877 | Merge pull request #17 from upc-pre-202620-1acc0238-13981-nutrisync/feature/interview-validation-fixes | Feature/interview validation fixes | 02/11/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-flutter-app | `main` | 8b7b3a3 | Merge pull request #18 from upc-pre-202620-1acc0238-13981-nutrisync/develop | Release/1.2.0 | 02/11/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-flutter-app | `feature/close-referral` | 1601655 | feat(l10n): add localization strings for closing referrals in patient record | — | 02/11/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-flutter-app | `feature/close-referral` | 1b4cd82 | feat(monitoring): implement referral closure use case, remote service and repository | — | 02/11/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-flutter-app | `feature/close-referral` | 24f03d3 | feat(main): add referral closure flow, confirmation dialog and state handling | — | 02/11/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-flutter-app | `feature/close-referral` | 5a4d84e | test(monitoring): add tests and fakes for referral closure in history and agenda | — | 02/11/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-flutter-app | `feature/close-referral` | 8fae952 | chore(release): bump version to 1.3.0 | — | 02/11/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-flutter-app | `develop` | 385152d | Merge pull request #19 from upc-pre-202620-1acc0238-13981-nutrisync/feature/close-referral | Feature/close referral | 02/11/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-flutter-app | `main` | 2dd585c | Merge pull request #20 from upc-pre-202620-1acc0238-13981-nutrisync/develop | Release/1.3.0 | 02/11/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-flutter-app | `fix/consultation-tests` | e61004d | chore: update last saved time at | — | 03/11/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-flutter-app | `fix/consultation-tests` | a07e8ef | chore: update referral summary for derivation | — | 03/11/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-flutter-app | `fix/consultation-tests` | daa8b44 | chore: bump version to 1.3.1 | — | 03/11/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-flutter-app | `develop` | 3503d02 | Merge pull request #21 from upc-pre-202620-1acc0238-13981-nutrisync/fix/consultation-tests | Fix/consultation tests | 03/11/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-flutter-app | `main` | 7095d40 | Merge pull request #22 from upc-pre-202620-1acc0238-13981-nutrisync/develop | Release/1.3.1 | 03/11/2026 |

#### 4.2.2.5. Testing Suite Evidence for Sprint Review

El Sprint 2 tiene tres suites automatizadas: la del backend, la de la app Android y la de la app Flutter. Como en el Sprint 1, los criterios de aceptación están en Gherkin en la sección 2.4.1 y los escenarios se automatizaron como pruebas cuyo nombre describe el comportamiento; no se generaron archivos `.feature`. El landing page se revisó a mano en el navegador, en español e inglés.

**Web Services (backend)**

La suite está en `Healthify.Platform.Tests`, dentro de https://github.com/upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform, con xUnit y NSubstitute. En el sprint se agregaron siete clases de prueba y se eliminaron tres que cubrían los endpoints retirados (`LegacyAssessmentContractTests`, `LooseClinicalEndpointsDeprecationTests` y `StandaloneCodedDiagnosisTests`). Entre `v1.0.0` y `v1.6.0` los métodos `[Fact]` y `[Theory]` pasaron de 886 a 936, y los casos `[InlineData]`, de 375 a 394.

El repositorio del backend no tiene un flujo de CI que corra las pruebas, así que el equipo ejecutó `dotnet test healthify-platform.sln` sobre `main` (v1.6.0). El resultado fue de **1472 pruebas: 1436 superadas, 0 con error y 36 omitidas**. Las 36 omitidas son las pruebas de integración contra MySQL, que solo corren cuando está definida la variable `HEALTHIFY_IT_MYSQL`.

<p class="caption"><strong>Tabla 268</strong><br><em>Clases de prueba agregadas al backend en el Sprint 2</em></p>

| Historia | Clase de prueba (métodos) | Comportamientos verificados |
|---|---|---|
| TS01 | `PasswordResetTests` (16) | La respuesta a la solicitud es la misma exista o no la cuenta, una nueva solicitud reemplaza el código anterior, cinco códigos incorrectos inutilizan el código, el token sirve una sola vez y cambiar la contraseña cierra todas las sesiones. |
| TS05 | `PlanFitTests` (9) | Un alimento que choca con una restricción del plan se sugiere como fuera del plan, una porción se sugiere fuera del plan solo si supera con claridad lo que queda del día, sin la fecha no se juzga la energía y sin plan publicado no hay sugerencia. |
| TS05 | `DailyIntakeTests` (7) | Solo cuentan las entradas confirmadas, lo restante nunca baja de cero, sin plan publicado no hay con qué comparar y otro paciente no puede leer el día. |
| TS05 | `MealIdeasCatalogVocabularyTests` (5) | Las ideas de comida y el reconocimiento de fotos usan nombres del catálogo y resuelven las alternativas del modelo. |
| TS07 | `PatientDataExportTests` (13) | El ZIP trae seis CSV con encabezados en el idioma del paciente, sin diagnóstico, fundamento, base de cálculo ni IMC; los campos se escapan según RFC 4180, un texto con forma de fórmula se neutraliza y solo el propio paciente puede descargarlo. |
| US14 | `ClinicalDayEvaluationTests` (7) | Una noche en Lima sigue siendo ese día aunque en UTC ya cambió la fecha, las metas publicadas en la noche evalúan las comidas de esa misma noche, y la reparación solo reevalúa los días con registro y no cambia nada si se ejecuta dos veces. |
| US14 | `DiaryRangeMySqlTests` (MySQL) | El diario de un rango de días se lee con el reloj declarado por el paciente. |

Commits de pruebas del backend en el Sprint 2:

<p class="caption"><strong>Tabla 269</strong><br><em>Commits de pruebas del backend en el Sprint 2</em></p>

| Repository | Branch | Commit Id | Commit Message | Commit Message Body | Committed on |
|---|---|---|---|---|---|
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/data-export-and-clinical-day` | 42c6057 | test(read-models): add patient data export tests | — | 17/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/data-export-and-clinical-day` | e0f967f | test(intake): add diary range tests | — | 17/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/data-export-and-clinical-day` | 5c2b447 | test(monitoring): add clinical day evaluation tests | — | 19/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/data-export-and-clinical-day` | c02dfdb | test(intake): add catalog vocabulary and alternative resolution tests | — | 20/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/gemini-thinking-level-fix` | 1a064e2 | test(shared): cover the Gemini thinking level | — | 26/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/password-recovery` | 80f0212 | test(iam): add password reset tests | — | 28/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/plan-fit-suggestion` | 9ab616a | test(intake): add plan fit tests | — | 28/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/daily-intake` | f2ff207 | test(intake): add daily intake tests | — | 29/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `refactor/retire-legacy-clinical-endpoints` | 4c89ec7 | test(care): remove deprecated clinical assessment and diagnosis contract tests | — | 29/10/2026 |

**Mobile Application (Android)**

La suite está en `app/src/test` de https://github.com/upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app, con JUnit 4, MockK, Turbine y `kotlinx-coroutines-test`. Desde el pull request #25, el flujo `CI` ejecuta `./gradlew lintDebug testDebugUnitTest assembleDebug` en cada pull request a `develop` y `main`, y sus ejecuciones de las versiones 1.8.0 a 2.1.0 terminaron en verde (sección 4.2.2.8). La suite pasó de 567 pruebas en 63 clases (Sprint 1) a 652 pruebas en 71 clases.

<p class="caption"><strong>Tabla 270</strong><br><em>Clases de prueba agregadas a la aplicación Android en el Sprint 2</em></p>

| Historia | Clase de prueba (pruebas) | Comportamientos verificados |
|---|---|---|
| US29 | `ForgotPasswordViewModelTest` (16) | Un correo mal escrito no se envía, sin conexión no se llama al backend, el reenvío espera la cuenta regresiva, un código incompleto no llega al backend y volver desde la nueva contraseña descarta el token. |
| US14 | `DailyIntakeMapperTest` (2), `PatientHomeUiStateTest` (7), `LoggedWeekTest` (3) | El medidor lee la ingesta del día, la banda de tolerancia decide el aviso de meta superada y la semana marca los días con registro. |
| US18 | `DataExportRepositoryImplTest` (4) | El ZIP se escribe byte a byte en el documento elegido, la copia de otro paciente se rechaza sin escribir nada y el nombre sugerido lleva la fecha. |
| US19 | `CloseReferralTest` (6) | Cerrar una derivación llama al endpoint de esa derivación, una derivación ya cerrada cuenta como cerrada y los códigos `404` y `409` se traducen a errores de dominio. |
| US43 | `ConsultationRemindersTest` (5) | Cada consulta se avisa un día y una hora antes, los avisos que ya pasaron se omiten y sin conexión se conservan los avisos programados. |
| — | `PatientShellViewModelTest` (3) | El menú lateral empieza cerrado y muestra al usuario de la sesión, y entrar al shell reprograma los avisos de consulta. |

Además se ampliaron clases existentes: `SignUpViewModelTest` (aceptación de términos), `ManualMealViewModelTest` y `MealPhotoViewModelTest` (sugerencia de plan) y `PatientHomeViewModelTest` (medidor y semana).

<p class="caption"><strong>Tabla 271</strong><br><em>Commits de pruebas de la aplicación Android en el Sprint 2</em></p>

| Repository | Branch | Commit Id | Commit Message | Commit Message Body | Committed on |
|---|---|---|---|---|---|
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `feature/password-recovery` | c305b62 | test(iam): add password reset operations to the fake authentication repository | — | 28/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `feature/plan-fit-suggestion` | add4308 | test(intake): add test fakes and unit tests for plan fit suggestions and flow | — | 29/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `feature/sign-up-terms-acceptance` | ecbd3d3 | test(iam): cover the sign-up terms | — | 30/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `feature/interview-validation-fixes` | 522a401 | test(home): cover the tolerance band of the energy goal | — | 31/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app | `feature/close-referral` | 610fea2 | test(monitoring): add unit tests and fakes for referral closure handling | — | 02/11/2026 |

**Mobile Application (Flutter)**

La suite está en `test/` de https://github.com/upc-pre-202620-1acc0238-13981-nutrisync/healthify-flutter-app, con `flutter_test`, `bloc_test` y `mocktail`, en 69 archivos. Cubre objetos de valor y casos de uso, repositorios y mappers, cubits y pantallas (*widget tests*). El flujo `CI` ejecuta `flutter analyze`, `flutter test --coverage` y `flutter build apk --debug` en cada pull request. Las ejecuciones de los pull requests #1 a #14 terminaron en verde. Entre los pull requests #15 y #20 una prueba falló: el resumen de la ejecución del pull request #20 (`Release/1.3.0`) reporta **990 pruebas superadas y 1 fallida**. El flujo de distribución no depende del CI, por lo que las versiones 1.1.0 a 1.3.0 se publicaron igual. La prueba fallaba porque la pantalla del paciente cambió el texto de la derivación y la hora del último guardado; el pull request #21 (`fix/consultation-tests`) actualizó la prueba y sus fakes, y desde ese pull request y el #22 (`Release/1.3.1`) el CI vuelve a terminar en verde. Con `flutter test` sobre la versión 1.3.1 pasan las **991 pruebas**, sin fallas.

<p class="caption"><strong>Tabla 272</strong><br><em>Pruebas por módulo de la aplicación Flutter</em></p>

| Módulo | Casos declarados | Archivos | Historias relacionadas |
|---|:---:|:---:|---|
| core | 82 | 14 | Transversal: red, renovación de sesión, textos y componentes |
| iam | 71 | 8 | US28, US29 |
| carerelationship | 66 | 5 | US04, US05, US06 |
| nutritionalcare | 362 | 21 | US17, US20 a US22, US25 a US27 |
| monitoring | 116 | 9 | US16, US19, US39, US43 |
| main | 70 | 4 | US19, US20, US30, US43 |
| foodcatalog | 32 | 5 | US44 |
| navigation | 61 | 2 | Transversal: rutas y shell |
| ux | 9 | 1 | Transversal: diseño adaptable y accesibilidad |
| **Total** | **869** | **69** | |

Los casos declarados son las llamadas a `test`, `testWidgets` y `blocTest` del código; el CI reporta 991 porque algunas pruebas se generan en bucles.

<p class="caption"><strong>Tabla 273</strong><br><em>Comportamientos verificados por módulo de la aplicación Flutter</em></p>

| Módulo | Archivos de prueba | Comportamientos verificados |
|---|---|---|
| core | `api_client_test`, `authenticated_client_test`, `token_refresh_coordinator_test`, `problem_details_mapper_test` | Varias renovaciones simultáneas llaman al backend una sola vez, una renovación rechazada borra los tokens y avisa la sesión vencida, y el código de Problem Details se lee aunque venga anidado. |
| iam | `sign_in_cubit_test`, `sign_up_cubit_test`, `forgot_password_cubit_test`, `terms_acceptance_test` | El enlace abre los términos sin marcar la casilla y el resto de la fila la marca; en la recuperación, un código que no tiene seis dígitos no gasta un intento. |
| carerelationship | `patient_roster_cubit_test`, `invite_patient_cubit_test`, `discharge_patient_cubit_test` | La cartera conserva la lista al perder la conexión, la invitación dura 24 horas con cuenta regresiva y el alta exige un motivo clínico y una confirmación. |
| nutritionalcare | `measurement_step_cubit_test`, `diagnosis_step_cubit_test`, `targets_step_cubit_test`, `publication_step_cubit_test`, `review_inbox_cubit_test`, `adjust_proposal_cubit_test` | Las metas se calculan con los parámetros por defecto, sin diagnóstico el paso de metas vuelve al anterior, y una propuesta de ajuste ya decidida o aún en generación no se puede ajustar. |
| monitoring | `practitioner_agenda_cubit_test`, `schedule_follow_up_cubit_test`, `record_referral_cubit_test`, `consultation_reminder_use_cases_test` | Una fecha que ya pasó se rechaza en el teléfono, la derivación exige especialidad y motivo, y cada consulta se recuerda un día y una hora antes. |
| main | `patient_history_cubit_test`, `practitioner_patient_screen_test`, `patient_record_sections_test` | La pestaña Historia lee juntos los datos base, la consulta abierta y el expediente, muestra el botón de consulta y permite cerrar una derivación abierta. |
| foodcatalog | `food_catalog_cubit_test`, `add_local_food_cubit_test`, `food_catalog_screens_test` | La búsqueda espera una pausa al escribir, un formulario vacío marca todos los campos y un nombre duplicado se señala en su campo. |

<p class="caption"><strong>Tabla 274</strong><br><em>Commits de pruebas de la aplicación Flutter en el Sprint 2</em></p>

| Repository | Branch | Commit Id | Commit Message | Commit Message Body | Committed on |
|---|---|---|---|---|---|
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-flutter-app | `feature/auth-onboarding` | 8a8b0e3 | test(iam): cover auth screens layout | — | 30/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-flutter-app | `feature/patient-care-links` | e7a17dc | test(carerelationship): cover screens layout | — | 30/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-flutter-app | `feature/inbox-agenda-release` | 78cd878 | test(navigation): add app wiring and adaptive layout tests | — | 30/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-flutter-app | `feature/food-catalog-and-terms` | 4b69d13 | test(foodcatalog): add fakes and domain tests | — | 30/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-flutter-app | `feature/food-catalog-and-terms` | 36146d6 | test(foodcatalog): cover the repository | — | 30/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-flutter-app | `feature/food-catalog-and-terms` | 386de6e | test(foodcatalog): cover the cubits | — | 30/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-flutter-app | `feature/food-catalog-and-terms` | 56ac804 | test(foodcatalog): cover the screens | — | 30/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-flutter-app | `feature/food-catalog-and-terms` | c59cfca | test(navigation): cover the food catalog flow | — | 30/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-flutter-app | `feature/food-catalog-and-terms` | 077442d | test(iam): cover the sign-up terms | — | 30/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-flutter-app | `feature/food-catalog-and-terms` | 11c7c07 | test(iam): cover the terms acceptance row | — | 30/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-flutter-app | `feature/interview-validation-fixes` | a725a85 | test(main): expect the consultation button in the history tab | — | 01/11/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-flutter-app | `feature/close-referral` | 5a4d84e | test(monitoring): add tests and fakes for referral closure in history and agenda | — | 02/11/2026 |

#### 4.2.2.6. Execution Evidence for Sprint Review

En el Sprint 2 se publicó el landing page V10, se desplegaron las versiones 1.1.0 a 1.6.0 del backend, la app Android llegó a la versión 2.1.0 y la app Flutter del nutricionista, a la 1.3.1. Las dos apps se distribuyen firmadas por Firebase App Distribution y como APK en los releases de GitHub. El landing page está en https://landing.healthify.lat y la documentación del backend en https://platform.healthify.lat/swagger.

**Landing Page**

Hero V10 con capturas reales de la app y los botones de descarga «Nutricionista» (app Flutter) y «Paciente» (app nativa), cada uno con su invitación de Firebase App Distribution (US36).

<p class="caption"><strong>Figura 187</strong><br><em>Captura del landing page V10: hero</em></p>

![Hero V10](../assets/img/chapter4/sprint2/landing-v10-hero.png)

En pantallas anchas, el botón «Descargar» del header abre un panel con las dos apps; se cierra con Escape, al elegir una opción o al hacer clic fuera (US36).

<p class="caption"><strong>Figura 188</strong><br><em>Captura del landing page V10: panel de descarga del header</em></p>

![Panel de descarga del header](../assets/img/chapter4/sprint2/landing-v10-download-menu.png)

La segunda y la tercera diapositiva del hero muestran los videos del equipo y del producto, con la miniatura de YouTube como póster (US32).

<p class="caption"><strong>Figura 189</strong><br><em>Captura del landing page V10: video del producto en el hero</em></p>

![Video del producto en el hero](../assets/img/chapter4/sprint2/landing-v10-video.png)

La consulta paso a paso, con las cuatro pantallas de la consulta guiada.

<p class="caption"><strong>Figura 190</strong><br><em>Captura del landing page V10: la consulta paso a paso</em></p>

![La consulta paso a paso](../assets/img/chapter4/sprint2/landing-v10-steps.png)

Prueba social con un testimonio de nutricionista y uno de paciente, que aparecen como mensajes al llegar a la sección (US32). Los dos textos son un borrador pendiente de confirmar con sus autoras, como indica el README del repositorio.

<p class="caption"><strong>Figura 191</strong><br><em>Captura del landing page V10: testimonios</em></p>

![Testimonios](../assets/img/chapter4/sprint2/landing-v10-testimonials.png)

Cierre para nutricionistas con los tres pasos para empezar y el enlace de descarga de la app Flutter en Firebase App Distribution (US36).

<p class="caption"><strong>Figura 192</strong><br><em>Captura del landing page V10: descarga y footer</em></p>

![Descarga y footer](../assets/img/chapter4/sprint2/landing-v10-download.png)

Contacto con el selector de caso y el resumen de errores al enviar el formulario vacío; cada error enlaza a su campo.

<p class="caption"><strong>Figura 193</strong><br><em>Captura del landing page V10: resumen de errores del contacto</em></p>

![Resumen de errores del contacto](../assets/img/chapter4/sprint2/landing-v10-contact-errors.png)

**Mobile Application (Android, paciente)**

Las capturas corresponden a la app 2.1.0 en un emulador Android, con la sesión de un paciente vinculado a su nutricionista y conectada al backend publicado.

<p class="caption"><strong>Figura 194</strong><br><em>Capturas de la aplicación Android del paciente en el Sprint 2</em></p>

<table>
  <tr>
    <td align="center"><img src="../assets/img/chapter4/sprint2/app-patient-home.png" alt="Inicio" width="190" /></td>
    <td align="center"><img src="../assets/img/chapter4/sprint2/app-patient-menu.png" alt="Menú lateral" width="190" /></td>
    <td align="center"><img src="../assets/img/chapter4/sprint2/app-patient-plan-fit.png" alt="Sugerencia de plan" width="190" /></td>
    <td align="center"><img src="../assets/img/chapter4/sprint2/app-patient-weight.png" alt="Peso" width="190" /></td>
  </tr>
  <tr>
    <td valign="top"><strong>Inicio.</strong> Medidor con la energía que queda del día, macronutrientes y la semana con los días registrados (US14).</td>
    <td valign="top"><strong>Menú lateral.</strong> Mi plan, Mis consultas, Pendientes, Ajustes y Cerrar sesión; la barra inferior deja el centro al botón de registrar.</td>
    <td valign="top"><strong>Sugerencia de plan.</strong> Al elegir un alimento y su porción, la app preselecciona «Sí» o «No» con la etiqueta «Sugerencia con IA» y el paciente puede cambiarla (US11).</td>
    <td valign="top"><strong>Peso.</strong> Promedio móvil de los autopesajes que siguieron el protocolo, con la explicación de los que no entran en la línea (ajuste de las entrevistas).</td>
  </tr>
  <tr>
    <td align="center"><img src="../assets/img/chapter4/sprint2/app-patient-record.png" alt="Mi expediente" width="190" /></td>
    <td align="center"><img src="../assets/img/chapter4/sprint2/app-patient-settings.png" alt="Ajustes" width="190" /></td>
    <td align="center"><img src="../assets/img/chapter4/sprint2/app-patient-export-save.png" alt="Guardar el ZIP" width="190" /></td>
    <td align="center"><img src="../assets/img/chapter4/sprint2/app-patient-export-done.png" alt="Copia guardada" width="190" /></td>
  </tr>
  <tr>
    <td valign="top"><strong>Mi expediente.</strong> Nutricionista vinculado, próxima consulta, números clave, plan y derivaciones (US18).</td>
    <td valign="top"><strong>Ajustes.</strong> Incluye «Descargar una copia de mis datos» con diario, autopesajes, metas y consultas en CSV (US18).</td>
    <td valign="top"><strong>Guardar el ZIP.</strong> El selector de Android propone el nombre `healthify-mis-datos-<fecha>` (US18).</td>
    <td valign="top"><strong>Copia guardada.</strong> Confirmación de que el ZIP se guardó y se puede abrir con Excel (US18).</td>
  </tr>
</table>

**Mobile Application (Flutter, nutricionista)**

Las capturas corresponden a la app Flutter 1.3.0 en el mismo emulador, con la sesión de una nutricionista que tiene tres pacientes vinculados. La franja de la esquina superior derecha es el aviso `DEBUG` de Flutter, porque se ejecutó la build de depuración.

<p class="caption"><strong>Figura 195</strong><br><em>Capturas de la aplicación Flutter del nutricionista en el Sprint 2</em></p>

<table>
  <tr>
    <td align="center"><img src="../assets/img/chapter4/sprint2/flutter-roster.png" alt="Mis pacientes" width="190" /></td>
    <td align="center"><img src="../assets/img/chapter4/sprint2/flutter-invite-qr.png" alt="Invitar paciente" width="190" /></td>
    <td align="center"><img src="../assets/img/chapter4/sprint2/flutter-patient-summary.png" alt="Resumen del paciente" width="190" /></td>
    <td align="center"><img src="../assets/img/chapter4/sprint2/flutter-patient-follow-up.png" alt="Seguimiento" width="190" /></td>
  </tr>
  <tr>
    <td valign="top"><strong>Mis pacientes.</strong> Cartera agrupada en «Requieren acción» y «Al día», con búsqueda (US05).</td>
    <td valign="top"><strong>Invitar paciente.</strong> Código QR de un solo uso con vencimiento de 24 horas (US04).</td>
    <td valign="top"><strong>Resumen.</strong> Versión del plan, consulta en curso, próxima consulta, datos base y cambios desde la última consulta (US20).</td>
    <td valign="top"><strong>Seguimiento.</strong> Semana registrada, tendencia de peso y resumen generado con IA para revisar antes de la consulta (US16).</td>
  </tr>
  <tr>
    <td align="center"><img src="../assets/img/chapter4/sprint2/flutter-patient-history.png" alt="Historia" width="190" /></td>
    <td align="center"><img src="../assets/img/chapter4/sprint2/flutter-referral-closed.png" alt="Derivación cerrada" width="190" /></td>
    <td align="center"><img src="../assets/img/chapter4/sprint2/flutter-patient-plan.png" alt="Plan" width="190" /></td>
    <td align="center"><img src="../assets/img/chapter4/sprint2/flutter-consultation-measurement.png" alt="Consulta de hoy" width="190" /></td>
  </tr>
  <tr>
    <td valign="top"><strong>Historia.</strong> Peso clínico, IMC, metas, diagnóstico activo, derivaciones y el botón «Continuar consulta» fijo (US20, US19).</td>
    <td valign="top"><strong>Derivación cerrada.</strong> Detalle de una derivación a Endocrinología registrada y cerrada el 03/11/2026 (US19).</td>
    <td valign="top"><strong>Plan.</strong> Metas vigentes, indicaciones, restricciones e historial de versiones, con «Ajustar plan» (US26, US27).</td>
    <td valign="top"><strong>Consulta de hoy.</strong> Paso 1 de 4 con la respuesta previa del paciente, los datos base y las medidas; el ícono de papelera descarta la consulta (US21).</td>
  </tr>
  <tr>
    <td align="center"><img src="../assets/img/chapter4/sprint2/flutter-review-inbox.png" alt="Bandeja" width="190" /></td>
    <td align="center"><img src="../assets/img/chapter4/sprint2/flutter-agenda.png" alt="Agenda" width="190" /></td>
    <td align="center"><img src="../assets/img/chapter4/sprint2/flutter-food-catalog.png" alt="Catálogo" width="190" /></td>
    <td align="center"><img src="../assets/img/chapter4/sprint2/flutter-local-food.png" alt="Alimento local" width="190" /></td>
  </tr>
  <tr>
    <td valign="top"><strong>Bandeja.</strong> Estado vacío cuando no hay señales pendientes de revisar (US17).</td>
    <td valign="top"><strong>Agenda.</strong> Próximas consultas y botón «Agendar consulta» (US39).</td>
    <td valign="top"><strong>Catálogo.</strong> Búsqueda en el catálogo de alimentos con «Agregar alimento local» (US44).</td>
    <td valign="top"><strong>Alimento local.</strong> Formulario de un plato peruano con sus valores por 100 g (US44).</td>
  </tr>
</table>

El menú lateral del nutricionista (catálogo de alimentos, ajustes y cierre de sesión) y los ajustes (cuenta, idioma y cierre de sesión) se guardaron también en `assets/img/chapter4/sprint2/flutter-menu.png` y `flutter-settings.png`.

**Web Services**

Las capturas de Swagger de los endpoints nuevos están en la sección 4.2.2.7.

**URL del video de demostración del Sprint 2:** [Video del Sprint 2](https://upcedupe-my.sharepoint.com/:v:/g/personal/u202417857_upc_edu_pe/IQCUgAx_44DgQpfIo2DdkNwcAWJ_wxQazuZH4d0smNnv8MQ?nav=eyJyZWZlcnJhbEluZm8iOnsicmVmZXJyYWxBcHAiOiJPbmVEcml2ZUZvckJ1c2luZXNzIiwicmVmZXJyYWxBcHBQbGF0Zm9ybSI6IldlYiIsInJlZmVycmFsTW9kZSI6InZpZXciLCJyZWZlcnJhbFZpZXciOiJNeUZpbGVzTGlua0NvcHkifX0&e=UdYnb0)

#### 4.2.2.7. Services Documentation Evidence for Sprint Review

En el Sprint 2 se documentaron seis operaciones nuevas y se retiraron las ocho que el Sprint 1 había marcado como obsoletas. El documento OpenAPI de la versión 1.6.0 describe **98 operaciones en 92 rutas**, con 159 esquemas. Las convenciones son las del Sprint 1 (sección 4.2.1.7): ruta base `/api/v1`, token Bearer salvo en las operaciones anónimas, errores como `application/problem+json` con un código estable en `extensions.code` y límite de solicitudes con `429`.

<p class="caption"><strong>Tabla 275</strong><br><em>Recursos de documentación de los servicios en el Sprint 2</em></p>

| Recurso | Enlace |
|---|---|
| Swagger UI | https://platform.healthify.lat/swagger |
| Documento OpenAPI | https://platform.healthify.lat/swagger/v1/swagger.json |
| Repositorio de Web Services | https://github.com/upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform |

<p class="caption"><strong>Tabla 276</strong><br><em>Operaciones agregadas en el Sprint 2</em></p>

| Método | Ruta | Descripción en Swagger | Acceso | Parámetros | Respuestas | Historia |
|---|---|---|---|---|---|---|
| `POST` | `/api/v1/authentication/password-reset-requests` | Ask for a password reset code | Anónimo | Cuerpo: `email` | 202 · 429 | TS01 |
| `POST` | `/api/v1/authentication/password-reset-verifications` | Verify the emailed code | Anónimo | Cuerpo: `email`, `code` | 200 · 400 · 429 · 500 | TS01 |
| `POST` | `/api/v1/authentication/password-resets` | Set a new password with the reset token | Anónimo | Cuerpo: `resetToken`, `newPassword` | 204 · 400 · 429 · 500 | TS01 |
| `GET` | `/api/v1/patients/{patientId}/plan-fit` | Suggest whether a food is in the patient's plan | Patient | Ruta: `patientId`; query: `referenceFoodId`, `grams`, `date` | 200 · 400 · 401 · 403 · 404 · 422 | TS05 |
| `GET` | `/api/v1/patients/{patientId}/daily-intake` | Get what the patient logged today | Patient | Ruta: `patientId`; query: `date` | 200 · 400 · 401 · 403 · 404 | TS05 |
| `GET` | `/api/v1/patients/{patientId}/data-export` | Download a copy of the patient's own data | Patient (solo el propio) | Ruta: `patientId` | 200 (`application/zip`) · 401 · 403 | TS07 |

Las apps también empezaron a usar `POST /api/v1/referrals/{referralId}/closure` (Close a referral), que existía desde el Sprint 1 y responde `200`, `404` si la derivación no existe y `409` si ya estaba cerrada.

<p class="caption"><strong>Tabla 277</strong><br><em>Operaciones retiradas en el Sprint 2</em></p>

| Método | Ruta | Reemplazo |
|---|---|---|
| `POST` | `/api/v1/nutrition-plans/target-proposals` | Paso de metas de la consulta guiada |
| `POST` | `/api/v1/nutrition-plans/{planId}/prescribed-targets` | Paso de metas de la consulta guiada |
| `POST` | `/api/v1/nutrition-plans/{planId}/publication` | `POST /api/v1/consultations/{id}/publication` |
| `POST` | `/api/v1/nutritional-assessments` | Paso de medición de la consulta guiada |
| `POST` | `/api/v1/nutritional-assessments/{assessmentId}/clinical-measurements` | Paso de medición de la consulta guiada |
| `POST` | `/api/v1/nutritional-assessments/{assessmentId}/closure` | Paso de medición de la consulta guiada |
| `POST` | `/api/v1/nutritional-diagnoses` | Paso de diagnóstico de la consulta guiada |
| `POST` | `/api/v1/diary-entries/off-plan-logs` | Registro con indicación de adherencia (US11) |

**Ejemplos de uso**

Los valores son datos de muestra; los campos y tipos provienen del documento OpenAPI publicado.

*1. Pedir el código de restablecimiento: `POST /api/v1/authentication/password-reset-requests` (anónimo)*

```json
{ "email": "camila.rojas@ejemplo.com" }
```

Respuesta `202 Accepted`, sin cuerpo. El servicio envía un código de seis dígitos al correo, en el idioma de la cuenta. La respuesta es la misma si el correo no tiene cuenta, de modo que no sirve para averiguar quién está registrado, y una segunda solicitud dentro del mismo minuto no envía otro correo.

*2. Verificar el código: `POST /api/v1/authentication/password-reset-verifications` (anónimo)*

```json
{ "email": "camila.rojas@ejemplo.com", "code": "482913" }
```

Respuesta `200 OK`. El código correcto se canjea por un token que fija la contraseña una sola vez y vence en pocos minutos. Cinco códigos incorrectos inutilizan el código y hay que pedir otro.

```json
{ "resetToken": "pRt7c2...", "expiresAt": "2026-10-28T15:12:00Z" }
```

*3. Fijar la nueva contraseña: `POST /api/v1/authentication/password-resets` (anónimo)*

```json
{ "resetToken": "pRt7c2...", "newPassword": "Nu3vaClave!2026" }
```

Respuesta `204 No Content`. La contraseña sigue las reglas del registro y debe ser distinta de la actual; si se rechaza, el token no se gasta. Al cambiarla se cierran todas las sesiones abiertas de la cuenta y se levanta el bloqueo, si lo había.

<p class="caption"><strong>Figura 196</strong><br><em>Captura de Swagger: operaciones de autenticación con el restablecimiento de contraseña</em></p>

![Swagger: restablecimiento de contraseña](../assets/img/chapter4/sprint2/swagger-password-reset.png)

*4. Pedir la sugerencia de plan: `GET /api/v1/patients/12/plan-fit?referenceFoodId=845&grams=150&date=2026-11-02` (paciente)*

Respuesta `200 OK`. La sugerencia se calcula sin IA: el alimento se revisa contra las restricciones del plan publicado y, si llega la fecha del paciente, su energía se compara con lo que queda del día. `reason` toma los valores `Fits`, `BreaksRestriction` o `ExceedsRemaining`, y la app convierte cada código en su propio texto. Lo que se registra es siempre la respuesta del paciente.

```json
{
  "suggestedAdherence": "InPlan",
  "violatedRestrictions": [],
  "reason": "Fits",
  "energyKcal": 195,
  "remainingKcal": 1550
}
```

<p class="caption"><strong>Figura 197</strong><br><em>Captura de Swagger: operación de sugerencia de plan</em></p>

![Swagger: sugerencia de plan](../assets/img/chapter4/sprint2/swagger-plan-fit.png)

*5. Leer la ingesta del día: `GET /api/v1/patients/12/daily-intake?date=2026-11-02` (paciente)*

Respuesta `200 OK`. Devuelve lo registrado en el día, las metas publicadas y lo que queda de cada una, que nunca baja de cero. Solo cuentan las entradas confirmadas. Es el dato que alimenta el medidor del inicio.

```json
{
  "date": "2026-11-02",
  "energyKcal": 640,
  "proteinG": 38,
  "carbG": 72,
  "fatG": 19,
  "entryCount": 2,
  "planVersion": 3,
  "targetEnergyKcal": 1550,
  "targetProteinG": 135,
  "targetCarbG": 143,
  "targetFatG": 49,
  "remainingEnergyKcal": 910,
  "remainingProteinG": 97,
  "remainingCarbG": 71,
  "remainingFatG": 30
}
```

*6. Descargar mis datos: `GET /api/v1/patients/12/data-export` (paciente)*

Respuesta `200 OK` con un archivo `healthify-mis-datos-2026-11-03.zip`. Trae seis CSV: `perfil.csv`, `diario.csv`, `autopesajes.csv`, `metas.csv`, `consultas.csv` y `vinculos.csv`, en UTF-8 con BOM, separados por comas, escapados según RFC 4180, con fechas ISO 8601 y encabezados en el idioma del paciente. No incluye diagnóstico, fundamento clínico, base de cálculo ni IMC. Si otra cuenta pide la copia de este paciente, el servicio responde `403`.

<p class="caption"><strong>Figura 198</strong><br><em>Captura de Swagger: operación de descarga de datos</em></p>

![Swagger: descarga de datos](../assets/img/chapter4/sprint2/swagger-data-export.png)

Commits relacionados con la documentación de los servicios en el Sprint 2 (endpoints nuevos con su documentación OpenAPI, retiro de los obsoletos y limpieza de los comentarios XML):

<p class="caption"><strong>Tabla 278</strong><br><em>Commits relacionados con la documentación de servicios en el Sprint 2</em></p>

| Repository | Branch | Commit Id | Commit Message | Commit Message Body | Committed on |
|---|---|---|---|---|---|
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/data-export-and-clinical-day` | 957bc0a | feat(read-models): add the patient data export endpoint | — | 16/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/password-recovery` | ac57c0d | feat(iam): add the password reset endpoints | — | 28/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/password-recovery` | fbd4bf5 | docs(readme): document the SMTP settings | — | 28/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/password-reset-verification` | faef8b9 | feat(iam): add the verification endpoint and token-based reset | — | 28/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/plan-fit-suggestion` | aa0d68c | feat(intake): add the plan fit endpoint | — | 28/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `feature/daily-intake` | d448e76 | feat(intake): add the daily intake endpoint | — | 29/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `refactor/retire-legacy-clinical-endpoints` | 8e6fd83 | refactor(care): remove deprecated endpoints from clinical controllers | — | 29/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `refactor/retire-legacy-clinical-endpoints` | 3f2adae | refactor(care): remove nutritional diagnoses controller and legacy resources | — | 29/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `refactor/retire-legacy-clinical-endpoints` | 975a230 | docs(shared): clean up requirement tags and standardize doc comments in shared module | — | 29/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `refactor/retire-legacy-clinical-endpoints` | dd676d1 | docs(iam): clean up requirement references in iam context | — | 29/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `refactor/retire-legacy-clinical-endpoints` | df815b4 | docs(care): clean up requirement tags across care relationship context | — | 29/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `refactor/retire-legacy-clinical-endpoints` | 46e72f5 | docs(catalog): clean up requirement references in food catalog context | — | 29/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `refactor/retire-legacy-clinical-endpoints` | 1fe794a | docs(intake): remove requirement tags and translate doc comments in intake body response | — | 29/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `refactor/retire-legacy-clinical-endpoints` | 8a89115 | docs(monitoring): standardize documentation in monitoring adherence context | — | 29/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `refactor/retire-legacy-clinical-endpoints` | 075f5f8 | docs(care): clean up specification tags in nutritional care context | — | 29/10/2026 |
| upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform | `refactor/retire-legacy-clinical-endpoints` | 711e65f | docs(readmodels): clean up requirement tags and comments in read models | — | 29/10/2026 |

#### 4.2.2.8. Software Deployment Evidence for Sprint Review

Durante el Sprint 2 se republicó el landing page, se desplegaron siete versiones del backend y se automatizó la distribución de las dos apps. La configuración general de cada producto está en la sección 4.1.4; aquí se resumen los pasos del sprint.

**Landing Page**

*Releases.* El rediseño V10 se integró en `develop` con el pull request #9 (`feature/redesign-website`) y se publicó como `v2.0.0` con el pull request #10. Los testimonios y los ajustes del header entraron con el pull request #11 (`feature/testimonials`) y se publicaron como `v2.1.0` con el pull request #12. Al cierre del sprint, el pull request #13 (`feature/dual-app-download`) separó la descarga por rol y enlazó los videos del hero, y el pull request #14 lo publicó como `v2.2.0`.

*GitHub Pages.* El flujo `pages-build-deployment` de GitHub publica `main` en cada push, con el mismo dominio `landing.healthify.lat` del Sprint 1. Todas sus ejecuciones terminaron correctamente. Los botones de descarga apuntan a la invitación pública de Firebase App Distribution de cada app.

*URL de despliegue:* https://landing.healthify.lat

**Web Services (backend)**

*Releases.* Cada pull request de `develop` a `main` (#11, #13, #15, #17, #19, #21 y #23) disparó el flujo `Release`, que compila la solución, lee `<Version>` de `Healthify.Platform.csproj` y publica `v1.1.0`, `v1.1.1`, `v1.2.0`, `v1.3.0`, `v1.4.0`, `v1.5.0` y `v1.6.0`. Las siete ejecuciones terminaron correctamente.

<p class="caption"><strong>Figura 199</strong><br><em>Captura de GitHub Actions: ejecuciones del flujo Release del backend en el Sprint 2</em></p>

![Ejecuciones del flujo Release](../assets/img/chapter4/sprint2/gh-platform-actions.png)

<p class="caption"><strong>Figura 200</strong><br><em>Captura de GitHub: release v1.6.0 del backend</em></p>

![Releases del backend](../assets/img/chapter4/sprint2/gh-platform-releases.png)

*Máquina virtual.* El despliegue en la máquina virtual de Oracle Cloud siguió el procedimiento del Sprint 1, con estos cambios:

1. Agregar al entorno las variables `Smtp__Host`, `Smtp__Username`, `Smtp__Password` y `Smtp__From` para el correo de recuperación de contraseña. Sin `Smtp__Host` no se envía ningún correo.
2. Fijar `Ai:Gemini:ThinkingLevel` en la configuración de producción, que acota el razonamiento del modelo (versión 1.1.1).
3. Actualizar el repositorio a `main` y ejecutar `docker compose up --build -d`. Al iniciar, la API aplica las migraciones nuevas (índice del diario por paciente y fecha, códigos de restablecimiento y verificación) y repara los días que se habían evaluado con la fecha UTC.
4. Comprobar en `/swagger` que el documento lista las seis operaciones nuevas y ya no lista las ocho retiradas.

*URLs de despliegue:*

- API: https://platform.healthify.lat
- Documentación: https://platform.healthify.lat/swagger

**Mobile Application (Android, paciente)**

*Integración continua.* Con el pull request #25 se agregó `ci.yml`, que en cada pull request a `develop` y `main` ejecuta `./gradlew lintDebug testDebugUnitTest assembleDebug` y guarda los reportes como artefacto.

*Firma y distribución.* En el mismo pull request se agregó `distribute.yml`. Con cada push a `main`, el flujo:

1. Decodifica el *upload keystore* y las credenciales de Firebase desde los secretos `KEYSTORE_BASE64`, `KEYSTORE_PASSWORD`, `KEY_ALIAS`, `KEY_PASSWORD`, `FIREBASE_APP_ID` y `FIREBASE_SERVICE_ACCOUNT_JSON`.
2. Compila el APK firmado con `versionCode` igual al número de ejecución, porque cada build distribuida necesita uno mayor que la anterior.
3. Lo sube a Firebase App Distribution para el grupo de testers `qa`, con notas de versión que listan los diez últimos commits.
4. Crea el release en GitHub con el APK adjunto (desde el pull request #27, `feature/github-release`).

El `applicationId` es `pe.edu.upc.healthify` y la versión al cierre del sprint es `2.1.0`. Las ejecuciones de `CI` y `Distribute` de las versiones 1.8.0 a 2.1.0 terminaron en verde, salvo una ejecución cancelada de la rama `feature/sign-up-terms-acceptance`.

<p class="caption"><strong>Figura 201</strong><br><em>Captura de GitHub Actions: flujos CI y Distribute de la aplicación Android</em></p>

![Actions de la aplicación Android](../assets/img/chapter4/sprint2/gh-android-actions.png)

<p class="caption"><strong>Figura 202</strong><br><em>Captura de GitHub: release v2.1.0 de la aplicación Android con el APK</em></p>

![Releases de la aplicación Android](../assets/img/chapter4/sprint2/gh-android-releases.png)

**Mobile Application (Flutter, nutricionista)**

*Repositorio y versiones.* Se creó el repositorio público `healthify-flutter-app` con las ramas `main` y `develop`. Cada módulo se integró en `develop` con un pull request y cada release en `main`: `v0.1.0` a `v0.6.0` durante la construcción y `v1.0.0`, `v1.1.0`, `v1.2.0`, `v1.3.0` y `v1.3.1` como versiones distribuidas.

*Integración continua.* `ci.yml` ejecuta en cada pull request `flutter pub get`, la generación de código, `flutter gen-l10n`, `flutter analyze`, `flutter test --coverage` y `flutter build apk --debug`. Entre los pull requests #15 y #20 la ejecución falló por una prueba (990 superadas, 1 fallida); el pull request #21 la corrigió y la versión 1.3.1 se publicó con el CI en verde y las 991 pruebas superadas.

*Firma y distribución.* `distribute.yml` se ejecuta con cada push a `main`: comprueba que la versión de `pubspec.yaml` sea nueva, compila el APK firmado, lo sube a Firebase App Distribution para el grupo `qa` y crea el release en GitHub con el APK. Usa los mismos nombres de secretos que la app Android. La primera ejecución (`Release/0.6.0`) falló; desde `v1.0.0` todas terminaron correctamente. El `applicationId` es `pe.edu.upc.healthify.practitioner`, distinto del de la app Android, de modo que las dos apps se pueden instalar en el mismo teléfono.

<p class="caption"><strong>Figura 203</strong><br><em>Captura de GitHub Actions: flujos CI y Distribute de la aplicación Flutter</em></p>

![Actions de la aplicación Flutter](../assets/img/chapter4/sprint2/gh-flutter-actions.png)

<p class="caption"><strong>Figura 204</strong><br><em>Captura de GitHub: release v1.3.1 de la aplicación Flutter con el APK</em></p>

![Releases de la aplicación Flutter](../assets/img/chapter4/sprint2/gh-flutter-releases.png)

*Instalación.* Los testers del grupo `qa` reciben la invitación de Firebase App Distribution en su correo; cualquier persona puede descargar el APK desde el release de GitHub. La app Android se instala en Android 7.0 (API 24) o superior.

#### 4.2.2.9. Team Collaboration Insights during Sprint

Los cinco integrantes tienen commits en los cuatro repositorios. En el backend y en la app Android, cada rama de funcionalidad reunió commits de varios integrantes, uno por capa o por pieza, como en el Sprint 1. En la app Flutter, cada integrante escribió solo su módulo en una rama propia el 30/10/2026, y el catálogo, los términos y los ajustes de las entrevistas se repartieron entre los cinco. La integración a `develop` y `main` la hizo Nevatrix en los cuatro repositorios.

<p class="caption"><strong>Tabla 279</strong><br><em>Commits por integrante en el Sprint 2 (sin merges)</em></p>

| Integrante | GitHub Username | Landing Page | Backend | Android | Flutter | Total |
|---|---|:---:|:---:|:---:|:---:|:---:|
| Del Aguila Del Aguila, Olenka Priscilla | olenkisha14 | 8 | 15 | 25 | 23 | 71 |
| Espinoza Cruz, Angela Milagros | Emy127 | 3 | 15 | 24 | 24 | 66 |
| Mora Rivera, Joel Fernando | xJoelFMRx | 3 | 15 | 25 | 23 | 66 |
| Vergaray Calderon, Rose Almendra | rosealmendra | 3 | 16 | 23 | 23 | 65 |
| Villarreal Bazan, Angel Martin | Nevatrix | 10 | 17 | 29 | 34 | 90 |
| **Total** | | **27** | **78** | **126** | **127** | **358** |

Los gráficos de GitHub cuentan los commits que llegaron a `main` entre el 10/10/2026 y el 04/11/2026, sin merges. En el backend la mayor actividad fue la semana del 26/10, con la recuperación de contraseña, la sugerencia de plan, la ingesta del día y el retiro de los endpoints obsoletos. En la app Android, el trabajo se repartió entre las semanas del 19/10 y del 26/10. En la app Flutter casi todos los commits caen en la semana del 26/10, porque el núcleo, los módulos y la primera versión se integraron el 30/10.

Backend (`healthify-platform`):

<p class="caption"><strong>Figura 205</strong><br><em>Captura de GitHub: contribuyentes del backend en el Sprint 2</em></p>

![Contribuyentes del backend](../assets/img/chapter4/sprint2/gh-platform-contributors.png)

Landing page (`healthify-website`):

<p class="caption"><strong>Figura 206</strong><br><em>Captura de GitHub: contribuyentes del landing page en el Sprint 2</em></p>

![Contribuyentes del landing page](../assets/img/chapter4/sprint2/gh-website-contributors.png)

Aplicación Android (`healthify-android-app`):

<p class="caption"><strong>Figura 207</strong><br><em>Captura de GitHub: contribuyentes de la aplicación Android en el Sprint 2</em></p>

![Contribuyentes de la aplicación Android](../assets/img/chapter4/sprint2/gh-android-contributors.png)

Aplicación Flutter (`healthify-flutter-app`):

<p class="caption"><strong>Figura 208</strong><br><em>Captura de GitHub: contribuyentes de la aplicación Flutter en el Sprint 2</em></p>

![Contribuyentes de la aplicación Flutter](../assets/img/chapter4/sprint2/gh-flutter-contributors.png)

<div style="page-break-after: always"></div>

## 4.3. Validation Interviews

### 4.3.1. Diseño de Entrevistas

### 4.3.2. Registro de Entrevistas

### 4.3.3. Evaluaciones según heurísticas

<div style="page-break-after: always"></div>

