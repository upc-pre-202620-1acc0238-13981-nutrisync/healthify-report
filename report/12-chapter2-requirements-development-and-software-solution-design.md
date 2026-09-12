# CAPÍTULO II: REQUIREMENTS DEVELOPMENT AND SOFTWARE SOLUTION DESIGN

## 2.1. Competidores

El mercado de plataformas digitales de nutrición presenta una oferta consolidada tanto a nivel global como regional, con actores que abordan el seguimiento nutricional desde distintos ángulos, ya sea el expediente clínico, la gestión integral de la práctica profesional o el ajuste automático de metas para el consumidor final. Sin embargo, ninguno de los productos existentes combina el registro fotográfico del consumo con el contraste entre lo declarado por el paciente y su respuesta corporal dentro de un vínculo clínico supervisado, que es precisamente el espacio que Healthify busca ocupar. Tras un proceso de investigación del landscape competitivo, se identificaron tres competidores cuyas propuestas de valor se solapan parcial o totalmente con la de Healthify.

Nutrimind es un software de nutrición clínica en línea con fuerte penetración en Latinoamérica, incluido el Perú. Su propuesta central es el expediente clínico completo, la evaluación antropométrica y el diseño de planes alimentarios, complementado con una aplicación que permite al paciente registrar actividad física y adjuntar fotografías de sus comidas. Es la herramienta que el profesional entrevistado declara utilizar actualmente en su práctica, lo que confirma su adopción real dentro del segmento objetivo de Healthify.

Nutrium es una plataforma de gestión de la práctica nutricional con presencia internacional, dirigida a dietistas y nutricionistas. Integra la evaluación del paciente, la planificación de menús, la agenda de citas y la mensajería directa dentro de una aplicación móvil de seguimiento, ofreciendo así una solución integral para la administración diaria de la consulta profesional.

MacroFactor es una aplicación de seguimiento nutricional dirigida al consumidor final, sin intervención de un profesional de la salud. Su diferencial es un algoritmo adaptativo que estima el gasto energético total a partir de la relación entre la ingesta registrada y la tendencia de peso del usuario, ajustando las metas calóricas de forma semanal. Constituye un competidor indirecto relevante porque valida técnicamente el mismo mecanismo de contraste entre lo declarado y la respuesta corporal que Healthify incorpora, aunque prescindiendo por completo del profesional que en Healthify conserva la decisión clínica.

### 2.1.1. Análisis competitivo

