# CAPÍTULO III: SOLUTION UI/UX DESIGN

## 3.1. Product design

### 3.1.1. Style Guidelines

#### 3.1.1.1. General Style Guidelines

Healthify comunica con un tono **sereno, claro y sin juicio**. Su propuesta es que el seguimiento entre consultas sea fácil de sostener para el paciente y confiable para el nutricionista, y el lenguaje debe reflejarlo. Las decisiones de tono se resumen en las cuatro dimensiones que pide la guía del curso:

<p class="caption"><strong>Tabla 173</strong><br><em>Decisiones de tono de voz de Healthify</em></p>

| Dimensión | Decisión | Sustento |
|---|---|---|
| Divertido / Serio | **Serio con calidez**. Se evita el humor y los emojis en la información clínica (metas, peso, diagnósticos). | Healthify maneja datos de salud; una broma sobre el peso puede herir y restar credibilidad ante el profesional. |
| Formal / Casual | **Casual con el paciente, formal con el nutricionista**. La app y el landing tutean al paciente («Registra en segundos, sin culpa») y tratan de «usted» al nutricionista («La señal notifica, usted decide»). | Cada rol tiene un vínculo distinto con el producto: el paciente lo usa a diario y necesita cercanía; el nutricionista lo usa como herramienta clínica. |
| Respetuoso / Irreverente | **Respetuoso**. Sin reproches ni culpa: los avisos dicen «Algo no cuadra» o «Te extrañamos por acá», no «incumpliste». | La adherencia cae cuando el paciente se siente juzgado; la tendencia importa más que la cifra de un día. |
| Entusiasta / Sereno | **Sereno**, con entusiasmo moderado solo en los logros (plan publicado, comida registrada). | Una interfaz clínica transmite confianza cuando es estable y predecible. |

El principal principio que sustenta el diseño es que **la IA sugiere y el profesional decide**. Por eso toda sugerencia automática se marca con una insignia de IA (`AiBadge`) y nunca se presenta como una orden. La guía se apoya además en los principios de **jerarquía visual** (una sola acción primaria por pantalla), **consistencia** (un mismo componente para un mismo propósito), **accesibilidad** (contraste de texto ≥ 4.5:1 y de elementos no textuales ≥ 3:1) y **feedback inmediato** (estados de carga, sin conexión y error en cada pantalla).

Como base se adoptó **Material Design 3** y se adaptó a la marca: se conservan sus roles de color, escala tipográfica y componentes, pero se reemplazan los valores por los de Healthify. El resultado es el sistema de diseño «Healthify M3», publicado en la página *Mockup* del archivo de Figma del proyecto y reutilizado tal cual por el landing page y por la aplicación móvil.

**Branding**

El nombre **Healthify** combina *health* (salud) con el sufijo *-ify* («hacer»), y comunica la idea de volver práctico el cuidado de la salud. El logotipo une un corazón con una hoja: el corazón evoca el cuidado clínico y la hoja la alimentación. Junto al logotipo, la palabra *healthify* se escribe en minúsculas con la terminación «ify» resaltada en color lima, recurso que el landing page y la aplicación reutilizan. El sistema define tres versiones: **sobre negro** (blanca, usada en el encabezado del landing page), **sobre blanco (mono)** y **a color (marca)**.

<p class="caption"><strong>Figura 113</strong><br><em>Versiones del logo de Healthify: sobre negro, sobre blanco mono y a color</em></p>

<p align="center">
  <img src="../assets/img/chapter3/style-guidelines/brand.png" alt="Versiones del logo de Healthify: sobre negro, sobre blanco mono y a color" width="640" />
</p>

La marca se apoya en dos contrastes: un fondo oscuro casi negro, que da seriedad al landing page, y el acento lima y naranja, que aporta energía y orienta la mirada hacia las acciones.

**Typography**

Se utilizan dos familias de Google Fonts: **Anton** para títulos y cifras destacadas, y **Open Sans** para todo lo demás.

