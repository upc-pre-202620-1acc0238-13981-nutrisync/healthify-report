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

La arquitectura de software de Healthify se representa mediante el modelo C4, aplicando tres de sus niveles de abstracción — Contexto, Contenedores y Componentes — sobre la solución completa: la aplicación móvil Flutter, el backend ASP\.NET Core, el Landing Page estático y la base de datos PostgreSQL. El diseño sigue los seis Bounded Contexts identificados en el proceso estratégico de Domain-Driven Design (2.5.1 y 2.5.2), materializados aquí como módulos concretos tanto en el cliente como en el servidor. Estos tres niveles se detallan en las secciones 2.5.3.1 a 2.5.3.3; adicionalmente, se presenta en la sección 2.5.3.4 el Deployment Diagram, diagrama suplementario del modelo C4 que describe la distribución física de la solución sobre la infraestructura.

#### 2.5.3.1. Software Architecture Context Level Diagrams

El Diagrama de Contexto (Nivel 1 del modelo C4) representa a Healthify como un sistema centralizado y detalla su interacción con los dos actores principales y los sistemas externos con los que se integra. Este diagrama permite visualizar el alcance global de la solución y los límites del sistema frente a servicios de terceros.

**Elementos:**

- **Healthify:** Sistema central que provee el seguimiento nutricional entre consultas, la comunicación entre paciente y nutricionista, y el monitoreo de adherencia al plan.
- **Patient:** Persona que registra sus comidas y peso entre consultas, y sigue el plan prescrito por su nutricionista.
- **Practitioner:** Persona que realiza el acto clínico (evaluación, diagnóstico, prescripción) y revisa las señales de adherencia de sus pacientes.
- **External Systems:**
	- `Auth Provider:` Gestiona la identidad federada; Healthify actúa como conformist frente a este proveedor.
	- `ML Kit:` Motor de visión artificial on-device que estima la porción del plato a partir de la foto de la comida, sin salida de red.
	- `Nutritional Data Providers:` Fuentes externas de catálogo nutricional (Open Food Facts, USDA) consultadas a través del Anticorruption Layer de Food Catalog.
	- `Push Notification Service:` Entrega recordatorios locales de pesaje y vacíos de registro; conformist, sin dominio propio.

![Context Diagram](../assets/img/artifacts/healthify-SystemContext.png)

#### 2.5.3.2. Software Architecture Container Level Diagrams

El Diagrama de Contenedores (Nivel 2 del modelo C4) desglosa el sistema Healthify en sus principales unidades lógicas de ejecución. En este nivel se especifican las responsabilidades de cada contenedor, las tecnologías elegidas para su implementación y los protocolos de comunicación que permiten la interacción entre ellos y con los sistemas externos.

**Elementos:**

- **Landing Page:** Sitio web estático que presenta la propuesta de valor de Healthify y dirige a los usuarios hacia la descarga de la aplicación.
   - **Tecnología:** `HTML5 + CSS3 + JavaScript`.
- **Mobile Application:** Frontend donde Patient y Practitioner interactúan con la plataforma. Aplicación Flutter única con dos navigation shells seleccionados según el claim de rol, que agrupa internamente los seis Bounded Contexts del cliente.
   - **Tecnología:** `Flutter`.
- **API Application:** Backend que maneja la lógica de negocio de los seis Bounded Contexts, expuesta vía una API RESTful.
   - **Tecnología:** `ASP.NET Core (C#)`.
- **Database:** Almacena usuarios, vínculos de cuidado, evaluaciones, diagnósticos, planes, entradas del diario y ventanas de monitoreo.
   - **Tecnología:** `PostgreSQL`.
- **External Systems:** APIs de terceros que se integran con el backend y con el cliente para extender las capacidades del sistema.
   - **Tecnología:** `JSON/HTTPS (REST)` para el backend; llamada on-device sin red para ML Kit.

![Container Diagram](../assets/img/artifacts/healthify-ContainerDiagram.png)

![Container Diagram Summarized](../assets/img/artifacts/healthify-ContainerDiagram1.png)

#### 2.5.3.3. Software Architecture Components Diagrams

El Diagrama de Componentes (Nivel 3 del modelo C4) describe la estructura interna de los contenedores principales de Healthify. En esta sección se detallan las capas DDD de cada contenedor, sus responsabilidades específicas y las tecnologías utilizadas.