<table>
<tr>
<th colspan="6" style="text-align:center;">Competitive Analysis Landscape</th>
</tr>
<tr>
<td colspan="2"><strong>¿Por qué llevar a cabo este análisis?</strong></td>
<td colspan="4">¿Qué resuelven actualmente las plataformas digitales de nutrición para el vínculo entre el nutricionista y su paciente, y en qué aspecto específico del periodo entre consultas puede Healthify diferenciarse de manera sostenible?</td>
</tr>
<tr>
<td colspan="2"> Nombre y Logo</td>
<td align="center"><img src="../assets/img/chapter2/healthify-logo.png" alt="Healthify Logo" width="100"><br><strong>Healthify</strong><br><em></em></td>
<td align="center"><img src="../assets/img/chapter2/nutrimind-logo.jpg" alt="Nutrimind Logo" width="100"><br><strong>Nutrimind</strong><br><em></em></td>
<td align="center"><img src="../assets/img/chapter2/nutrium-logo.png" alt="Nutrium Logo" width="100"><br><strong>Nutrium</strong><br><em></em></td>
<td align="center"><img src="../assets/img/chapter2/macrofactor-logo.png" alt="MacroFactor Logo" width="100"><br><strong>MacroFactor</strong><br><em></em></td>
</tr>
<tr>
<td rowspan="2">Perfil</td>
<td>Overview</td>
<td>Aplicación móvil que conecta al paciente en tratamiento nutricional con su nutricionista, enfocada en capturar de forma fiel el consumo diario durante el periodo que transcurre entre consultas.</td>
<td>Software de nutrición clínica en línea con amplia adopción entre profesionales de Latinoamérica, orientado a gestionar el expediente clínico, la antropometría y el diseño de planes alimentarios.</td>
<td>Plataforma de gestión de la práctica nutricional con presencia internacional, que integra evaluación, planificación de menús, agenda de citas y comunicación con el paciente en un solo lugar.</td>
<td>Aplicación de seguimiento nutricional dirigida al consumidor final, que ajusta de forma automática las metas calóricas mediante un algoritmo basado en la tendencia de peso del usuario.</td>
</tr>
<tr>
<td>Ventaja competitiva<br><em>¿Qué valor ofrece a los clientes?</em></td>
<td>Registra el consumo mediante fotografía con estimación asistida, protocoliza el autopesaje mostrando solo la tendencia y genera un índice de consistencia que el profesional interpreta sin juzgar al paciente.</td>
<td>Ofrece un expediente clínico completo y un cálculo dietético maduro, respaldados por una base de alimentos regionalizada y una adopción muy extendida entre profesionales latinoamericanos.</td>
<td>Integra la gestión completa de la práctica profesional en una sola plataforma, complementada con una aplicación móvil que facilita el diario de alimentos y la comunicación directa con el paciente.</td>
<td>Ajusta las metas energéticas con precisión mediante un algoritmo que aprende del comportamiento real del usuario, en lugar de aplicar fórmulas estáticas de cálculo calórico.</td>
</tr>
<tr>
<td rowspan="2">Perfil de Marketing</td>
<td>Mercado objetivo</td>
<td>Nutricionistas de clínica o centro de salud con carteras reducidas de pacientes, y pacientes adultos que siguen un tratamiento nutricional activo bajo seguimiento profesional vigente.</td>
<td>Nutriólogos, dietistas y estudiantes de nutrición que ejercen consulta clínica, deportiva o educativa en distintos países de Latinoamérica y España.</td>
<td>Nutricionistas y dietistas que gestionan una práctica presencial o en línea, distribuidos en un amplio número de países a nivel internacional.</td>
<td>Personas que siguen un proceso estructurado de pérdida de grasa o ganancia muscular, con perfil analítico y disposición a registrar su alimentación de forma constante.</td>
</tr>
<tr>
<td>Estrategias de marketing</td>
<td>Marketing de contenido en redes sociales dirigido de forma diferenciada a ambos segmentos, reforzado con alianzas con nutricionistas en ejercicio que actúan como puerta de entrada de sus pacientes.</td>
<td>Adopción institucional en universidades, clínicas y centros de nutrición, sostenida por la recomendación entre pares dentro de la comunidad profesional.</td>
<td>Presencia en directorios y plataformas de comparación de software profesional, con periodo de prueba gratuito como principal mecanismo de captación de nuevos usuarios.</td>
<td>Autoridad editorial construida sobre su vínculo con divulgadores de nutrición y entrenamiento basados en evidencia, reforzada con recomendación orgánica en comunidades especializadas.</td>
</tr>
<tr>
<td rowspan="3">Perfil de Producto</td>
<td>Productos &amp; Servicios</td>
<td>Aplicación móvil con dos experiencias según el rol, que incluye vinculación por código QR, evaluación y prescripción para el profesional, y registro por foto, autopesaje y expediente unificado para el paciente.</td>
<td>Expediente clínico, antropometría, cálculo de requerimientos, diseño de planes por equivalentes, base de alimentos y aplicación de seguimiento para el paciente.</td>
<td>Evaluación nutricional, planificación de menús con recetario, agenda de citas, mensajería segura y aplicación móvil de seguimiento para el paciente.</td>
<td>Registro de ingesta con base de datos verificada y lector de código de barras, cálculo adaptativo del gasto energético y analítica detallada de adherencia.</td>
</tr>
<tr>
<td>Precios &amp; Costos</td>
<td>No aplica en el alcance actual del proyecto, dado que el equipo decidió que la definición de un modelo de precios queda fuera de esta etapa de trabajo.</td>
<td>Modelo de pago único por licencia, sin suscripción recurrente, con funciones adicionales disponibles mediante suscripción opcional.</td>
<td>Modelo de suscripción mensual o anual dirigido al profesional, con periodo de prueba gratuito previo a la contratación del servicio.</td>
<td>Suscripción de once dólares con noventa y nueve centavos al mes o setenta y un dólares con noventa y nueve centavos al año, sin plan gratuito permanente.</td>
</tr>
<tr>
<td>Canales de distribución<br><em>(Web y/o Móvil)</em></td>
<td>Aplicación móvil nativa como canal principal para ambos roles, dado que las funcionalidades diferenciales dependen de la cámara y del funcionamiento sin conexión.</td>
<td>Plataforma en línea accesible desde navegador, complementada con una aplicación móvil de seguimiento para el paciente.</td>
<td>Plataforma web para el profesional y aplicación móvil para el paciente, disponible en las principales tiendas de aplicaciones.</td>
<td>Aplicación móvil disponible en las tiendas de iOS y Android como canal exclusivo de distribución.</td>
</tr>
<tr>
<td rowspan="5">Análisis SWOT</td>
<td colspan="5">Realice esto para su startup y sus competidores. Sus fortalezas deberían apoyar sus oportunidades y contribuir a lo que ustedes definen como su posible ventaja competitiva.</td>
</tr>
<tr>
<td>Fortalezas</td>
<td>La captura entre consultas es el núcleo del producto y no un módulo accesorio. El registro por fotografía reduce el costo de reportar frente al relato verbal actual, y el funcionamiento sin conexión permite registrar en el momento del consumo.</td>
<td>Base instalada muy amplia entre profesionales latinoamericanos y familiaridad consolidada con la herramienta, confirmada por el propio profesional entrevistado. Profundidad del cálculo dietético y de la evaluación antropométrica.</td>
<td>Integración completa de la gestión profesional en una sola plataforma, con alcance internacional y una aplicación móvil que reduce la dispersión de la comunicación con el paciente.</td>
<td>Precisión superior en el ajuste de metas energéticas gracias al aprendizaje sobre datos reales del usuario, con una interfaz depurada y libre de elementos de gamificación.</td>
</tr>
<tr>
<td>Debilidades</td>
<td>Marca sin reconocimiento previo y sin base instalada frente a competidores consolidados. La estimación por fotografía es aproximada y no clínica, y la adopción depende de que el profesional invite primero al paciente.</td>
<td>El periodo entre consultas sigue dependiendo del relato del paciente, sin un mecanismo que contraste lo declarado con la respuesta corporal observable.</td>
<td>Comparte con Nutrimind la dependencia del relato del paciente entre consultas, y su enfoque integral la aleja del problema específico de la calidad del dato de ingesta.</td>
<td>Ausencia total del profesional en el circuito y sin registro mediante fotografía, lo que traslada al usuario toda la carga de la búsqueda manual de alimentos.</td>
</tr>
<tr>
<td>Oportunidades</td>
<td>El seguimiento actual se apoya en canales no diseñados para ese fin, y la disposición del paciente a registrar mediante fotografía valida el mecanismo central de la propuesta.</td>
<td>Ampliar su aplicación de seguimiento hacia mecanismos de contraste entre lo declarado y la respuesta corporal, aprovechando su base instalada de profesionales.</td>
<td>Expandirse hacia mercados latinoamericanos donde su presencia es menor que la de Nutrimind, profundizando la adherencia mediante su aplicación para el paciente.</td>
<td>Incorporar una figura profesional dentro del circuito y adoptar el registro por fotografía para reducir la fricción del registro manual actual.</td>
</tr>
<tr>
<td>Amenazas</td>
<td>Nutrimind y Nutrium podrían incorporar un índice de consistencia sobre las fotografías que ya reciben, y la adopción depende de un profesional conforme con su herramienta actual.</td>
<td>Aparición de soluciones enfocadas específicamente en el periodo entre consultas que desplacen su aplicación de seguimiento hacia un rol secundario.</td>
<td>Competencia directa de Nutrimind en el mercado latinoamericano, donde este último cuenta con una adopción superior entre profesionales.</td>
<td>Regulaciones más estrictas sobre recomendaciones de salud sin intervención profesional, y entrada de plataformas que combinen precisión algorítmica con supervisión clínica.</td>
</tr>
</table>

