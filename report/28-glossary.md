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
| **Generic Subdomain** | Subdominio necesario pero no diferenciador, que puede resolverse con soluciones estándar. En Healthify: `Food Catalog` e `IAM`. |
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

## Tecnologías, backend y seguridad

| Término | Definición |
|---|---|
| **API REST** | Interfaz de programación basada en HTTP que expone recursos mediante URL y verbos (`GET`, `POST`, `PUT`, `DELETE`). |
| **ASP.NET Core** | Framework multiplataforma de Microsoft para construir APIs web con C#, sobre el que se implementa el backend de Healthify. |
| **Backing field** | Campo privado que almacena el valor de una propiedad; EF Core lo utiliza para persistir colecciones sin exponerlas como mutables. |
| **BackgroundService / Hosted Service** | Servicio de .NET que se ejecuta en segundo plano durante la vida de la aplicación; por ejemplo, `CatalogImportHostedService` importa el catálogo periódicamente. |
| **BCrypt** | Algoritmo de hashing de contraseñas lento y con sal incorporada, diseñado para resistir ataques de fuerza bruta. |
| **C#** | Lenguaje de programación orientado a objetos de Microsoft utilizado para el backend de la plataforma. |
| **Claim** | Afirmación sobre un usuario (identificador, email, rol) contenida en un token de autenticación. |
| **Controller (Controlador)** | Clase de la Interface Layer que recibe peticiones HTTP, las traduce en comandos o consultas y devuelve respuestas. |
| **Entity Framework Core (EF Core)** | ORM de .NET que mapea clases de dominio a tablas relacionales y traduce consultas LINQ a SQL. |
| **Hash** | Resultado de aplicar una función unidireccional a un dato; se usa para almacenar contraseñas y para identificar registros importados de forma estable. |
| **HMAC-SHA256** | Algoritmo de firma basado en una clave secreta y la función SHA-256, utilizado para firmar los tokens JWT. |
| **HttpClient tipado** | Cliente HTTP configurado e inyectado para un servicio externo específico, con dirección base, tiempo de espera y cabeceras propias. |
| **Interceptor** | Componente de EF Core que intercepta operaciones de persistencia para aplicar lógica transversal, como auditoría o normalización a UTC. |
| **JWT Bearer** | Esquema de autenticación en el que el cliente envía un token JWT en la cabecera `Authorization` de cada petición. |
| **Localización (.resx)** | Mecanismo de .NET para traducir mensajes a varios idiomas mediante archivos de recursos; el proyecto soporta español e inglés. |
| **ML Kit** | Kit de aprendizaje automático de Google que se ejecuta en el dispositivo móvil; en Healthify se usa para proponer la estimación de porción a partir de una fotografía. |
| **MySQL** | Sistema gestor de bases de datos relacional utilizado para la persistencia de la plataforma (versión 8). |
| **Open Food Facts** | Base de datos colaborativa y abierta de productos alimenticios, utilizada como fuente externa del catálogo nutricional. |
| **ProblemDetails** | Formato estándar (RFC 9457) para describir errores en respuestas HTTP de una API. |
| **Seeder** | Componente que carga datos iniciales en la base de datos, como el catálogo de 60 alimentos peruanos de referencia. |
| **snake_case** | Convención de nombres en minúsculas con palabras separadas por guion bajo, aplicada a tablas y columnas de la base de datos. |
| **Swagger / OpenAPI** | Especificación y conjunto de herramientas para documentar y probar interactivamente una API REST. |
| **Token** | Cadena firmada que acredita la identidad y los permisos de un usuario durante una sesión. |
| **USDA FoodData Central** | Base de datos nutricional del Departamento de Agricultura de los Estados Unidos, utilizada como segunda fuente externa del catálogo. |
| **Value Converter** | Mecanismo de EF Core que transforma un value object en un tipo primitivo al guardar y lo reconstruye al leer. |

## Diseño de producto e interfaces (UI/UX)

