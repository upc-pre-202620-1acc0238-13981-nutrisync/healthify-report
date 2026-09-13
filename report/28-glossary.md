# GLOSARIO

En esta sección se definen los términos clave utilizados a lo largo del documento, con el fin de que cualquier lector, técnico o no, comprenda con precisión los conceptos metodológicos, de arquitectura de software, de diseño de interfaces y del dominio nutricional sobre los que se construye Healthify. Los términos se agrupan por área temática y, dentro de cada grupo, se ordenan alfabéticamente. Al final se incluye una tabla de abreviaturas y acrónimos.

## Metodologías de descubrimiento y diseño centrado en el usuario

| Término | Definición |
|---|---|
| **Benchmark / Análisis competitivo** | Estudio comparativo de soluciones existentes en el mercado (por ejemplo, Nutrimind y Nutrium) para identificar fortalezas, debilidades y oportunidades de diferenciación del producto. |
| **Empathy Map** | Herramienta visual que sintetiza lo que un segmento de usuarios dice, piensa, hace y siente, con el fin de comprender sus motivaciones y frustraciones. |
| **Entrevista** | Técnica de investigación cualitativa aplicada a usuarios reales (pacientes y nutricionistas) para validar supuestos y descubrir necesidades. |
| **Hipótesis (Hypothesis Statement)** | Enunciado verificable del tipo "creemos que… lograremos… sabremos que tuvimos éxito cuando…", que traduce un supuesto en algo medible. |
| **Impact Mapping** | Técnica de planificación estratégica que conecta un objetivo de negocio con los actores, los impactos esperados en su comportamiento y los entregables que los producen. |
| **Lean UX** | Enfoque de diseño que prioriza la experimentación rápida, el aprendizaje validado y la colaboración sobre la documentación extensa. |
| **Lean UX Canvas** | Lienzo que resume en una sola vista el problema de negocio, los usuarios, los resultados esperados, las soluciones y las hipótesis a validar. |
| **Needfinding** | Conjunto de actividades orientadas a descubrir las necesidades reales, explícitas y latentes, de los usuarios antes de proponer una solución. |
| **Problem Statement** | Declaración concisa del problema que el producto busca resolver, redactada desde la perspectiva del negocio y del usuario. |
| **Segmento objetivo** | Grupo de usuarios con características y necesidades comunes al que se dirige el producto; en Healthify, pacientes en tratamiento nutricional y nutricionistas. |
| **Supuesto (Assumption)** | Creencia no validada sobre el usuario, el negocio o la solución que debe comprobarse mediante experimentos o entrevistas. |
| **User Journey Map** | Representación del recorrido de un usuario a lo largo de las etapas en que interactúa con un servicio, incluyendo acciones, emociones y puntos de dolor. |
| **User Persona** | Arquetipo ficticio, basado en datos de investigación, que representa a un segmento de usuarios y guía las decisiones de diseño. |
| **User Task Matrix** | Matriz que relaciona las tareas que realizan los distintos segmentos de usuarios con su frecuencia e importancia. |

## Gestión ágil y especificación de requisitos

| Término | Definición |
|---|---|
| **Criterios de aceptación** | Condiciones verificables, generalmente redactadas en formato Given/When/Then, que una historia de usuario debe cumplir para considerarse terminada. |
| **Epic** | Agrupación de historias de usuario relacionadas que, en conjunto, entregan una capacidad amplia del producto. |
| **Objetivo SMART** | Objetivo Específico, Medible, Alcanzable, Relevante y con Tiempo definido (*Specific, Measurable, Attainable, Relevant, Time-bound*). |
| **Product Backlog** | Lista priorizada y dinámica de todo el trabajo pendiente del producto, expresado principalmente como historias de usuario. |
| **Scrum** | Marco de trabajo ágil que organiza el desarrollo en iteraciones de duración fija llamadas sprints, con roles, eventos y artefactos definidos. |
| **Sprint** | Iteración de duración fija en la que el equipo construye un incremento potencialmente entregable del producto. |
| **Sprint Backlog** | Subconjunto del Product Backlog seleccionado para un sprint, junto con el plan para entregarlo. |
| **Sprint Planning / Sprint Review** | Eventos de Scrum en los que, respectivamente, se planifica el trabajo del sprint y se inspecciona el incremento obtenido con los interesados. |
| **Stakeholder** | Persona u organización con interés o influencia en el producto: usuarios, docentes, inversionistas, equipo de desarrollo, entre otros. |
| **Story Points** | Unidad relativa de estimación del esfuerzo y complejidad de una historia de usuario; en este proyecto se usa la escala 1, 2, 3, 5 y 8. |
| **User Story (Historia de usuario)** | Descripción breve de una funcionalidad desde la perspectiva de quien la necesita, con la forma "Como… quiero… para…". |