### 2.1.2. Estrategias y tácticas frente a competidores

El análisis competitivo revela que los actores establecidos poseen ventajas claras en base instalada de profesionales, profundidad del expediente clínico y familiaridad con su herramienta. Sin embargo, ninguno ha resuelto la fidelidad del dato capturado durante el periodo que transcurre entre una consulta y la siguiente, que constituye el espacio diferencial que Healthify busca ocupar.

**Frente a Nutrimind: convivir antes que desplazar**

Nutrimind es la herramienta que el profesional entrevistado utiliza actualmente y respecto de la cual no manifiesta insatisfacción. Desplazarla exigiría igualar años de desarrollo de expediente clínico y cálculo dietético, esfuerzo que no resulta viable ni necesario en esta etapa. El posicionamiento apunta a que Healthify se integre como la pieza que resuelve el periodo que Nutrimind no cubre. Como táctica concreta, la comunicación dirigida al profesional se construirá alrededor de una pregunta que su herramienta actual no puede responder, referida a qué comió realmente el paciente durante las semanas previas a la consulta. El contenido en redes sociales ilustrará escenarios donde un paciente no progresa sin causa aparente, mostrando de qué manera un índice de consistencia ofrece una señal previa a esa situación. Paralelamente, el proceso de vinculación mediante código QR se diseñará para integrarse al flujo de trabajo existente sin exigir la migración de información histórica.

