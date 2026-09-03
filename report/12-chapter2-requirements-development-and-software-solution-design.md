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

#### 2.5.3.3. Software Architecture Deployment Diagrams

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