| Término | Definición |
|---|---|
| **Accesibilidad** | Práctica de diseñar productos utilizables por personas con distintas capacidades, siguiendo pautas como WCAG. |
| **Arquitectura de información** | Disciplina que organiza, etiqueta y estructura el contenido para que los usuarios encuentren y comprendan la información. |
| **Figma** | Herramienta colaborativa en la nube para diseñar interfaces, wireframes, mock-ups y prototipos. |
| **Guía de estilos (Style Guidelines)** | Documento que define los lineamientos visuales y de comunicación del producto: colores, tipografía, iconografía, espaciado y tono. |
| **Heurísticas de usabilidad** | Principios generales (por ejemplo, las diez heurísticas de Nielsen) utilizados para evaluar la usabilidad de una interfaz. |
| **Landing Page** | Página web de aterrizaje que presenta la propuesta de valor del producto y dirige al visitante hacia una acción concreta. |
| **Meta Tags / SEO Tags** | Etiquetas HTML que describen el contenido de una página para los motores de búsqueda y redes sociales. |
| **Mock-up** | Representación visual de alta fidelidad de una interfaz, con colores, tipografías e imágenes finales, pero sin interactividad. |
| **Navigation Shell** | Estructura de navegación que la aplicación cliente monta según el rol de la sesión: una para el paciente y otra para el profesional. |
| **Navigation System** | Conjunto de mecanismos (menús, pestañas, enlaces) que permiten al usuario desplazarse por el producto. |
| **Organization / Labelling / Searching Systems** | Componentes de la arquitectura de información que definen, respectivamente, cómo se agrupa el contenido, cómo se nombra y cómo se busca. |
| **Prototipo** | Modelo interactivo de la aplicación que simula la navegación y el comportamiento para validar el diseño con usuarios antes de implementarlo. |
| **Responsive Design** | Enfoque de diseño que adapta la interfaz a distintos tamaños de pantalla y dispositivos. |
| **UI (User Interface)** | Interfaz de usuario: conjunto de elementos visuales e interactivos con los que la persona interactúa con el sistema. |
| **User Flow Diagram** | Diagrama que muestra los pasos que sigue un usuario para completar una tarea específica dentro de la aplicación. |
| **UX (User Experience)** | Experiencia de usuario: percepción integral de la persona al usar un producto, incluyendo facilidad de uso, utilidad y satisfacción. |
| **Wireflow** | Diagrama que combina wireframes con flechas de flujo para mostrar la navegación entre pantallas. |
| **Wireframe** | Esquema de baja fidelidad que representa la estructura y distribución de los elementos de una pantalla, sin detalle visual. |

## Términos del dominio de Healthify

| Término | Definición |
|---|---|
| **Active Targets (Metas vigentes)** | Contrato reducido y versionado con las metas, pautas y restricciones que el paciente recibe; no es el plan clínico completo. |
| **Antropometría** | Conjunto de mediciones corporales (peso, talla, perímetros, pliegues) utilizadas en la evaluación nutricional. |
| **Care Link (Vínculo de cuidado)** | Relación consentida entre un paciente y un profesional que habilita el acceso a la información del tratamiento. |
| **Consent (Consentimiento)** | Autorización del paciente, siempre revocable, sin la cual el vínculo no habilita ningún acceso. |
| **Consistency Index (Índice de consistencia)** | Contraste entre la tendencia de peso y la ingesta registrada, utilizado como señal de calidad del dato. |
| **Daily Compliance (Cumplimiento diario)** | Resultado de comparar lo registrado en un día contra las metas vigentes de ese día. |
| **Deviation (Desviación)** | Diferencia sostenida entre lo prescrito y lo realmente registrado durante una ventana de evaluación. |
| **Diary Entry (Entrada de diario)** | Registro de un evento de consumo realizado por el paciente, por fotografía, de forma manual o como comida fuera del plan. |
| **Evaluation Window (Ventana de evaluación)** | Periodo mínimo de siete días sobre el cual se evalúa el tratamiento. |
| **Kcal (kilocaloría)** | Unidad de energía utilizada para expresar el aporte energético de los alimentos y las metas diarias. |
| **Logging Gap (Vacío de registro)** | Días sin ninguna entrada de diario; no constituye desviación ni incumplimiento. |
| **Macronutrientes** | Nutrientes que el organismo requiere en mayor cantidad: proteínas, carbohidratos y grasas, expresados en gramos. |
| **Nutrition Plan (Plan de alimentación)** | Artefacto clínico versionado que contiene metas, pautas y restricciones, elaborado tras la evaluación y el diagnóstico. |
| **Off Plan Entry (Comida fuera del plan)** | Declaración del paciente de haber comido fuera de lo prescrito, sin detalle exigido y sin penalización. |
| **Patient (Paciente)** | Persona en tratamiento nutricional activo vinculada a un profesional mediante consentimiento vigente. |
| **Practitioner (Nutricionista)** | Profesional de la nutrición responsable del acto clínico: evaluación, diagnóstico y prescripción. |
| **Provenance (Procedencia)** | Origen de una entrada de diario: fotografía, registro manual o declaración fuera del plan. |
| **Review Item (Ítem de revisión)** | Señal de seguimiento que llega a la bandeja del profesional y espera una decisión humana. |
| **Self Weigh In (Autopesaje)** | Pesaje realizado por el paciente en casa con protocolo declarado; no tiene autoridad clínica por sí solo. |
| **Weight Trend (Tendencia de peso)** | Suavizado estadístico (media móvil) de los autopesajes; único formato en que el peso del paciente se presenta. |