**Frente a Nutrium: competir en profundidad y no en amplitud**

Igualar la amplitud de Nutrium en gestión de agenda, planificación y comunicación no resulta estratégicamente necesario. La apuesta es profundizar de manera deliberada en un solo problema y resolverlo con un nivel de calidad que una plataforma de propósito general difícilmente alcanza. En términos tácticos, se comunicará de forma explícita el conjunto de decisiones de diseño que sostienen la calidad del dato, tales como la exhibición permanente de la confianza y la procedencia de cada estimación, la separación entre la ausencia de registro y el incumplimiento del plan, y la existencia de un mecanismo mediante el cual el paciente reporta un consumo fuera del plan sin recibir penalización visual alguna.

**Frente a MacroFactor: reubicar el algoritmo dentro del vínculo clínico**

MacroFactor demuestra que el contraste entre ingesta declarada y tendencia de peso es técnicamente viable, pero lo aplica prescindiendo por completo del profesional. Healthify no compite por el mismo usuario, dado que su segmento se define por la existencia de un tratamiento supervisado vigente. La estrategia consiste en apropiarse del mecanismo sin apropiarse de su filosofía, comunicando con claridad la distinción entre automatizar lo mecánico y automatizar el juicio clínico. El sistema propone metas mediante un cálculo determinista y auditable, mientras que el profesional acepta o sobrescribe con una razón que queda registrada, en línea con la afirmación del propio nutricionista entrevistado de que cada plan debe ser individualizado.

**Estrategia transversal en redes sociales**

Dado que el modelo de adopción de Healthify es asimétrico, ya que el paciente solo ingresa cuando el profesional lo invita, la estrategia en redes sociales opera en dos frentes diferenciados. El frente dirigido al segmento profesional se orienta a comunidades de nutricionistas, con contenido centrado en la calidad del dato de ingesta y en la interpretación de la brecha entre lo declarado y la respuesta corporal, priorizando la construcción de autoridad técnica antes que la promoción de funcionalidades. El frente dirigido al segmento de pacientes se orienta a plataformas de consumo masivo, contrastando la práctica actual de enviar fotografías y redactar explicaciones por mensajería con la posibilidad de registrar mediante un solo toque, con el propósito de generar demanda hacia el profesional. Como táctica de refuerzo se contempla el establecimiento de alianzas con nutricionistas en ejercicio y con centros de salud, quienes actúan simultáneamente como usuarios del segmento profesional y como canal de acceso a sus propias carteras de pacientes.

## 2.2. Entrevistas

### 2.2.1. Diseño de entrevistas

### 2.2.2. Registro de entrevistas

### 2.2.3. Análisis de entrevistas

## 2.3. Needfinding