- **Anton** es una sans-serif condensada de gran impacto. Se aplica a los niveles *Display*, *Headline* y *Title Large*, y a las métricas (por ejemplo «1 260 / 1 850 kcal»). Su peso permite que el dato principal se lea de un vistazo, incluso en pantallas pequeñas.
- **Open Sans** es una sans-serif humanista, muy legible en textos largos y tamaños pequeños. Se emplea en el cuerpo, las etiquetas, los botones y los campos de formulario, con pesos 400 (regular), 600 (semibold) y 700 (bold).

La escala tipográfica usa tamaños enteros en sp (mínimo 12 sp para cuerpo y 11 sp para etiquetas), de modo que el texto respete el tamaño de fuente del sistema del usuario:

<p class="caption"><strong>Tabla 174</strong><br><em>Escala tipográfica del sistema de diseño</em></p>

| Estilo | Fuente | Tamaño / interlineado | Uso |
|---|---|---|---|
| Display / Small | Anton | 36 / 44 sp | Títulos de bienvenida |
| Headline / Medium | Anton | 28 / 36 sp | Título de pantalla |
| Headline / Small | Anton | 24 / 32 sp | Título de sección |
| Title / Large | Anton | 22 / 28 sp | Título de tarjeta |
| Title / Medium · Small | Open Sans SemiBold | 16 / 24 y 14 / 20 sp | Subtítulos y filas de lista |
| Body / Large · Medium · Small | Open Sans Regular | 16 / 24, 14 / 20 y 12 / 16 sp | Texto corrido y apoyo |
| Label / Large · Medium · Small | Open Sans SemiBold | 14 / 20, 12 / 16 y 11 / 16 sp | Etiquetas, chips y barra inferior |
| Button / Large | Open Sans Bold | 16 / 24 sp | Botones |
| Overline / Section | Open Sans Bold | 12 / 16 sp, espaciado 0.5 | Encabezados de grupo («GESTIÓN») |
| Metric / Large · Medium | Anton | 32 / 40 y 22 / 28 sp | Cifras (kcal, peso, días cumplidos) |

**Colors**

La paleta se organiza por roles de Material 3 y está pensada para transmitir salud y naturaleza, con un acento cálido que guía las acciones.

- **Verde (`primary` `#3B6E23`)**: color de marca. Se usa en la navegación activa, enlaces, encabezados de grupo e íconos de énfasis. Sus variantes son `primaryContainer` (`#E5F5D1`, fondo del ítem activo y de los chips «Vigente»), `onPrimaryContainer` (`#24461A`) y `brand/decor` (`#4C8F2F`), este último solo decorativo.
- **Naranja (`secondary` `#F5A623`)**: color de acción. Se reserva a **una acción principal por pantalla** («Registrar comida», «Invitar paciente», «Iniciar consulta»). Su contenedor (`#FFF1D6`) y su texto (`#7A4A00`) se usan en avisos.
- **Lima (`tertiary` `#A3D437`)**: acento para énfasis visuales en el landing page y en gráficos. Nunca se usa como color de texto sobre fondos claros por su bajo contraste.
- **Neutros**: crema `#F6F4EE` como fondo (`surface`), blanco `#FFFFFF` para tarjetas, `#1C1C1A` para el texto principal, `#5C5C57` para el texto secundario y `#D6D7C7` para bordes y separadores. El landing page añade el fondo oscuro `#101109`.
- **Error (`#B3261E`)** con su contenedor `#FCE8E4`: se reserva para errores de validación y fallas.

<p class="caption"><strong>Figura 114</strong><br><em>Paleta de colores por roles del sistema de diseño Healthify M3</em></p>

<p align="center">
  <img src="../assets/img/chapter3/style-guidelines/colors.png" alt="Paleta de colores por roles del sistema de diseño Healthify M3" />
</p>

**Spacing**