## Abreviaturas y acrónimos

| Sigla | Significado | Descripción breve |
|---|---|---|
| **ACL** | Anticorruption Layer | Capa de traducción entre un modelo propio y uno externo. |
| **API** | Application Programming Interface | Contrato que permite la comunicación entre sistemas de software. |
| **BC** | Bounded Context | Frontera explícita de un modelo de dominio. |
| **BFF** | Backend for Frontend | Servicio que compone datos para una interfaz específica. |
| **C4** | Context, Containers, Components, Code | Modelo de diagramación de arquitectura en cuatro niveles. |
| **CQRS** | Command Query Responsibility Segregation | Separación de operaciones de escritura y lectura. |
| **CRUD** | Create, Read, Update, Delete | Operaciones básicas sobre datos persistentes. |
| **DDD** | Domain-Driven Design | Diseño guiado por el dominio del negocio. |
| **DI** | Dependency Injection | Inyección de dependencias. |
| **DTO** | Data Transfer Object | Objeto que transporta datos entre capas o sistemas. |
| **EF Core** | Entity Framework Core | ORM de la plataforma .NET. |
| **HTTP / HTTPS** | Hypertext Transfer Protocol (Secure) | Protocolo de comunicación web, en su versión cifrada con TLS. |
| **IA / AI** | Inteligencia Artificial / Artificial Intelligence | Capacidad de un sistema de realizar tareas que requieren inferencia, como estimar porciones desde una imagen. |
| **IAM** | Identity and Access Management | Gestión de identidades, autenticación y autorización. |
| **ID** | Identifier | Identificador único de un registro o agregado. |
| **JSON** | JavaScript Object Notation | Formato ligero de intercambio de datos. |
| **JWT** | JSON Web Token | Token firmado que transporta claims de identidad y rol. |
| **LINQ** | Language Integrated Query | Sintaxis de consultas integrada en C#. |
| **ML** | Machine Learning | Aprendizaje automático. |
| **MVP** | Minimum Viable Product | Versión mínima del producto que permite validar hipótesis con usuarios reales. |
| **OHS** | Open Host Service | Servicio publicado para ser consumido por otros contextos. |
| **ORM** | Object-Relational Mapping | Técnica que mapea objetos a tablas relacionales. |
| **PK** | Primary Key | Clave primaria de una tabla. |
| **QR** | Quick Response code | Código bidimensional usado para redimir la invitación durante la consulta. |
| **REST** | Representational State Transfer | Estilo arquitectónico para APIs basadas en recursos y HTTP. |
| **SEO** | Search Engine Optimization | Optimización para motores de búsqueda. |
| **SMART** | Specific, Measurable, Attainable, Relevant, Time-bound | Criterios para formular objetivos. |
| **SQL** | Structured Query Language | Lenguaje de consulta de bases de datos relacionales. |
| **UI** | User Interface | Interfaz de usuario. |
| **UML** | Unified Modeling Language | Lenguaje unificado de modelado. |
| **US** | User Story | Historia de usuario. |
| **USDA** | United States Department of Agriculture | Departamento de Agricultura de EE. UU., proveedor de FoodData Central. |
| **UTC** | Coordinated Universal Time | Tiempo universal coordinado, referencia horaria del servidor. |
| **UX** | User Experience | Experiencia de usuario. |
| **VO** | Value Object | Objeto de valor inmutable. |
| **WCAG** | Web Content Accessibility Guidelines | Pautas internacionales de accesibilidad web. |

<div style="page-break-after: always"></div>
