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

## Domain-Driven Design táctico y patrones de diseño

| Término | Definición |
|---|---|
| **Aggregate / Aggregate Root** | Grupo de objetos de dominio tratados como una unidad de consistencia; la raíz es la única entrada desde el exterior y la responsable de hacer cumplir las reglas de negocio. |
| **Assembler** | Clase que transforma recursos de la capa de interfaz en comandos o consultas, y resultados de dominio en recursos de respuesta. |
| **Command (Comando)** | Mensaje que expresa la intención de cambiar el estado del sistema (por ejemplo, `LogMealByPhotoCommand`). |
| **Command Service / Query Service** | Servicios de aplicación que atienden, respectivamente, comandos que modifican estado y consultas sin efectos secundarios. |
| **Consistencia eventual** | Garantía de que los datos distribuidos convergerán a un estado consistente tras un intervalo, sin exigir actualización inmediata. |
| **Consistencia fuerte (transaccional)** | Garantía de que todo cambio es visible y válido de inmediato dentro de una misma transacción. |
| **CQRS** | Patrón que separa las operaciones de escritura (comandos) de las de lectura (consultas) en modelos o servicios distintos. |
| **Domain Service** | Operación de dominio que no pertenece naturalmente a ninguna entidad o value object (por ejemplo, `IHashingService`, `ITokenService`). |
| **Entity (Entidad)** | Objeto de dominio definido por su identidad y no por sus atributos. |
| **Event Handler** | Componente que escucha un evento de dominio y ejecuta la política asociada, normalmente emitiendo un nuevo comando. |
| **Facade (Fachada)** | Patrón que ofrece una interfaz simplificada sobre un subsistema; en el proyecto, cada contexto expone una fachada ACL (por ejemplo, `IIntakeContextFacade`) para ser consultado por otros. |
| **Factory Method** | Patrón creacional que encapsula la creación de un objeto en un método; por ejemplo, `User.StartSession()` es el único camino para crear una `UserSession`. |
| **Idempotencia** | Propiedad de una operación que produce el mismo resultado sin importar cuántas veces se ejecute; se aplica a la sincronización offline mediante `ClientEntryId`. |
| **Identidad tipada (Strongly Typed Id)** | Value object que envuelve un identificador primitivo (por ejemplo, `DiaryEntryId`) para evitar confundir identificadores de agregados distintos. |
| **Invariante** | Regla de negocio que debe cumplirse siempre dentro de un agregado, antes y después de cada operación. |
| **Last Write Wins** | Estrategia de resolución de conflictos en la que prevalece la escritura más reciente. |
| **Mediator** | Patrón que desacopla emisores y receptores de mensajes mediante un intermediario; se usa para publicar comandos y eventos de dominio. |
| **Offline-first** | Estrategia de diseño en la que la aplicación funciona sin conexión, encola los cambios localmente y los sincroniza cuando se recupera la conectividad. |
| **Repository (Repositorio)** | Abstracción que provee acceso a los agregados como si fueran una colección en memoria, ocultando los detalles de persistencia. |
| **Resource** | Objeto de transferencia de la capa de interfaz que define la forma de las peticiones y respuestas de la API. |
| **Result Pattern** | Patrón en el que una operación devuelve explícitamente un éxito con valor o un error tipado (`Result<T, Error>`), en lugar de lanzar excepciones. |
| **Unit of Work** | Patrón que agrupa varias operaciones de persistencia en una sola transacción confirmada de manera atómica. |
| **Value Object** | Objeto inmutable definido por sus atributos y no por su identidad, que encapsula validaciones y hace imposible representar estados inválidos (por ejemplo, `Email`, `WeightKg`). |

## Arquitectura de software y diagramas

| Término | Definición |
|---|---|
| **Application Layer** | Capa que orquesta los casos de uso: recibe comandos y consultas, coordina agregados y repositorios, y publica eventos. No contiene reglas de negocio. |
| **Arquitectura en capas** | Organización del código en capas con responsabilidades separadas (Interface, Application, Domain e Infrastructure) y dependencias dirigidas hacia el dominio. |
| **Backend for Frontend (BFF)** | Patrón en el que un servicio intermedio compone datos de varios contextos para satisfacer las necesidades de una interfaz concreta. |
| **C4 Model** | Modelo de diagramación de arquitectura en cuatro niveles de abstracción: Context, Container, Component y Code. |
| **Class Diagram (Diagrama de clases)** | Diagrama UML que muestra clases, atributos, métodos y sus relaciones (asociación, composición, dependencia, generalización). |
| **Component Diagram** | Nivel 3 del modelo C4: muestra los componentes internos de un contenedor y sus interacciones. |
| **Composition Root** | Punto único de la aplicación donde se registran y ensamblan las dependencias mediante inyección de dependencias. |
| **Container Diagram** | Nivel 2 del modelo C4: muestra las aplicaciones, servicios y almacenes de datos que componen el sistema. |
| **Context Diagram** | Nivel 1 del modelo C4: muestra el sistema como una caja, sus usuarios y los sistemas externos con los que interactúa. |
| **Database Design Diagram** | Diagrama que representa las tablas, columnas, claves e índices de la base de datos de un contexto. |
| **Deployment Diagram** | Diagrama que muestra cómo se distribuyen los contenedores del sistema sobre la infraestructura física o en la nube. |
| **Domain Layer** | Capa que contiene el modelo de negocio: agregados, entidades, value objects, eventos, comandos, consultas e interfaces de repositorio. |
| **Infrastructure Layer** | Capa que implementa los detalles técnicos: persistencia, integraciones externas, seguridad y tareas en segundo plano. |
| **Interface Layer** | Capa que expone el sistema al exterior mediante controladores REST, recursos y assemblers. |
| **Inyección de dependencias (DI)** | Técnica en la que un objeto recibe sus dependencias desde el exterior en lugar de crearlas, favoreciendo el desacoplamiento y las pruebas. |
| **Microservicio** | Estilo arquitectónico en el que el sistema se compone de servicios pequeños, autónomos y desplegables de forma independiente. |
| **Monolito modular** | Aplicación desplegada como una sola unidad, pero organizada internamente en módulos con fronteras claras, como los bounded contexts de Healthify. |
| **PlantUML** | Herramienta que genera diagramas UML y C4 a partir de descripciones en texto; se utiliza para los canvases, diagramas de clases, de componentes y de base de datos del informe. |
| **UML** | Lenguaje Unificado de Modelado, estándar para visualizar y documentar el diseño de sistemas de software. |