El espaciado sigue una escala de **múltiplos de 4 y 8 dp**: 0, 4, 8, 12, 16, 24, 32, 40, 48 y 64. Los radios de borde son 8 dp (campos y elementos pequeños), 12 dp (tarjetas), 16 dp (módulos destacados) y 24 dp (contenedores grandes); los diálogos y hojas inferiores usan 28 dp, y los botones y chips en forma de píldora usan un radio completo. En la aplicación móvil, el margen lateral de pantalla es de 16 dp (frame de referencia de 360 × 800), los botones y campos miden 56 dp de alto y el área táctil mínima es de 48 dp. En el landing page, el contenedor tiene un ancho máximo de 1200 px con 24 px de margen lateral, y la barra de navegación mide 76 px de alto.

<p class="caption"><strong>Figura 115</strong><br><em>Fundamentos del sistema de diseño Healthify M3: color, tipografía y espaciado</em></p>

<p align="center">
  <img src="../assets/img/chapter3/style-guidelines/foundations.png" alt="Fundamentos del sistema de diseño Healthify M3: color, tipografía y espaciado" width="620" />
</p>

### 3.1.2. Information Architecture

La arquitectura de información de Healthify atiende dos experiencias distintas: el **landing page**, un sitio estático dirigido a nutricionistas que evalúan la herramienta y a pacientes invitados, y la **aplicación móvil**, usada a diario por dos roles, **paciente** y **nutricionista**, cada uno con su propio conjunto de pantallas.

#### 3.1.2.1. Organization Systems

**Landing Page**

Se aplica una **organización jerárquica** (visual hierarchy). La página principal ordena sus secciones de mayor a menor peso en la decisión del visitante:

1. Héroe (carrusel con propuesta de valor, video del producto y del equipo)
2. Problema que resuelve Healthify
3. Para el paciente
4. Para el nutricionista
5. Cómo funciona
6. Preguntas frecuentes
7. Pie de página (navegación, legal, redes y contacto)

La secuencia sigue un recorrido de persuasión: se plantea el problema, se muestra la solución para cada rol y se resuelven las dudas antes de invitar a la acción. Dentro de «Cómo funciona» se usa una **organización secuencial** (paso a paso) en cuatro pasos: *Medición de hoy*, *Diagnóstico con apoyo de IA*, *Metas calculadas* e *Indicaciones y publicación*. Las páginas secundarias (Nosotros, Contacto y Términos y condiciones) se organizan **por tópicos**: historia, misión y visión, valores y equipo en Nosotros; datos de contacto y formulario en Contacto; y una cláusula por tema en Términos.

La categorización del contenido combina dos esquemas: **según audiencia** (secciones «Paciente» y «Nutricionista», con el mismo patrón de presentación para comparar) y **por tópicos** en las preguntas frecuentes, filtradas por *Todas*, *Pacientes*, *Nutricionistas*, *Privacidad* e *IA*.

**Aplicación móvil**

Los módulos de la aplicación se agrupan **según audiencia** (paciente o nutricionista) y, dentro de cada rol, **por tópicos** mediante la barra de navegación inferior. En cada pantalla se combinan tres sistemas:

<p class="caption"><strong>Tabla 175</strong><br><em>Sistemas de organización de la información</em></p>

| Sistema | Dónde se aplica |
|---|---|
| **Jerárquico** | *Inicio* del paciente: primero la meta del día (calorías y macros) y el botón naranja «Registrar comida», y debajo «Cómo voy hoy», «Próxima consulta» y avisos. En la ficha del paciente (nutricionista): identidad y estado del plan, próxima consulta, indicadores desde la última consulta y, al final, las acciones de gestión. |
| **Secuencial** | Registro de cuenta (elegir rol, completar datos); vinculación (escanear invitación, consentimiento y alcance); registro por foto (cámara, previsualización, estimación propuesta, confirmar o ajustar); y la **consulta guiada** del nutricionista en cuatro pasos (medición, diagnóstico con IA, metas, indicaciones y publicación). |
| **Matricial** | Las tarjetas de indicadores en pares, como «Peso (autopesaje)» y «Cumplimiento» en la ficha del paciente, y la cuadrícula de proteína, carbohidratos y grasa en Inicio, que permiten comparar métricas de un vistazo. |