## Domain-Driven Design estratégico

| Término | Definición |
|---|---|
| **Actor** | En EventStorming, la persona o rol que origina un comando. En Healthify los actores son siempre `Patient` o `Practitioner`, nunca un usuario genérico. |
| **Anticorruption Layer (ACL)** | Capa de traducción que aísla un modelo de dominio de un modelo externo, impidiendo que conceptos o identificadores ajenos contaminen el dominio. Se aplica sobre Open Food Facts y USDA en `Food Catalog`. |
| **Big Picture EventStorming** | Primera sesión de EventStorming, orientada a comprender el dominio completo tal como ocurre hoy mediante eventos, actores, políticas y hotspots, sin diseñar aún el sistema. |
| **Bounded Context** | Frontera explícita dentro de la cual un modelo de dominio y su lenguaje son consistentes y cada término significa exactamente una cosa. |
| **Bounded Context Canvas** | Plantilla que describe un bounded context: propósito, clasificación estratégica, reglas de negocio, lenguaje, comandos, consultas, eventos y dependencias. |
| **Candidate Context Discovery** | Actividad en la que se identifican los bounded contexts candidatos a partir del modelo de EventStorming, usando técnicas como *look-for-pivotal-events* y *start-with-value*. |
| **Conformist** | Patrón de relación en el que el contexto downstream adopta sin traducción el modelo del contexto upstream. |
| **Context Map** | Diagrama que representa las relaciones estructurales entre bounded contexts y los patrones de integración que las gobiernan. |
| **Core Domain** | Subdominio que constituye la diferenciación competitiva del producto y merece la mayor inversión de diseño. En Healthify: `Intake & Body Response` y `Monitoring & Adherence`. |
| **Customer/Supplier** | Patrón de relación en el que el contexto downstream (cliente) tiene voz para negociar lo que el contexto upstream (proveedor) le entrega. |
| **Design Level EventStorming** | Sesión de EventStorming que profundiza el modelo agregando comandos, agregados, reglas de negocio, read models y sistemas externos. |
| **Domain Event (Evento de dominio)** | Hecho relevante para el negocio que ya ocurrió, redactado en pasado participio (por ejemplo, `Meal Logged`). |
| **Domain Storytelling** | Técnica que narra un escenario de negocio como una secuencia numerada de mensajes entre actores y contextos; se utiliza para modelar los *Domain Message Flows*. |
| **Domain-Driven Design (DDD)** | Enfoque de diseño de software que centra el modelado en el dominio del negocio y en un lenguaje compartido entre expertos y desarrolladores. |
| **Downstream / Upstream** | Posiciones en una relación entre contextos: el upstream influye o provee, y el downstream depende o consume. |
| **Evento pivote (Pivotal Event)** | Evento que cambia el estado del proceso de forma irreversible, de modo que lo que ocurre después obedece a reglas distintas. |
| **EventStorming** | Técnica colaborativa de modelado basada en notas adhesivas de colores ordenadas en una línea de tiempo, que permite explorar un dominio a partir de sus eventos. |
| **Generic Subdomain** | Subdominio necesario pero no diferenciador, que puede resolverse con soluciones estándar. En Healthify: `Food Catalog` e `Identity & Access`. |
| **Hotspot** | Nota de EventStorming que marca una duda, conflicto o pregunta abierta pendiente de validación. |
| **Open Host Service (OHS)** | Patrón en el que un contexto publica un protocolo o servicio bien definido para que otros contextos lo consuman. |
| **Policy (Política)** | Reacción automática del tipo "cuando ocurre X, entonces se ejecuta Y", que conecta un evento con un comando. |
| **Published Language** | Contrato de intercambio documentado y estable que un contexto publica para sus consumidores; en Healthify, `Active Targets`. |
| **Read Model** | Vista de datos optimizada para consulta que alguien necesita para tomar la siguiente decisión. |
| **Shared Kernel** | Pequeña parte del modelo compartida por varios contextos; en Healthify se limita a los identificadores (`PatientId`, `PractitionerId`, `CareLinkId`, `PlanId`) y a las unidades de medida. |
| **Supporting Subdomain** | Subdominio necesario para el negocio y específico de él, pero no diferenciador. En Healthify: `Nutritional Care` y `Care Relationship`. |
| **Ubiquitous Language (Lenguaje ubicuo)** | Vocabulario común y riguroso que el equipo usa por igual en entrevistas, modelos, documentación y código. |