Con el propósito de comprender de manera integral las necesidades, comportamientos y motivaciones de los usuarios de Healthify, se llevó a cabo un proceso de investigación cualitativa mediante entrevistas dirigidas a representantes de cada uno de los segmentos objetivo. Estas interacciones permitieron explorar la manera en que la información del tratamiento nutricional circula actualmente entre el profesional y su paciente, las dificultades asociadas al registro del consumo durante el periodo entre consultas y las limitaciones de los canales que ambas partes emplean hoy para sostener ese seguimiento. El proceso permitió reconocer tanto necesidades explícitas como implícitas, estableciendo una base sustentada en evidencia para el diseño de una solución centrada en el usuario.

### 2.3.1. User Personas

Esta sección presenta las fichas de User Persona elaboradas en UXPressia, una por cada segmento objetivo identificado. Los arquetipos se construyen a partir de las características observadas en el análisis de entrevistas y se articulan con los hallazgos del análisis competitivo. En particular, ambos arquetipos reflejan la limitación estructural detectada en las plataformas existentes, consistente en que el periodo entre consultas depende de lo que el paciente recuerda y decide reportar. El primer arquetipo representa al nutricionista de clínica o centro de salud que conduce el tratamiento, mientras que el segundo representa a la persona en tratamiento nutricional activo. 

#### Segmento 1: Nutricionista

![Willyan User Persona](../assets/img/chapter2/willyan-user-persona.png)

#### Segmento 2: Paciente en tratamiento nutricional activo

![Evelyn User Persona](../assets/img/chapter2/evelyn-user-persona.png)

### 2.3.2. User Task Matrix

Esta sección presenta el User Task Matrix correspondiente a los dos segmentos objetivo de Healthify, representados respectivamente por Willyan Guerrero, en su condición de nutricionista de centro de salud, y por Evelyn del Águila, en su condición de paciente en tratamiento nutricional activo. La matriz concentra las tareas que ambos arquetipos realizan actualmente para cumplir sus objetivos, con independencia de la existencia de la solución propuesta. Para cada tarea se consigna la frecuencia con que se ejecuta y la importancia que reviste para el usuario correspondiente.

#### Segmento 1: Nutricionista

<table>
<tr>
<th rowspan="2">Task</th>
<th colspan="2">Willyan Guerrero</th>
<th colspan="2">Entrevistado 2</th>
<th colspan="2">Entrevistado 3</th>
</tr>
<tr>
<th>Frequency</th><th>Importance</th><th>Frequency</th><th>Importance</th><th>Frequency</th><th>Importance</th>
</tr>
<tr>
<td>Evaluar nutricionalmente al paciente mediante entrevista y mediciones</td>
<td>Siempre</td><td>Alta</td><td>Pendiente</td><td>Pendiente</td><td>Pendiente</td><td>Pendiente</td>
</tr>
<tr>
<td>Establecer el diagnóstico nutricional</td>
<td>Siempre</td><td>Alta</td><td>Pendiente</td><td>Pendiente</td><td>Pendiente</td><td>Pendiente</td>
</tr>
<tr>
<td>Diseñar el plan de alimentación individualizado</td>
<td>Siempre</td><td>Alta</td><td>Pendiente</td><td>Pendiente</td><td>Pendiente</td><td>Pendiente</td>
</tr>
<tr>
<td>Realizar el monitoreo del paciente entre consultas</td>
<td>Siempre</td><td>Alta</td><td>Pendiente</td><td>Pendiente</td><td>Pendiente</td><td>Pendiente</td>
</tr>
<tr>
<td>Reconstruir los hábitos de consumo del periodo transcurrido</td>
<td>Siempre</td><td>Alta</td><td>Pendiente</td><td>Pendiente</td><td>Pendiente</td><td>Pendiente</td>
</tr>
<tr>
<td>Ajustar el plan alimentario sin cita presencial</td>
<td>Normalmente</td><td>Alta</td><td>Pendiente</td><td>Pendiente</td><td>Pendiente</td><td>Pendiente</td>
</tr>
<tr>
<td>Solicitar u otorgar equivalencias o reemplazos de alimentos</td>
<td>Normalmente</td><td>Alta</td><td>Pendiente</td><td>Pendiente</td><td>Pendiente</td><td>Pendiente</td>
</tr>
<tr>
<td>Verificar el grado de cumplimiento del plan alimentario</td>
<td>Normalmente</td><td>Alta</td><td>Pendiente</td><td>Pendiente</td><td>Pendiente</td><td>Pendiente</td>
</tr>
<tr>
<td>Programar la siguiente consulta de seguimiento</td>
<td>Siempre</td><td>Alta</td><td>Pendiente</td><td>Pendiente</td><td>Pendiente</td><td>Pendiente</td>
</tr>
<tr>
<td>Derivar al paciente a otra especialidad ante ausencia de progreso</td>
<td>A veces</td><td>Media</td><td>Pendiente</td><td>Pendiente</td><td>Pendiente</td><td>Pendiente</td>
</tr>
<tr>
<td>Compartir o revisar los resultados de análisis bioquímicos</td>
<td>A veces</td><td>Alta</td><td>Pendiente</td><td>Pendiente</td><td>Pendiente</td><td>Pendiente</td>
</tr>
<tr>
<td>Controlar el peso corporal del paciente de forma periódica</td>
<td>A veces</td><td>Media</td><td>Pendiente</td><td>Pendiente</td><td>Pendiente</td><td>Pendiente</td>
</tr>
</table>