Para ordenar listas se usan dos criterios de categorización: **cronológico** (el diario por día, las próximas consultas en la agenda, la bandeja por fecha de recepción y las versiones del plan de la más reciente a la más antigua) y **por estado** (ítems de revisión abiertos o resueltos, vínculo vigente o dado de alta, consulta próxima o completada). La cartera de pacientes se presenta por vínculo, con la fecha desde la que el paciente está vinculado.

#### 3.1.2.2. Labelling Systems

Las etiquetas de Healthify son **breves (una o dos palabras), en español neutro y con el vocabulario del usuario**: se evitan términos técnicos como *care link* o *review item*, y se dice «Vinculación» y «Señal». Cada etiqueta de navegación se acompaña de un ícono del sistema para reconocerla sin leer. El landing page admite además la versión en inglés (ES / EN).

**Landing Page**

<p class="caption"><strong>Tabla 176</strong><br><em>Sistema de etiquetado: Landing Page</em></p>

| Etiqueta | Contenido que representa |
|---|---|
| Paciente | Funcionalidades para el paciente: registro por foto, tendencia, plan y consultas |
| Nutricionista | Funcionalidades para el profesional: señales, consulta guiada y publicación del plan |
| Cómo funciona | Los cuatro pasos de la consulta guiada y el seguimiento entre citas |
| Nosotros | Historia, misión, visión, valores y equipo |
| Contacto | Correo, teléfono y formulario para escribir al equipo |
| Iniciar sesión | Acceso a la aplicación |
| Soy nutricionista | Acción principal: solicitar la prueba de la herramienta |
| ES / EN | Selector de idioma |

**Aplicación del paciente**

<p class="caption"><strong>Tabla 177</strong><br><em>Sistema de etiquetado: Aplicación del paciente</em></p>

| Etiqueta | Contenido que representa |
|---|---|
| Inicio | Meta del día, registro rápido, «Cómo voy hoy», próxima consulta y avisos |
| Diario | Comidas registradas por día, ideas para hoy y pendientes de enviar |
| Progreso | Tendencia de peso, autopesaje y «Tu semana» (resumen con IA) |
| Expediente | Mis números, mi plan y mis consultas |
| Ajustes | Cuenta, idioma, funciones con IA, recordatorios, consentimiento y cierre de sesión |

**Aplicación del nutricionista**

<p class="caption"><strong>Tabla 178</strong><br><em>Sistema de etiquetado: Aplicación del nutricionista</em></p>

| Etiqueta | Contenido que representa |
|---|---|
| Pacientes | Cartera de pacientes vinculados e invitación de nuevos pacientes |
| Bandeja | Señales por revisar (por ejemplo «desviación sostenida» o «señal de consistencia») |
| Agenda | Próximas consultas, agendar, reprogramar y cancelar |
| Ajustes | Cuenta, idioma y cierre de sesión |
| Resumen · Seguimiento · Expediente · Plan | Pestañas de la ficha de cada paciente |

Los títulos dentro de cada pantalla mantienen la misma concisión («Mis pacientes», «Bandeja», «Registrar a mano», «Buscar alimento») y los botones comienzan con un verbo («Invitar paciente», «Iniciar consulta», «Registrar comida»). Las imágenes e íconos llevan texto alternativo para lectores de pantalla.

#### 3.1.2.3. SEO Tags and Meta Tags

#### 3.1.2.4. Searching Systems

#### 3.1.2.5. Navigation Systems

### 3.1.3. Landing Page UI Design

#### 3.1.3.1. Landing Page Wireframe

#### 3.1.3.2. Landing Page Mock-up

### 3.1.4. Mobile Applications UX/UI Design

#### 3.1.4.1. Mobile Applications Wireframes

#### 3.1.4.2. Mobile Applications Wireflow Diagrams

#### 3.1.4.3. Mobile Applications Mock-ups

#### 3.1.4.4. Mobile Applications User Flow Diagrams

#### 3.1.4.5. Mobile Applications Prototyping

<div style="page-break-after: always"></div>