**A. Mobile Application Components (Frontend)**

La aplicación Flutter se organiza en 6 Bounded Contexts, cada uno con 4 capas siguiendo el patrón de arquitectura del Domain-Driven Design. Además, se tiene un Frontend Shared con 3 capas siguiendo también el patrón de arquitectura del Domain-Driven Design.

El diagrama a continuación muestra todos los componentes de la arquitectura en un único bloque.

![Frontend Component Diagram](../assets/img/artifacts/healthify-FrontendBCsDiagram.png)

Cada Bounded Context contiene una capa de Presentation con las pantallas y widgets de Flutter, una capa de Application con los servicios Dart que orquestan la lógica del cliente, una capa de Domain con los modelos del lado cliente, y una capa de Infrastructure con el cliente HTTP Dio que se comunica con el API Application. Todos los BCs del frontend utilizan el Frontend Shared, que provee las utilidades BaseApi, el cliente de Outbox y almacenamiento local, los objetos de valor compartidos como units.record y active-targets-cache.record, y los widgets de presentación transversales como el app shell y el selector de navigation shell.

Para apreciar la separación por capas Domain-Driven Design de cada Bounded Context y del Frontend Shared, se presenta a continuación un diagrama de detalle individual por cada uno.

**Frontend Shared:**

Módulo transversal utilizado por todos los Bounded Contexts del frontend que agrupa las utilidades HTTP base, el almacenamiento local, la cola de sincronización Outbox y los widgets de presentación reutilizables. Se organiza en 3 capas DDD: Presentation, Domain e Infrastructure. No contiene lógica de negocio propia.

![Frontend Shared Diagram](../assets/img/artifacts/healthify-FrontendSharedDiagram.png)

La capa Presentation del Frontend Shared agrupa las vistas y componentes Flutter reutilizables a lo largo de toda la aplicación. El detalle de sus vistas y componentes se presenta a continuación:

 - **Views:**

   ![Frontend Shared Views Diagram](../assets/img/artifacts/healthify-FrontendSharedViewsDiagram.png)

 - **Components:**

   ![Frontend Shared Components Diagram](../assets/img/artifacts/healthify-FrontendSharedComponentsDiagram.png)

**Bounded Contexts:**

 - **Identity & Access:** Gestiona las pantallas de inicio de sesión y registro.

   ![IAM Frontend Diagram](../assets/img/artifacts/healthify-IAMFrontendDiagram.png)

   La capa Presentation contiene únicamente vistas Flutter para este Bounded Context. El detalle de sus vistas se presenta a continuación:

   - **Views:**

     ![IAM Presentation Views Diagram](../assets/img/artifacts/healthify-IAMPresentationViewsDiagram.png)

 - **Care Relationship:** Gestiona el escaneo del código QR de invitación, el consentimiento del paciente y el reconocimiento de metas activas.

   ![Care Relationship Frontend Diagram](../assets/img/artifacts/healthify-CareRelationshipFrontendDiagram.png)

   La capa Presentation contiene vistas y componentes Flutter para este Bounded Context. El detalle de sus vistas y componentes se presenta a continuación:

   - **Views:**

     ![Care Relationship Presentation Views Diagram](../assets/img/artifacts/healthify-CareRelationshipPresentationViewsDiagram.png)

   - **Components:**

     ![Care Relationship Presentation Components Diagram](../assets/img/artifacts/healthify-CareRelationshipPresentationComponentsDiagram.png)

 - **Nutritional Care:** Gestiona las pantallas de evaluación, diagnóstico y prescripción del plan, usadas por el Practitioner durante la consulta.

   ![Nutritional Care Frontend Diagram](../assets/img/artifacts/healthify-NutritionalCareFrontendDiagram.png)

   La capa Presentation contiene vistas y componentes Flutter para este Bounded Context. El detalle de sus vistas y componentes se presenta a continuación:

   - **Views:**

     ![Nutritional Care Presentation Views Diagram](../assets/img/artifacts/healthify-NutritionalCarePresentationViewsDiagram.png)

   - **Components:**

     ![Nutritional Care Presentation Components Diagram](../assets/img/artifacts/healthify-NutritionalCarePresentationComponentsDiagram.png)

 - **Intake & Body Response:** Gestiona el registro de comidas por foto, la estimación de porción, el autopesaje y el diario offline. Escritura exclusiva del Patient.

   ![Intake Frontend Diagram](../assets/img/artifacts/healthify-IntakeFrontendDiagram.png)

   La capa Presentation contiene vistas y componentes Flutter para este Bounded Context. El detalle de sus vistas y componentes se presenta a continuación:

   - **Views:**

     ![Intake Presentation Views Diagram](../assets/img/artifacts/healthify-IntakePresentationViewsDiagram.png)

   - **Components:**

     ![Intake Presentation Components Diagram](../assets/img/artifacts/healthify-IntakePresentationComponentsDiagram.png)

 - **Monitoring & Adherence:** Gestiona el indicador de cumplimiento diario y el panel de monitoreo del paciente.

   ![Monitoring Frontend Diagram](../assets/img/artifacts/healthify-MonitoringFrontendDiagram.png)

   La capa Presentation contiene vistas y componentes Flutter para este Bounded Context. El detalle de sus vistas y componentes se presenta a continuación:

   - **Views:**

     ![Monitoring Presentation Views Diagram](../assets/img/artifacts/healthify-MonitoringPresentationViewsDiagram.png)

   - **Components:**

     ![Monitoring Presentation Components Diagram](../assets/img/artifacts/healthify-MonitoringPresentationComponentsDiagram.png)

 - **Food Catalog:** Gestiona la búsqueda de alimentos contra el catálogo de referencia cacheado localmente.

   ![Food Catalog Frontend Diagram](../assets/img/artifacts/healthify-FoodCatalogFrontendDiagram.png)

   La capa Presentation contiene vistas y componentes Flutter para este Bounded Context. El detalle de sus vistas y componentes se presenta a continuación:

   - **Views:**

     ![Food Catalog Presentation Views Diagram](../assets/img/artifacts/healthify-FoodCatalogPresentationViewsDiagram.png)

   - **Components:**

     ![Food Catalog Presentation Components Diagram](../assets/img/artifacts/healthify-FoodCatalogPresentationComponentsDiagram.png)