#### Segmento 2: Paciente en tratamiento nutricional activo

<table>
<tr>
<th rowspan="2">Task</th>
<th colspan="2">Evelyn del Águila</th>
<th colspan="2">Entrevistado 2</th>
<th colspan="2">Entrevistado 3</th>
</tr>
<tr>
<th>Frequency</th><th>Importance</th><th>Frequency</th><th>Importance</th><th>Frequency</th><th>Importance</th>
</tr>
<tr>
<td>Registrar y comunicar lo consumido en cada comida</td>
<td>Siempre</td><td>Alta</td><td>Pendiente</td><td>Pendiente</td><td>Pendiente</td><td>Pendiente</td>
</tr>
<tr>
<td>Consultar el plan alimentario prescrito antes de preparar los alimentos</td>
<td>Siempre</td><td>Alta</td><td>Pendiente</td><td>Pendiente</td><td>Pendiente</td><td>Pendiente</td>
</tr>
<tr>
<td>Verificar el grado de cumplimiento del plan alimentario</td>
<td>Siempre</td><td>Alta</td><td>Pendiente</td><td>Pendiente</td><td>Pendiente</td><td>Pendiente</td>
</tr>
<tr>
<td>Reportar el consumo de alimentos ajenos al plan</td>
<td>A veces</td><td>Alta</td><td>Pendiente</td><td>Pendiente</td><td>Pendiente</td><td>Pendiente</td>
</tr>
<tr>
<td>Controlar el peso corporal de forma periódica</td>
<td>Normalmente</td><td>Media</td><td>Pendiente</td><td>Pendiente</td><td>Pendiente</td><td>Pendiente</td>
</tr>
<tr>
<td>Solicitar equivalencias o reemplazos de alimentos</td>
<td>A veces</td><td>Media</td><td>Pendiente</td><td>Pendiente</td><td>Pendiente</td><td>Pendiente</td>
</tr>
<tr>
<td>Compartir los resultados de análisis bioquímicos</td>
<td>A veces</td><td>Alta</td><td>Pendiente</td><td>Pendiente</td><td>Pendiente</td><td>Pendiente</td>
</tr>
<tr>
<td>Reconstruir los hábitos de consumo del periodo transcurrido en la consulta de seguimiento</td>
<td>A veces</td><td>Media</td><td>Pendiente</td><td>Pendiente</td><td>Pendiente</td><td>Pendiente</td>
</tr>
<tr>
<td>Programar la siguiente consulta de seguimiento</td>
<td>A veces</td><td>Media</td><td>Pendiente</td><td>Pendiente</td><td>Pendiente</td><td>Pendiente</td>
</tr>
</table>

### Análisis de User Task Matrix

El análisis de la matriz permite identificar patrones diferenciados en el comportamiento de ambos segmentos y extraer conclusiones directamente aplicables al diseño de la solución.

