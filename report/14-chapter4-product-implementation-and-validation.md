# CAPÍTULO IV: PRODUCT IMPLEMENTATION & VALIDATION

## 4.1. Software Configuration Management

### 4.1.1. Software Development Environment Configuration

La solución de Healthify tiene tres productos digitales: el **landing page** (sitio estático), los **RESTful Web Services** (backend en ASP.NET Core) y la **aplicación móvil nativa de Android** (Kotlin con Jetpack Compose). Las herramientas que el equipo usa para trabajar sobre ellos se agrupan por tipo de actividad.

**Project Management**

<p class="caption"><strong>Tabla 217</strong><br><em>Herramientas de gestión de proyectos</em></p>

| Producto | Tipo | Propósito en el proyecto | Referencia |
|---|---|---|---|
| GitHub (Issues, Pull Requests y Projects) | SaaS | Seguimiento de tareas por rama, revisión de cambios mediante pull requests y tablero del product backlog. | [github.com](https://github.com) |
| WhatsApp | SaaS / móvil | Coordinación diaria del equipo y avisos de reuniones. | [whatsapp.com](https://www.whatsapp.com) |

**Requirements Management**

<p class="caption"><strong>Tabla 218</strong><br><em>Herramientas de gestión de requisitos</em></p>

| Producto | Tipo | Propósito en el proyecto | Referencia |
|---|---|---|---|
| Miro | SaaS | Sesiones de EventStorming (Big Picture y Design Level) y Domain Message Flows. | [miro.com](https://miro.com) |
| PlantUML (con C4-PlantUML) | Línea de comandos / extensión de IDE | Diagramas C4, Bounded Context Canvas, diagramas de clases y de base de datos, versionados como archivos `.puml` en el repositorio del informe. | [plantuml.com](https://plantuml.com) |
| UXPressia | SaaS | User Personas y User Journey Mapping. | [uxpressia.com](https://uxpressia.com) |

**Product UX/UI Design**

<p class="caption"><strong>Tabla 219</strong><br><em>Herramientas de diseño UX/UI del producto</em></p>

| Producto | Tipo | Propósito en el proyecto | Referencia |
|---|---|---|---|
| Figma | SaaS | Sistema de diseño «Healthify M3», wireframes, mock-ups y prototipos del landing page y de la aplicación móvil. El archivo «Healthify» contiene las páginas *Landing Page*, *Wireframes Mobile* y *Mockup*. | [figma.com](https://www.figma.com) |
| draw.io (diagrams.net) | SaaS / escritorio | Wireflows y User Flows de la aplicación móvil. | [app.diagrams.net](https://app.diagrams.net) |

**Software Development**

<p class="caption"><strong>Tabla 220</strong><br><em>Herramientas de desarrollo de software</em></p>

| Producto | Tipo | Propósito en el proyecto | Referencia |
|---|---|---|---|
| Android Studio | Escritorio (IDE) | Desarrollo de la aplicación móvil en Kotlin y Jetpack Compose, emulador y vista previa de pantallas (`@Preview`). | [developer.android.com/studio](https://developer.android.com/studio) |
| JetBrains Rider | Escritorio (IDE) | Desarrollo del backend en C# (.NET 10), migraciones de Entity Framework Core y ejecución de pruebas. | [jetbrains.com/rider](https://www.jetbrains.com/rider/) |
| WebStorm | Escritorio (IDE) | Desarrollo del landing page (HTML, CSS y JavaScript). | [jetbrains.com/webstorm](https://www.jetbrains.com/webstorm/) |
| Visual Studio Code | Escritorio (editor) | Edición del informe en Markdown y de los diagramas PlantUML. | [code.visualstudio.com](https://code.visualstudio.com) |
| .NET SDK 10 | Escritorio | Compilación, ejecución y pruebas del backend. | [dotnet.microsoft.com/download](https://dotnet.microsoft.com/download) |
| JDK 21 y Gradle 9.6 | Escritorio | Compilación de la aplicación Android; el JDK se resuelve por `gradle-daemon-jvm.properties`. | [gradle.org](https://gradle.org) |
| MySQL 8 | Escritorio / contenedor | Base de datos del backend. | [dev.mysql.com/downloads](https://dev.mysql.com/downloads/) |
| Docker Desktop | Escritorio | Ejecución local del backend y de MySQL con `docker compose`. | [docker.com](https://www.docker.com/products/docker-desktop/) |
| Node.js (`npx serve`) | Escritorio | Servidor local para revisar el landing page. | [nodejs.org](https://nodejs.org) |


**Software Testing**

<p class="caption"><strong>Tabla 221</strong><br><em>Herramientas de pruebas de software</em></p>

| Producto | Tipo | Propósito en el proyecto | Referencia |
|---|---|---|---|
| xUnit y NSubstitute | Librerías de .NET | Pruebas unitarias y de integración del backend (`dotnet test`). Las pruebas de integración con MySQL se activan con la variable `HEALTHIFY_IT_MYSQL`. | [xunit.net](https://xunit.net) |
| JUnit 4, MockK, Turbine y `kotlinx-coroutines-test` | Librerías de Kotlin | Pruebas de JVM de los use cases, ViewModels y mappers de la aplicación (`./gradlew :app:testDebugUnitTest`). | [junit.org](https://junit.org/junit4/) |
| Swagger UI (Swashbuckle) | Incluido en el backend | Exploración y prueba manual de los endpoints REST en `/swagger`. | [swagger.io](https://swagger.io) |
| Android Lint | Incluido en Android Gradle Plugin | Análisis estático de la aplicación (`./gradlew :app:lintDebug`). | [developer.android.com/studio/write/lint](https://developer.android.com/studio/write/lint) |

**Software Deployment**

<p class="caption"><strong>Tabla 222</strong><br><em>Herramientas de despliegue de software</em></p>

| Producto | Tipo | Propósito en el proyecto | Referencia |
|---|---|---|---|
| GitHub Pages | SaaS | Publicación del landing page desde la rama `main`, con el dominio propio `landing.healthify.lat`. | [pages.github.com](https://pages.github.com) |
| GitHub Actions | SaaS | Flujo `Release` del backend: compila la solución y crea la versión en GitHub al hacer push a `main`. | [github.com/features/actions](https://github.com/features/actions) |
| Docker y Docker Compose | Motor de contenedores | Empaquetado del backend (`Dockerfile`) y orquestación del API con MySQL (`docker-compose.yml`). | [docs.docker.com](https://docs.docker.com) |
| Oracle Cloud Infrastructure | SaaS / IaaS | Máquina virtual que aloja los contenedores del backend, publicado en `platform.healthify.lat`. | [oracle.com/cloud](https://www.oracle.com/cloud/) |

**Software Documentation**

<p class="caption"><strong>Tabla 223</strong><br><em>Herramientas de documentación de software</em></p>

| Producto | Tipo | Propósito en el proyecto | Referencia |
|---|---|---|---|
| GitHub | SaaS | Repositorio del informe (`healthify-report`) y de los README de cada producto. | [github.com](https://github.com) |
| Markdown | Formato | Redacción del informe y de la documentación de cada repositorio. | [markdownguide.org](https://www.markdownguide.org) |
| Swagger / OpenAPI | Incluido en el backend | Documentación interactiva de los servicios REST. | [swagger.io](https://swagger.io) |

### 4.1.2. Source Code Management

El equipo usa **GitHub** como plataforma de control de versiones, dentro de la organización del curso. Cada producto tiene su propio repositorio.

<p class="caption"><strong>Tabla 224</strong><br><em>Repositorios del proyecto en GitHub</em></p>

| Producto | Repositorio | URL |
|---|---|---|
| Landing Page | `healthify-website` | https://github.com/upc-pre-202620-1acc0238-13981-nutrisync/healthify-website |
| Web Services (backend) | `healthify-platform` | https://github.com/upc-pre-202620-1acc0238-13981-nutrisync/healthify-platform |
| Mobile Application (Android) | `healthify-mobile` | https://github.com/upc-pre-202620-1acc0238-13981-nutrisync/healthify-android-app |
| Informe del proyecto | `healthify-report` | https://github.com/upc-pre-202620-1acc0238-13981-nutrisync/healthify-report |

El repositorio del backend contiene el proyecto `Healthify.Platform` y el proyecto de pruebas `Healthify.Platform.Tests` (unitarias y de integración) en la misma solución. El landing page no tiene dependencias: se compone de cuatro archivos HTML, una hoja de estilos y dos scripts.

**GitFlow**

El equipo aplica GitFlow, según el modelo de Vincent Driessen en «A successful Git branching model». Todos los cambios pasan por un pull request y ninguna rama de trabajo se integra directamente en `main`.

<p class="caption"><strong>Tabla 225</strong><br><em>Ramas de GitFlow y su convención de nombres</em></p>

| Rama | Origen | Destino | Convención de nombre | Uso |
|---|---|---|---|---|
| `main` | — | — | `main` | Código publicado. Cada integración en `main` corresponde a una versión con su tag. |
| `develop` | `main` | — | `develop` | Integración continua de lo que se desarrolla. Es la rama base de los features. |
| Feature | `develop` | `develop` | `feature/<contexto-o-funcionalidad>` en minúsculas y con guiones | Una rama por funcionalidad o bloque de trabajo. |
| Fix | `develop` | `develop` | `fix/<descripcion-corta>` | Corrección de un defecto detectado antes de publicar. |
| Release | `develop` | `main` y `develop` | `release/vX.Y.Z` | Preparación de una versión: ajuste del número de versión y revisión final. |
| Hotfix | `main` | `main` y `develop` | `hotfix/<descripcion-corta>` | Corrección urgente de un error de la versión publicada. |

Ejemplos reales de los repositorios: `feature/platform-foundation`, `feature/identity-and-care-links`, `feature/nutritional-care`, `feature/food-catalog-and-intake`, `feature/monitoring-and-read-models` y `feature/usda-base-url-fix` en el backend; `feature/foundation`, `feature/home-hero-problem`, `feature/home-showcases`, `feature/home-how-faq-terms` y `feature/about-contact` en el landing page; y `feature/chapter2-bounded-context` en el informe.

Flujo de trabajo de una funcionalidad:

1. Se crea `feature/<nombre>` desde `develop`.
2. Se hacen commits pequeños con Conventional Commits.
3. Se abre un pull request hacia `develop`, que otro integrante revisa. Al integrarse, la rama se elimina.
4. Para publicar, se integra `develop` en `main` mediante un pull request y se asigna el tag de la versión.

**Semantic Versioning**

Las versiones usan Semantic Versioning 2.0.0 con el formato `vMAJOR.MINOR.PATCH`:

- **MAJOR**: cambios incompatibles, por ejemplo un cambio en el contrato de la API.
- **MINOR**: funcionalidad nueva compatible con lo anterior.
- **PATCH**: corrección de errores.

<p class="caption"><strong>Tabla 226</strong><br><em>Versionado semántico por producto</em></p>

| Producto | Tags publicados | Dónde se define la versión |
|---|---|---|
| Backend | `v0.1.0`, `v0.5.0` y `v1.0.0` | Elemento `<Version>` de `Healthify.Platform.csproj`. El flujo de GitHub Actions lee ese valor y crea el tag `v<versión>` con las notas de la versión. |
| Landing Page | `v1.0.0` y `v1.0.1` | Tag en `main`. |
| Aplicación móvil | `1.0` | `versionName` y `versionCode` de `app/build.gradle.kts`. |
| Informe | `1.0.0` (AV1) | Registro de versiones del `README.md`. |

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
| `test` | Pruebas | `test(composition): add cross-context test support, AI pipeline and DI composition tests` |
| `refactor` | Cambio interno sin cambio de comportamiento | `refactor(diagrams): remove inline comments from C4 and class diagrams` |
| `chore` | Mantenimiento y configuración | `chore(csproj): set project version to 1.0.0` |
| `build` | Sistema de compilación y dependencias | `build(docker): add Dockerfile and compose stack` |
| `ci` | Integración y entrega continuas | `ci(release): add release workflow` |
| `style` | Formato sin cambio de lógica | Sin uso hasta ahora |

El alcance (`scope`) indica el módulo afectado: un bounded context (`iam`, `care-relationship`, `nutritional-care`, `food-catalog`, `intake`, `monitoring`), una página (`index`, `css`, `i18n`) o un archivo de configuración (`csproj`, `readme`).

### 4.1.3. Source Code Style Guide & Conventions

Para todos los lenguajes, los nombres de paquetes, clases, funciones, variables, archivos y ramas están en **inglés**. Los textos que ve el usuario están en español y en inglés mediante archivos de recursos, no dentro del código. Los criterios de aceptación en Gherkin son la excepción y se redactan en español. Se adoptan las guías estándar de cada lenguaje, y la configuración del equipo se resume en el archivo `README.md` de cada repositorio.

**HTML**

Guías: *HTML Style Guide and Coding Conventions* (W3Schools) y *Google HTML/CSS Style Guide*.

- Etiquetas y atributos en minúsculas, indentación de 2 espacios y `<!DOCTYPE html>` en cada página.
- Estructura semántica: `header`, `nav`, `main`, `section`, `footer`, con un solo `h1` por página y los encabezados en orden.
- Atributos de accesibilidad: `lang`, `alt` en imágenes, `aria-label` y `aria-labelledby` en regiones y controles, y un enlace «Saltar al contenido principal».
- Cada texto traducible lleva un atributo `data-i18n="clave"` y no texto fijo en el código del script.

**CSS**

Guía: *Google HTML/CSS Style Guide*.

- Nomenclatura **BEM** en minúsculas con guiones: bloque `navbar`, elemento `navbar__links`, modificador `btn--primary`.
- Los colores, tipografías, radios y tamaños se definen una sola vez como variables en `:root` (`--color-orange`, `--font-heading`, `--radius`) con los valores del sistema de diseño de Figma, y no se repiten en las reglas.
- Enfoque adaptable con puntos de corte en 1100, 900 y 768 px.

**JavaScript**

Guía: *Google JavaScript Style Guide*.

- `'use strict'`, `const` y `let` (sin `var`), funciones y variables en `camelCase` y constantes en `UPPER_SNAKE_CASE`.
- Un archivo por responsabilidad: `i18n.js` (traducciones y motor de idioma) y `main.js` (menú móvil, preguntas frecuentes, carruseles, formulario).
- Funciones de inicialización con nombre `initXxx()` (`initPageScroll()`, `initShowcases()`).

**C# (backend)**

Guías: *C# Coding Conventions* de Microsoft y la guía de arquitectura del backend del equipo.

- `PascalCase` para clases, métodos y propiedades; `camelCase` para variables y parámetros; `_camelCase` para campos privados; interfaces con prefijo `I`.
- Un espacio de nombres por carpeta, con la forma `Healthify.Platform.<Contexto>.<Capa>` (por ejemplo `Healthify.Platform.Iam.Domain.Model.Aggregates`).
- Organización por bounded context, cada uno con las carpetas `Domain`, `Application`, `Infrastructure`, `Interfaces` y `Resources`. Entre contextos solo se importan las fachadas `Interfaces.Acl` y los eventos `Domain.Model.Events`.
- CQRS con servicios de comandos y de consultas (`CommandServices` y `QueryServices`), y eventos de dominio publicados después de confirmar la transacción.
- Nulabilidad activada (`<Nullable>enable</Nullable>`), documentación XML de los endpoints para Swagger y mensajes de error con código estable (`extensions.code`) y localizados en español e inglés con archivos `.resx`.

**Kotlin y Jetpack Compose (aplicación móvil)**

Guías: *Kotlin Coding Conventions* y *Android Kotlin Style Guide*.

<p class="caption"><strong>Tabla 228</strong><br><em>Convenciones de código de la aplicación móvil</em></p>

| Elemento | Convención | Ejemplo |
|---|---|---|
| Use case | `VerbNounUseCase` | `RedeemInvitationUseCase` |
| Repositorio | `NounRepository` y `NounRepositoryImpl` | `CareLinkRepository` |
| DTO y entidad Room | `NounDto` y `NounEntity` | `DiaryEntryDto` |
| Estado y ViewModel | `ScreenUiState` y `ScreenViewModel` | `DiaryUiState` |
| Rutas de navegación | `NounRoute`, serializables | `DiaryRoute` |
| Composables | Con estado `XxxScreen` y sin estado `XxxContent` | `DiaryScreen` |

- Arquitectura de cuatro capas por bounded context (`domain`, `application`, `presentation` e `infrastructure`) con dependencias hacia el dominio. `domain` y `application` son Kotlin puro, sin dependencias de Android.
- Las reglas de negocio y las validaciones viven en entidades y objetos de valor (`init { require(...) }`), no en ViewModels ni en Composables.
- Un solo `StateFlow<XxxUiState>` por pantalla, eventos únicos mediante `Channel` y `collectAsStateWithLifecycle()`. Cada Composable público recibe `modifier: Modifier = Modifier` como primer parámetro opcional.
- Nada fijo en el código de las pantallas: los colores, tipografías, dimensiones y formas vienen del tema (`MaterialTheme`, `HealthifyTheme`) y los textos de `strings.xml`.
- Los DTO de Retrofit y las entidades de Room no salen de `infrastructure`: los mappers (`toDomain()`, `toEntity()`, `toDto()`) los convierten.
- Cada `XxxContent` tiene un `@Preview` por estado relevante (normal, carga, vacío, sin conexión y error) con `widthDp = 360` y `heightDp = 800`.
- Las versiones de las dependencias se declaran solo en `gradle/libs.versions.toml`.

**Pruebas y especificaciones**

- Pruebas del backend en xUnit, con nombres que describen el comportamiento (`PersonNameTests`, `RefreshRetryGraceTests`) y un archivo de pruebas por clase probada, en una carpeta que replica la del proyecto.
- Pruebas de la aplicación en JUnit 4 con MockK y Turbine, con los dobles de prueba en la misma ruta que la clase probada.
- Los criterios de aceptación de las historias de usuario se escriben en **Gherkin** (*Dado que*, *Cuando*, *Entonces*), siguiendo *Gherkin Conventions for Readable Specifications*: un escenario por comportamiento, en tercera persona y sin detalles de interfaz. Son la única parte redactada en español, porque forman parte de las historias del capítulo 2.

### 4.1.4. Software Deployment Configuration

Cada producto digital tiene su propio proceso de publicación a partir de su repositorio.

**Landing Page**

El landing page es un sitio estático (HTML, CSS y JavaScript) que se publica con **GitHub Pages** desde la rama `main` del repositorio `healthify-website`, con el dominio propio `landing.healthify.lat` definido en un archivo `CNAME`.

1. El cambio se integra en `develop` mediante un pull request.
2. Se integra `develop` en `main` con otro pull request y se crea el tag de la versión (`v1.0.0`, `v1.0.1`).
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
   | `Ai__Enabled`, `Ai__Gemini__ApiKey` | Activan las funciones con IA, desactivadas por defecto. |

3. Se ejecuta `docker compose up --build -d`.
4. El API queda disponible en `https://platform.healthify.lat` y su documentación en `/swagger`.

Además, el flujo de GitHub Actions `Release` (`.github/workflows/release.yml`) se ejecuta con cada push a `main`: restaura y compila la solución en *Release*, lee `<Version>` de `Healthify.Platform.csproj` y crea el release `v<versión>` con las notas generadas automáticamente.

**Mobile Application (Android)**

La aplicación se compila con Gradle. La dirección del backend (`BASE_URL`) se fija en cada tipo de compilación a `https://platform.healthify.lat/api/v1/`.

<p class="caption"><strong>Tabla 230</strong><br><em>Pasos de compilación de la aplicación móvil</em></p>

| Paso | Comando |
|---|---|
| Pruebas de JVM | `./gradlew :app:testDebugUnitTest` |
| Análisis estático | `./gradlew :app:lintDebug` |
| APK de depuración | `./gradlew :app:assembleDebug` |
| APK de publicación | `./gradlew :app:assembleRelease` |

El APK resultante (`app/build/outputs/apk/`) se instala en los dispositivos Android con versión 7.0 (API 24) o superior. Los datos de sesión se guardan cifrados en el dispositivo y la aplicación funciona sin conexión para registrar comidas y autopesajes, que se sincronizan al recuperar la red.

**Deployment Diagram (C4 Model)**

El diagrama de despliegue muestra los nodos donde se ejecuta cada artefacto: el dispositivo móvil del usuario, GitHub Pages para el landing page, y la máquina virtual de Oracle Cloud con Docker Engine, que aloja los contenedores del API (ASP.NET Core 10) y de la base de datos (MySQL 8.4). El dispositivo móvil consume el API por JSON sobre HTTPS, y el API se conecta a la base de datos por la red interna de Docker.

<p class="caption"><strong>Figura 143</strong><br><em>Diagrama de despliegue de Healthify</em></p>

![Deployment Diagram](../assets/img/artifacts/healthify-DeploymentDiagram.png)

## 4.2. Landing Page & Mobile Application Implementation

### 4.2.1. Sprint 1

#### 4.2.1.1. Sprint Planning 1

El Sprint 1 es el primer sprint de implementación. Se desarrolló entre el 27/09/2026 y el 09/10/2026 y cubre los tres productos digitales: el **landing page**, los **RESTful Web Services** (backend) y la **aplicación móvil Android**. Las historias incluidas son las ocho historias de usuario del épico EP10 (Landing Page), las diez historias técnicas del épico EP_TS (RESTful API) y las 37 historias de usuario de la aplicación (US01 a US31 y US39 a US44), definidas en la sección 2.4.1.

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
    <td valign="top"><strong>Ajustes.</strong> Cuenta, recordatorios, idioma, funciones de IA, sincronización pendiente, retiro del consentimiento, cambio de nutricionista y descarga de datos (US03, US07, US31, US41, US43).</td>
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

#### 4.2.1.9. Team Collaboration Insights during Sprint

<div style="page-break-after: always"></div>

## 4.3. Validation Interviews

### 4.3.1. Diseño de Entrevistas

### 4.3.2. Registro de Entrevistas

### 4.3.3. Evaluaciones según heurísticas

<div style="page-break-after: always"></div>