**B. API Application Components (Backend)**

El backend se organiza en 6 Bounded Contexts y un Shared Kernel, cada uno siguiendo el patrón de arquitectura del Domain-Driven Design. Todos los Bounded Contexts comparten una única base de datos PostgreSQL, accedida a través de los repositorios de Entity Framework Core en la capa de Infrastructure de cada uno.

El diagrama a continuación muestra todos los componentes de la arquitectura en un único bloque.

![Backend Component Diagram](../assets/img/artifacts/healthify-BackendBCsDiagram.png)

Cada Bounded Context contiene una capa de Interfaces con los Controllers de ASP.NET Core que reciben las peticiones HTTP y, cuando corresponde, las fachadas ACL que exponen contratos a otros Bounded Contexts; una capa de Application con los servicios y comandos que orquestan los casos de uso; una capa de Domain con los agregados y entidades del dominio; y una capa de Infrastructure con los repositorios de Entity Framework Core. Todos los BCs del backend utilizan el Shared Kernel a través de su capa Application.

Para apreciar la separación por capas Domain-Driven Design de cada Bounded Context y del Shared Kernel, se presenta a continuación un diagrama de detalle individual por cada uno.

El detalle individual se acota a la capa de Interfaces porque es la única que expone la comunicación entre Bounded Contexts: las fachadas ACL representan los contratos que un contexto ofrece a los demás y los Controllers REST definen los puntos de entrada hacia el exterior. Las capas de Application, Domain e Infrastructure encapsulan lógica interna a cada contexto y no forman parte de su frontera de integración, por lo que su descomposición no aporta a la lectura de las relaciones inter-BC en este nivel; dicho detalle interno corresponde a niveles más profundos del modelo C4.

**Shared Kernel:**

Componente transversal utilizado por todos los Bounded Contexts del backend. Es mínimo y deliberado: solo agrupa identificadores (PatientId, PractitionerId, CareLinkId, PlanId) y unidades de medida. No contiene lógica de negocio propia ni acceso a base de datos.

![Shared Kernel Diagram](../assets/img/artifacts/healthify-SharedKernelDiagram.png)