En el segmento profesional, las tareas críticas se concentran en las cuatro fases del proceso de atención nutricional, con particular intensidad en el monitoreo entre consultas y en la reconstrucción de los hábitos de consumo del periodo transcurrido. Esta última tarea reviste especial interés analítico, ya que el profesional la ejecuta siempre y le atribuye importancia alta, pero la realiza mediante una entrevista retrospectiva que depende por completo de lo que el paciente recuerda y decide contar. La matriz expone así, en términos de tareas observables, la limitación estructural que el análisis competitivo identificó en las plataformas existentes.

En el segmento de pacientes, las tareas de mayor frecuencia e importancia se concentran en el registro y la comunicación de lo consumido, en la consulta del plan prescrito y en la verificación del cumplimiento. La entrevista evidencia que estas tres tareas se ejecutan de forma diaria y que la paciente les asigna una relevancia alta, dado que constituyen la evidencia sobre la cual su nutricionista evalúa la intervención. Resulta especialmente significativo que el reporte de consumos ajenos al plan, aun cuando presenta una frecuencia menor, mantenga una importancia alta, lo que revela que la paciente no busca ocultar dichos episodios sino disponer de un medio ágil para comunicarlos.

Al comparar ambos segmentos, se identifican similitudes relevantes. En ambos casos existe una alta importancia asignada a la verificación del cumplimiento del plan y al intercambio de información derivada de análisis bioquímicos, aunque cada arquetipo la aborde con una granularidad distinta, ya que el profesional la valora sobre la escala del tratamiento mientras que la paciente la evalúa día a día. Asimismo, el otorgamiento y la solicitud de equivalencias constituye una tarea genuinamente compartida que hoy se resuelve mediante intercambios de mensajería sin registro estructurado. Sin embargo, ambos segmentos difieren en su enfoque predominante, ya que el profesional concentra su comportamiento en tareas de interpretación y decisión clínica, mientras que la paciente concentra el suyo en tareas de captura y comunicación del dato. Esta separación no constituye una limitación del análisis sino un principio de diseño explícito del proyecto, según el cual el paciente registra la realidad y el nutricionista la interpreta.

A partir de ello se derivan insights clave para el diseño de Healthify. En primer lugar, la reconstrucción retrospectiva de hábitos que hoy realiza el profesional debe ser sustituida por información capturada en el momento del consumo, dado que constituye la tarea de mayor importancia con menor confiabilidad actual. En segundo lugar, la tarea de registrar debe resultar menos costosa que la de omitir, dado que su frecuencia diaria la convierte en el principal punto de fricción del segmento de pacientes. En tercer lugar, las tareas compartidas entre ambos segmentos, como el otorgamiento de equivalencias y el intercambio de resultados bioquímicos, requieren un espacio común de registro que hoy no existe, dado que ambos arquetipos las resuelven mediante canales de comunicación que no fueron concebidos para conservar información clínica.

En conjunto, estos hallazgos orientan el desarrollo de Healthify hacia una solución que capture el consumo en tiempo real desde el segmento de pacientes y que traduzca esa captura en información interpretable para el segmento profesional, sustituyendo así la dependencia actual del relato y la memoria por evidencia verificable a lo largo de todo el periodo de tratamiento.


### 2.3.3. User Journey Mapping

Esta sección presenta los User Journey Maps elaborados en UXPressia, uno por cada User Persona identificado. Los diagramas corresponden a la versión As Is, es decir, ilustran el recorrido que cada segmento experimenta actualmente en la situación previa a la existencia de Healthify. El recorrido representado abarca el ciclo completo del tratamiento nutricional, desde el momento en que se establece el vínculo entre el profesional y su paciente hasta la consulta de seguimiento en la que se evalúa el progreso alcanzado. La intención de estos mapas es exponer los puntos de fricción que se producen específicamente durante el periodo que transcurre entre una consulta y la siguiente, que constituye el foco del problema abordado por el proyecto.

#### Segmento 1: Nutricionista

![Willyan User Journey Mapping](../assets/img/chapter2/willyan-user-journey-mapping.png)

#### Segmento 2: Paciente en tratamiento nutricional activo