**Bounded Contexts:**

 - **Identity & Access:** Maneja la autenticación y la emisión del role claim. Es conformist frente al proveedor de identidad.

   ![IAM Backend Diagram](../assets/img/artifacts/healthify-IAMBackendDiagram.png)

   La capa Interfaces contiene únicamente endpoints REST para este Bounded Context, ya que el rol viaja embebido en el token de sesión y no requiere fachada ACL. El detalle se presenta a continuación:

   - **REST:**

     ![IAM REST Diagram](../assets/img/artifacts/healthify-IAMRestDiagram.png)

 - **Care Relationship:** Única fuente de verdad sobre quién puede ver a quién. Aplica el principio de asimetría entre paciente y profesional.

   ![Care Relationship Backend Diagram](../assets/img/artifacts/healthify-CareRelationshipBackendDiagram.png)

   La capa Interfaces contiene un contrato ACL y endpoints REST para este Bounded Context. El detalle se presenta a continuación:

   - **ACL:**

     ![Care Relationship ACL Diagram](../assets/img/artifacts/healthify-CareRelationshipAclDiagram.png)

   - **REST:**

     ![Care Relationship REST Diagram](../assets/img/artifacts/healthify-CareRelationshipRestDiagram.png)

 - **Nutritional Care:** Ejecuta el acto clínico completo: evaluación, diagnóstico y prescripción, con versionado y trazabilidad.

   ![Nutritional Care Backend Diagram](../assets/img/artifacts/healthify-NutritionalCareBackendDiagram.png)

   La capa Interfaces contiene un contrato ACL y endpoints REST para este Bounded Context. El detalle se presenta a continuación:

   - **ACL:**

     ![Nutritional Care ACL Diagram](../assets/img/artifacts/healthify-NutritionalCareAclDiagram.png)

   - **REST:**

     ![Nutritional Care REST Diagram](../assets/img/artifacts/healthify-NutritionalCareRestDiagram.png)

 - **Intake & Body Response:** Persiste el consumo declarado del paciente y su respuesta corporal. Escritura exclusiva del paciente.

   ![Intake Backend Diagram](../assets/img/artifacts/healthify-IntakeBackendDiagram.png)

   La capa Interfaces contiene un contrato ACL y endpoints REST para este Bounded Context. El detalle se presenta a continuación:

   - **ACL:**

     ![Intake ACL Diagram](../assets/img/artifacts/healthify-IntakeAclDiagram.png)

   - **REST:**

     ![Intake REST Diagram](../assets/img/artifacts/healthify-IntakeRestDiagram.png)

 - **Monitoring & Adherence:** Compara lo prescrito contra lo real e interpreta la diferencia. Nunca escribe directamente sobre Nutritional Care.

   ![Monitoring Backend Diagram](../assets/img/artifacts/healthify-MonitoringBackendDiagram.png)

   La capa Interfaces contiene un contrato ACL y endpoints REST para este Bounded Context. El detalle se presenta a continuación:

   - **ACL:**

     ![Monitoring ACL Diagram](../assets/img/artifacts/healthify-MonitoringAclDiagram.png)

   - **REST:**

     ![Monitoring REST Diagram](../assets/img/artifacts/healthify-MonitoringRestDiagram.png)

 - **Food Catalog:** Traduce el catálogo externo hacia el dominio y lo cachea. Aplica Anticorruption Layer frente a Open Food Facts y USDA.

   ![Food Catalog Backend Diagram](../assets/img/artifacts/healthify-FoodCatalogBackendDiagram.png)

   La capa Interfaces contiene un contrato ACL y endpoints REST para este Bounded Context. El detalle se presenta a continuación:

   - **ACL:**

     ![Food Catalog ACL Diagram](../assets/img/artifacts/healthify-FoodCatalogAclDiagram.png)

   - **REST:**

     ![Food Catalog REST Diagram](../assets/img/artifacts/healthify-FoodCatalogRestDiagram.png)

#### 2.5.3.4. Software Architecture Deployment Diagram

## 2.6. Tactical-Level Domain-Driven Design

### 2.6.1. Bounded Context: 

#### 2.6.1.1. Domain Layer

#### 2.6.1.2. Interface Layer

#### 2.6.1.3. Application Layer

#### 2.6.1.4. Infrastructure Layer

#### 2.6.1.5. Bounded Context Software Architecture Component Level Diagrams

#### 2.6.1.6. Bounded Context Software Architecture Code Level Diagrams

#### 2.6.1.6.1. Bounded Context Domain Layer Class Diagrams

#### 2.6.1.6.2. Bounded Context Database Design Diagram