![Evelyn User Journey Mapping](../assets/img/chapter2/evelyn-user-journey-mapping.png)

### 2.3.4. Empathy Mapping

Esta sección presenta los Empathy Maps elaborados en UXPressia para cada uno de los User Personas identificados. El proceso de elaboración se inició con la preparación de la sesión colaborativa, en la cual el equipo situó al User Persona correspondiente en el centro del artefacto y distribuyó en cada cuadrante las observaciones derivadas del análisis de entrevistas. El trabajo se orientó a responder las preguntas guía relativas a con quién se está empatizando, qué necesita hacer el usuario, qué está diciendo, qué está viendo, qué está haciendo, qué está escuchando y cómo se siente y qué piensa. Finalmente se identificaron los dolores y las ganancias a partir de las preguntas referidas a qué le preocupa, qué puede contribuir a resolver sus problemas y qué puede convencerlo de que la propuesta constituye la alternativa correcta.

#### Segmento 1: Nutricionista

![Willyan Empathy Map](../assets/img/chapter2/willyan-empathy-map.png)

#### Segmento 2: Paciente en tratamiento nutricional activo

![Evelyn Empathy Map](../assets/img/chapter2/evelyn-empathy-map.png)

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

La arquitectura de software de Healthify se representa mediante el modelo C4, aplicando tres de sus niveles de abstracción — Contexto, Contenedores y Componentes — sobre la solución completa: la aplicación móvil Flutter, el backend ASP\.NET Core, el Landing Page estático y la base de datos MySQL 8. El diseño sigue los seis Bounded Contexts identificados en el proceso estratégico de Domain-Driven Design (2.5.1 y 2.5.2), materializados aquí como módulos concretos tanto en el cliente como en el servidor. Estos tres niveles se detallan en las secciones 2.5.3.1 a 2.5.3.3; adicionalmente, se presenta en la sección 2.5.3.4 el Deployment Diagram, diagrama suplementario del modelo C4 que describe la distribución física de la solución sobre la infraestructura.

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
   - **Tecnología:** `MySQL 8`.
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

El backend se organiza en 6 Bounded Contexts y un Shared Kernel, cada uno siguiendo el patrón de arquitectura del Domain-Driven Design. Todos los Bounded Contexts comparten una única base de datos MySQL 8, accedida a través de los repositorios de Entity Framework Core en la capa de Infrastructure de cada uno.

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

El Deployment Diagram (diagrama suplementario del modelo C4, elaborado en notación UML) muestra la distribución física de Healthify sobre la infraestructura de hardware y los entornos de ejecución. Este diagrama visualiza los dispositivos, servidores y contenedores que alojan cada artefacto de software, así como los protocolos de comunicación entre ellos.

**Elementos:**

- **Patient's / Practitioner's Mobile Device:** Dispositivo físico (`<<device>>`) del usuario final, donde se instala y ejecuta el artefacto `Mobile Application (Flutter)` distribuido vía Firebase App Distribution.
- **GitHub Pages:** Entorno de ejecución (`<<execution environment>>`) que aloja el artefacto estático `Landing Page (HTML5 + CSS3 + JS)`.
- **Oracle Cloud Infrastructure:** Nodo de nube (`<<cloud>>`) que agrupa toda la infraestructura del backend.
   - **Compute Instance:** Máquina virtual que hospeda el `Docker Engine`.
   - **Docker Engine:** Entorno de ejecución de contenedores, dentro del cual corren dos contenedores aislados entre sí:
      - **API Container:** Contenedor que aloja el artefacto `API Application (ASP.NET Core)`.
      - **Database Container:** Contenedor que aloja la base de datos `MySQL 8`.

**Relaciones:**

- `Mobile Device → Oracle Cloud Infrastructure` (`JSON/HTTPS`): la aplicación móvil consume la API RESTful del backend.
- `Mobile Device → GitHub Pages` (`HTTPS`): el dispositivo accede al Landing Page como contenido estático.
- `API Application → Database` (`SQL/TCP`): la API se conecta a MySQL 8 a través de la red interna de Docker, pese a correr en contenedores independientes.

![Deployment Diagram](../assets/img/artifacts/healthify-DeploymentDiagram.png)

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
