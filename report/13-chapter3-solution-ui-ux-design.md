# CAPÍTULO III: SOLUTION UI/UX DESIGN

## 3.1. Product design

### 3.1.1. Style Guidelines

#### 3.1.1.1. General Style Guidelines

Healthify comunica con un tono **sereno, claro y sin juicio**. Su propuesta es que el seguimiento entre consultas sea fácil de sostener para el paciente y confiable para el nutricionista, y el lenguaje debe reflejarlo. Las decisiones de tono se resumen en las cuatro dimensiones que pide la guía del curso:

<p class="caption"><strong>Tabla 173</strong><br><em>Decisiones de tono de voz de Healthify</em></p>

| Dimensión | Decisión | Sustento |
|---|---|---|
| Divertido / Serio | **Serio con calidez**. Se evita el humor y los emojis en la información clínica (metas, peso, diagnósticos). | Healthify maneja datos de salud; una broma sobre el peso puede herir y restar credibilidad ante el profesional. |
| Formal / Casual | **Casual en la app, formal con el nutricionista en el landing page**. La app tutea a los dos roles («Hace unos días que no registras nada», «Invita a tu primer paciente»). El landing page, dirigido sobre todo al nutricionista, lo trata de «usted» («Cree su cuenta e invite a su primer paciente hoy») y tutea al paciente invitado («¿Te invitó tu nutricionista?»). | Cada rol tiene un vínculo distinto con el producto: el paciente lo usa a diario y necesita cercanía; el nutricionista conoce Healthify en el landing page como una herramienta profesional. |
| Respetuoso / Irreverente | **Respetuoso**. Sin reproches ni culpa: los avisos dicen «Algo no cuadra» o «Hace unos días que no registras nada. ¿Quieres ponerte al día?», no «incumpliste». | La adherencia cae cuando el paciente se siente juzgado; la tendencia importa más que la cifra de un día. |
| Entusiasta / Sereno | **Sereno**, con entusiasmo moderado solo en los logros (plan publicado, comida registrada). | Una interfaz clínica transmite confianza cuando es estable y predecible. |

El principal principio que sustenta el diseño es que **la IA sugiere y el profesional decide**. Por eso toda sugerencia automática se marca con una insignia de IA (`AiBadge`) y nunca se presenta como una orden. La guía se apoya además en los principios de **jerarquía visual** (una sola acción primaria por pantalla), **consistencia** (un mismo componente para un mismo propósito), **accesibilidad** (contraste de texto ≥ 4.5:1 y de elementos no textuales ≥ 3:1) y **feedback inmediato** (estados de carga, sin conexión y error en cada pantalla).

Como base se adoptó **Material Design 3** y se adaptó a la marca: se conservan sus roles de color, escala tipográfica y componentes, pero se reemplazan los valores por los de Healthify. El resultado es el sistema de diseño «Healthify M3», publicado en la página *Mockup* del archivo de Figma del proyecto y reutilizado tal cual por el landing page y por la aplicación móvil.

**Branding**

El nombre **Healthify** combina *health* (salud) con el sufijo *-ify* («hacer»), y comunica la idea de volver práctico el cuidado de la salud. El logotipo une un corazón con una hoja: el corazón evoca el cuidado clínico y la hoja la alimentación. Junto al logotipo, el nombre *Healthify* se escribe en Anton. El sistema define tres versiones del logotipo: **sobre negro** (blanca; el landing page la usa en el encabezado y el pie, sobre verde oscuro), **sobre blanco (mono)** y **a color (marca)**.

<p class="caption"><strong>Figura 114</strong><br><em>Versiones del logo de Healthify: sobre negro, sobre blanco mono y a color</em></p>

<p align="center">
  <img src="../assets/img/chapter3/style-guidelines/brand.png" alt="Versiones del logo de Healthify: sobre negro, sobre blanco mono y a color" width="640" />
</p>

La marca se apoya en dos contrastes: el verde oscuro `#24461A`, que da seriedad a las secciones principales del landing page, y el acento lima y naranja, que aporta energía y orienta la mirada hacia las acciones.

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

El landing page usa las mismas dos familias con una escala propia, tomada de los estilos de texto *Web/* y *Mobile/* de Figma. Anton va de 128 a 32 px en escritorio (*Display XL* a *Title M*) y de 48 a 24 px en móvil; Open Sans se usa en 20, 18, 16 y 14 px para el cuerpo, las etiquetas y los botones.

**Colors**

La paleta se organiza por roles de Material 3 y está pensada para transmitir salud y naturaleza, con un acento cálido que guía las acciones.

- **Verde (`primary` `#3B6E23`)**: color de marca. Se usa en la navegación activa, enlaces, encabezados de grupo e íconos de énfasis. Sus variantes son `primaryContainer` (`#E5F5D1`, fondo del ítem activo y de los chips «Vigente»), `onPrimaryContainer` (`#24461A`) y `brand/decor` (`#4C8F2F`), este último solo decorativo.
- **Naranja (`secondary` `#F5A623`)**: color de acción. Se reserva a **una acción principal por pantalla** («Registrar», «Invitar paciente», «Iniciar consulta»). Su contenedor (`#FFF1D6`) y su texto (`#7A4A00`) se usan en avisos.
- **Lima (`tertiary` `#A3D437`)**: acento para énfasis visuales en el landing page y en gráficos. Nunca se usa como color de texto sobre fondos claros por su bajo contraste.
- **Neutros**: crema `#F6F4EE` como fondo (`surface`), blanco `#FFFFFF` para tarjetas, `#1C1C1A` para el texto principal, `#5C5C57` para el texto secundario y `#D6D7C7` para bordes y separadores.
- **Landing page**: no agrega colores de marca, sino que combina los de la app por secciones. Usa `green/900` (`#24461A`) en el encabezado, el héroe, la sección del nutricionista y el pie; `green/700` (`#3B6E23`) en la llamada final; `green/100` (`#E5F5D1`) en la sección del paciente; y lima claro `#B8E07A` para el texto de apoyo y el anillo de foco sobre verde oscuro.
- **Error (`#B3261E`)** con su contenedor `#FCE8E4`: se reserva para errores de validación y fallas.

<p class="caption"><strong>Figura 115</strong><br><em>Paleta de colores por roles del sistema de diseño Healthify M3</em></p>

<p align="center">
  <img src="../assets/img/chapter3/style-guidelines/colors.png" alt="Paleta de colores por roles del sistema de diseño Healthify M3" />
</p>

**Spacing**

El espaciado sigue una escala de **múltiplos de 4 y 8 dp**: 0, 4, 8, 12, 16, 24, 32, 40, 48 y 64. Los radios de borde son 8 dp (campos y elementos pequeños), 12 dp (tarjetas), 16 dp (módulos destacados) y 24 dp (contenedores grandes); los diálogos y hojas inferiores usan 28 dp, y los botones y chips en forma de píldora usan un radio completo. En la aplicación móvil, el margen lateral de pantalla es de 16 dp (frame de referencia de 360 × 800), los botones y campos miden 56 dp de alto y el área táctil mínima es de 48 dp. En el landing page, el contenedor tiene un ancho máximo de 1200 px con 24 px de margen lateral, el encabezado mide 64 px de alto (88 px desde 1200 px de ancho) y, en escritorio, cada sección de Inicio y Nosotros ocupa al menos una pantalla (900 px de alto en 1440 × 900).

<p class="caption"><strong>Figura 116</strong><br><em>Fundamentos del sistema de diseño Healthify M3: color, tipografía y espaciado</em></p>

<p align="center">
  <img src="../assets/img/chapter3/style-guidelines/foundations.png" alt="Fundamentos del sistema de diseño Healthify M3: color, tipografía y espaciado" width="620" />
</p>

### 3.1.2. Information Architecture

La arquitectura de información de Healthify atiende dos experiencias distintas: el **landing page**, un sitio estático dirigido a nutricionistas que evalúan la herramienta y a pacientes invitados, y la **aplicación móvil**, usada a diario por dos roles, **paciente** y **nutricionista**, cada uno con su propio conjunto de pantallas.

#### 3.1.2.1. Organization Systems

**Landing Page**

Se aplica una **organización jerárquica** (visual hierarchy). La página principal ordena sus secciones de mayor a menor peso en la decisión del visitante:

1. Héroe (carrusel con la propuesta de valor, el video del equipo y el video del producto)
2. Propuesta de valor (lo que el nutricionista ve en la ficha del paciente)
3. La consulta, paso a paso
4. Entre citas (señales de la bandeja)
5. Para nutricionistas
6. Para pacientes
7. Prueba social (testimonios y criterio clínico)
8. Llamada final a la acción
9. Pie de página (producto, empresa, legal y contacto)

La secuencia está pensada para el nutricionista, que es quien decide adoptar la herramienta. Primero ve el resultado (los registros de su paciente en la ficha), luego cómo trabaja en consulta y entre citas, después todo lo que incluye y lo que verá su paciente, y al final los testimonios y la invitación a descargar la app. Dentro de «La consulta, paso a paso» se usa una **organización secuencial** en cuatro pasos: *Medición de hoy*, *Diagnóstico con IA*, *Metas calculadas* e *Indicaciones y publicación*. Las páginas secundarias se organizan **por tópicos**: historia, misión y visión, valores, equipo y preguntas frecuentes en Nosotros; tipo de consulta, formulario y otros datos de contacto en Contacto; y una cláusula por tema en Términos y condiciones.

La categorización del contenido combina dos esquemas: **según audiencia** (secciones «Para nutricionistas» y «Para pacientes») y **por tópicos** en las preguntas frecuentes de Nosotros, filtradas por *Todas*, *Pacientes*, *Nutricionistas*, *Privacidad* e *IA*.

**Aplicación móvil**

Los módulos de la aplicación se agrupan **según audiencia** (paciente o nutricionista) y, dentro de cada rol, **por tópicos** mediante la barra de navegación inferior. En cada pantalla se combinan tres sistemas:

<p class="caption"><strong>Tabla 175</strong><br><em>Sistemas de organización de la información</em></p>

| Sistema | Dónde se aplica |
|---|---|
| **Jerárquico** | *Inicio* del paciente: primero el medidor de energía con las kcal que quedan hoy y los macros, luego «Tu semana» con los días registrados, y debajo «Cómo voy hoy», «Próxima consulta» y los avisos. En la ficha del paciente (nutricionista): identidad y estado del plan, próxima consulta, indicadores desde la última consulta, las acciones de gestión y el botón «Iniciar consulta» fijo al pie. |
| **Secuencial** | Registro de cuenta (elegir rol, completar datos y aceptar los términos); recuperación de contraseña (correo, código de 6 dígitos y contraseña nueva); vinculación (escanear invitación, consentimiento y alcance); registro por foto (cámara, previsualización, estimación propuesta, confirmar o ajustar); y la **consulta guiada** del nutricionista en cuatro pasos (medición, diagnóstico con IA, metas, indicaciones y publicación). |
| **Matricial** | Las tarjetas de indicadores en pares, como «Peso (autopesaje)» y «Cumplimiento» en la ficha del paciente, la fila de proteína, carbohidrato y grasa bajo el medidor de Inicio y los siete días de «Tu semana», que permiten comparar métricas de un vistazo. |

Para ordenar listas se usan dos criterios de categorización: **cronológico** (el diario por día, las próximas consultas en la agenda, la bandeja por fecha de recepción y las versiones del plan de la más reciente a la más antigua) y **por estado** (ítems de revisión abiertos o resueltos, vínculo vigente o dado de alta, consulta próxima o completada). La cartera de pacientes se divide en dos grupos por estado: «Requieren acción» (señal por revisar, consulta por terminar, faltan datos base o falta publicar el plan) y «Al día».

#### 3.1.2.2. Labelling Systems

Las etiquetas de Healthify son **breves (una o dos palabras), en español neutro y con el vocabulario del usuario**: se evitan términos técnicos como *care link* o *review item*, y se dice «Vinculación» y «Señal». Cada etiqueta de navegación se acompaña de un ícono del sistema para reconocerla sin leer. El landing page admite además la versión en inglés (ES / EN).

**Landing Page**

<p class="caption"><strong>Tabla 176</strong><br><em>Sistema de etiquetado: Landing Page</em></p>

| Etiqueta | Contenido que representa |
|---|---|
| Inicio | Página principal |
| Cómo funciona | Ancla a «La consulta, paso a paso»: los cuatro pasos de la consulta guiada |
| Para pacientes | Ancla a «Lo que verá su paciente»: registro por foto, plan y peso como tendencia |
| Nosotros | Historia, misión y visión, valores, equipo y preguntas frecuentes |
| Contacto | Tipo de consulta, formulario y otros datos de contacto |
| Descargar para Android | Acción principal: descarga de la app desde Firebase App Distribution (Android 7.0 o superior) |
| ES / EN | Selector de idioma |

**Aplicación del paciente**

<p class="caption"><strong>Tabla 177</strong><br><em>Sistema de etiquetado: Aplicación del paciente</em></p>

| Etiqueta | Contenido que representa |
|---|---|
| Inicio | Medidor de energía del día, «Tu semana», «Cómo voy hoy», próxima consulta y avisos |
| Diario | Comidas registradas por día, ideas con IA y porciones por confirmar |
| Registrar | Botón central de la barra inferior: abre la cámara para registrar una comida |
| Peso | Tendencia de peso, autopesaje y «Tu semana» (resumen con IA) |
| Expediente | Mis números, mi plan y mis consultas |
| Menú (☰) | Mi plan, Mis consultas, Pendientes, Ajustes y Cerrar sesión |
| Ajustes | Cuenta, recordatorios, idioma, funciones con IA, cambio de nutricionista, copia de mis datos y retiro del consentimiento |

**Aplicación del nutricionista**

<p class="caption"><strong>Tabla 178</strong><br><em>Sistema de etiquetado: Aplicación del nutricionista</em></p>

| Etiqueta | Contenido que representa |
|---|---|
| Pacientes | Cartera agrupada en «Requieren acción» y «Al día», buscador de pacientes e invitación de nuevos pacientes |
| Bandeja | Señales por revisar (por ejemplo «desviación sostenida» o «señal de consistencia») |
| Agenda | Próximas consultas, agendar, reprogramar y cancelar |
| Menú (☰) | Catálogo de alimentos, Ajustes y Cerrar sesión |
| Ajustes | Cuenta e idioma |
| Resumen · Seguimiento · Expediente · Plan | Pestañas de la ficha de cada paciente |

Los títulos dentro de cada pantalla mantienen la misma concisión («Mis pacientes», «Bandeja», «Registrar a mano», «Buscar alimento») y los botones comienzan con un verbo («Invitar paciente», «Iniciar consulta», «Registrar mi peso»). Las imágenes e íconos llevan texto alternativo para lectores de pantalla.

#### 3.1.2.3. SEO Tags and Meta Tags

A continuación se detallan los valores asignados a las páginas del landing page, tomados del código del sitio. Todas las páginas incluyen `charset="UTF-8"`, `viewport`, `robots: index, follow`, `theme-color` (`#24461A`) y etiquetas Open Graph y Twitter Card para compartir el enlace, además del atributo `lang="es-419"` con `es_419` como idioma principal y `en_US` como alternativo. Las páginas no declaran la etiqueta `keywords`, que los buscadores actuales ignoran; los términos de búsqueda se trabajan en el título, la descripción y los encabezados.

**Landing Page · Inicio (`index.html`)**

<p class="caption"><strong>Tabla 179</strong><br><em>Etiquetas SEO y meta tags: Landing Page · Inicio (index.html)</em></p>

| Tag | Valor |
|---|---|
| Title | Healthify: una app para los dos lados de la consulta |
| Description | El paciente registra su comida con una foto. Su nutricionista lo ve en el seguimiento, ajusta el plan y lo publica. Los dos trabajan sobre la misma versión. |
| Author | Healthify Team |

**Landing Page · Nosotros (`about-us.html`)**

<p class="caption"><strong>Tabla 180</strong><br><em>Etiquetas SEO y meta tags: Landing Page · Nosotros (about-us.html)</em></p>

| Tag | Valor |
|---|---|
| Title | Nosotros · Healthify |
| Description | Healthify muestra qué pasa con el paciente entre una consulta y la siguiente, sin juzgarlo y sin reemplazar el criterio del nutricionista. |
| Author | Healthify Team |

**Landing Page · Contacto (`contact.html`)**

<p class="caption"><strong>Tabla 181</strong><br><em>Etiquetas SEO y meta tags: Landing Page · Contacto (contact.html)</em></p>

| Tag | Valor |
|---|---|
| Title | Contacto · Healthify |
| Description | Escríbanos: le respondemos en menos de 48 horas hábiles. Correo hola@healthify.app, teléfono +51 987 654 321. |
| Author | Healthify Team |

**Landing Page · Términos y condiciones (`terms.html`)**

<p class="caption"><strong>Tabla 182</strong><br><em>Etiquetas SEO y meta tags: Landing Page · Términos y condiciones (terms.html)</em></p>

| Tag | Valor |
|---|---|
| Title | Términos y condiciones · Healthify |
| Description | Términos y condiciones de Healthify: quién puede usarlo, consentimiento, funciones con IA y protección de datos personales. |
| Author | Healthify Team |

**Aplicación móvil (Android) · ASO (App Store Optimization)**

Healthify es una aplicación nativa de Android (`pe.edu.upc.healthify`, versión 2.0.0). Al momento de este informe se distribuye por Firebase App Distribution, enlazada desde el landing page, y aún no se publica en Google Play. Los siguientes elementos ASO quedan definidos para la ficha de publicación:

<p class="caption"><strong>Tabla 183</strong><br><em>Etiquetas de la aplicación móvil</em></p>

| Elemento | Valor |
|---|---|
| App Title | Healthify: seguimiento nutricional |
| App Subtitle (descripción breve) | Tu nutrición y tu nutricionista, en un solo lugar. |
| App Keywords | seguimiento nutricional, nutricionista, registro de comidas, registro por foto, autopesaje, metas nutricionales, plan alimenticio, consulta nutricional, calorías |
| App Description | Healthify conecta a pacientes y nutricionistas entre consultas. Si eres paciente, registra tus comidas con una foto o a mano, anota tu peso y mira tu tendencia sin juicios ni culpa. Si eres nutricionista, recibe señales cuando algo no cuadra, conduce la consulta guiada con apoyo de IA y publica el plan para tu paciente. La IA sugiere; tú decides. |

#### 3.1.2.4. Searching Systems

En Healthify el volumen de información por usuario es acotado, por lo que los sistemas de búsqueda se concentran donde el usuario más lo necesita, que es la búsqueda de alimentos al registrar una comida. En el resto de módulos se prefiere **filtrar por periodo, estado o fecha** en lugar de ofrecer un buscador de texto libre.

**Búsqueda de alimentos (paciente y nutricionista)**

En «Registrar a mano» el paciente cuenta con un campo «Buscar alimento» con el ejemplo «Ej. arroz, pollo, quinua…» y la ayuda «Busca primero en el catálogo guardado en tu teléfono». La búsqueda funciona así:

- **Texto libre por nombre**: los resultados se actualizan a medida que se escribe y se limitan a 25 como máximo.
- **Catálogo local primero**: se consulta el catálogo guardado en el teléfono, lo que permite buscar sin conexión, y luego el catálogo de referencia del servidor.
- **Sin resultados**: se ofrece buscar de nuevo o registrar el alimento manualmente.
- **Foto del plato**: es un camino alternativo a la búsqueda. La estimación propuesta puede corregirse con «¿No es este plato?», que abre la búsqueda.

Cada resultado se muestra como una tarjeta con el **nombre del alimento** y su **aporte energético por 100 g** («Arroz blanco cocido · 130 kcal / 100 g»). Al elegir un alimento, el paciente indica la porción en gramos y el momento de la comida, hasta 48 horas hacia atrás. El nutricionista accede al mismo catálogo desde el menú lateral («Catálogo de alimentos») y puede **agregar alimentos locales** cuando no encuentra uno.

<p class="caption"><strong>Figura 117</strong><br><em>Pantallas de búsqueda de alimentos: campo de búsqueda vacío y con teclado abierto</em></p>

<p align="center">
  <img src="../assets/img/chapter3/information-architecture/search-systems-patient.png" alt="Pantallas de búsqueda de alimentos: campo de búsqueda vacío y con teclado abierto" width="560" />
</p>

**Búsqueda de pacientes (nutricionista)**

En «Mis pacientes», el campo «Buscar paciente» filtra la cartera por nombre a medida que se escribe, sin perder los grupos «Requieren acción» y «Al día». Si ningún nombre coincide, la lista muestra «Sin resultados» y repite el texto buscado («Ningún paciente coincide con «…»»).

**Filtros por periodo, fecha y estado**

<p class="caption"><strong>Tabla 184</strong><br><em>Filtros de búsqueda por periodo, fecha y estado</em></p>

| Módulo | Filtro | Cómo luce el resultado |
|---|---|---|
| Diario (paciente) | Selección de **fecha** | Lista de comidas del día, con los pendientes de envío identificados |
| Peso (paciente) | **Periodo** de la tendencia de peso (4 semanas) | Gráfico de tendencia y tarjeta «Tu semana» |
| Expediente (paciente y nutricionista) | **Periodo** de los últimos 30 días | Secciones con números, plan y consultas |
| Seguimiento (nutricionista) | **Semana** de 7 días | Panel de cumplimiento por día y resumen con IA |
| Bandeja (nutricionista) | **Estado**: abiertas o resueltas | Tarjetas con paciente, tipo de señal y fecha de recepción |
| Agenda (nutricionista) | **Estado** y fecha de las consultas | Lista cronológica de próximas consultas |

**Landing Page**

Al ser un sitio de pocas páginas, no incluye un buscador de texto. La única herramienta de filtrado son los **chips de las preguntas frecuentes** de Nosotros (*Todas*, *Pacientes*, *Nutricionistas*, *Privacidad*, *IA*), que muestran solo las respuestas del tema elegido. La página de Términos y condiciones incluye un **índice de cláusulas** para saltar a cada apartado: fijo al costado en escritorio y desplegable en móvil.

#### 3.1.2.5. Navigation Systems

**Landing Page**

La navegación se articula con un **encabezado fijo** sobre verde oscuro, con el logotipo (que lleva al inicio), los enlaces *Inicio*, *Cómo funciona*, *Para pacientes*, *Nosotros* y *Contacto*, el selector de idioma ES / EN y la llamada a la acción naranja «Descargar para Android». *Cómo funciona* y *Para pacientes* son **anclas** a secciones de Inicio, y los demás enlaces abren páginas. El encabezado se oculta al bajar y reaparece al subir, de modo que no tapa el contenido. Por debajo de 1200 px de ancho los enlaces se reemplazan por un **menú de pantalla completa** (hamburguesa) que retiene el foco del teclado y se cierra con Esc. Se añaden otras técnicas de recorrido:

- **Recorrido por secciones**: en escritorio, Inicio y Nosotros avanzan de una sección a la siguiente con cada gesto de scroll (scroll *snap*); en tablet y móvil el scroll es libre.
- **Carrusel del héroe** con flechas, puntos y avance automático cada 12 segundos, que se detiene al interactuar y no arranca si el usuario prefiere menos movimiento.
- **Pasos de la consulta**: en escritorio se muestran en cuatro columnas; en móvil, como un carrusel horizontal con un indicador del paso 1 al 4.
- **Pie de página** con las columnas Producto, Empresa, Legal (Términos y Aviso de privacidad) y Contacto, accesible desde cualquier página.
- **Enlace «Saltar al contenido principal»** para usuarios de teclado y lectores de pantalla.
- **Llamadas a la acción** consistentes: todos los botones «Descargar para Android» llevan al mismo enlace de descarga, y la frase «¿Te invitó tu nutricionista?» del héroe lleva a la sección del paciente.

<p class="caption"><strong>Figura 118</strong><br><em>Barra de navegación del landing page de Healthify</em></p>

<p align="center">
  <img src="../assets/img/chapter3/information-architecture/landing-home.png" alt="Barra de navegación del landing page de Healthify" width="720" />
</p>

**Aplicación móvil**

Tras iniciar sesión, la aplicación resuelve el rol de la persona y carga el *shell* de navegación que le corresponde. Ambos roles usan una **barra de navegación inferior persistente** (bottom navigation) con el ítem activo resaltado en verde claro y en negrita, y un **menú lateral** que se abre con el botón ☰ de la barra superior. La barra lleva a los módulos de uso diario con un toque; el menú reúne lo que se consulta con menos frecuencia.

- **Paciente: 4 pestañas y el botón «Registrar»** (*Inicio*, *Diario*, *Peso* y *Expediente*, con el botón naranja de cámara al centro). «Registrar» abre la cámara desde cualquier pestaña. El menú lateral reúne *Mi plan*, *Mis consultas*, *Pendientes*, *Ajustes* y *Cerrar sesión*. En Inicio, las tarjetas «Cómo voy hoy», «Próxima consulta» y los avisos como «Algo no cuadra» llevan a su detalle.
- **Nutricionista: 3 pestañas** (*Pacientes*, *Bandeja* y *Agenda*). El menú lateral reúne *Catálogo de alimentos*, *Ajustes* y *Cerrar sesión*. Desde *Pacientes* se entra a la ficha de cada paciente, que tiene su propia **navegación por pestañas superiores** (*Resumen*, *Seguimiento*, *Expediente* y *Plan*, entre las que también se puede deslizar), y desde allí se inicia la consulta guiada.

<p class="caption"><strong>Figura 119</strong><br><em>Barras de navegación inferior del paciente y del nutricionista</em></p>

<p align="center">
  <img src="../assets/img/chapter3/information-architecture/navbar-patient.png" alt="Barra de navegación inferior del paciente" width="240" /> <img src="../assets/img/chapter3/information-architecture/navbar-practitioner.png" alt="Barra de navegación inferior del nutricionista" width="240" />
</p>

Las demás técnicas de navegación son:

- **Navegación jerárquica con retroceso**: las pantallas de detalle y los flujos (vinculación, registro de comida, consulta guiada) se abren sobre la barra inferior con una barra superior que incluye la flecha de retroceso y un título.
- **Flujos paso a paso**, con un botón principal al pie, para el registro de cuenta, la vinculación y la consulta guiada. Al salir de la consulta, el sistema pregunta «¿Salir de la consulta?» y conserva un borrador que se puede reanudar; desde el paso 1 también se puede borrar la consulta («¿Borrar esta consulta?») sin tocar el plan ni las metas vigentes.
- **Hojas inferiores y diálogos** para decisiones puntuales (idioma, «Tus metas cambiaron», cierre de sesión, confirmaciones), de modo que el usuario no pierde su contexto.
- **Retroalimentación**: avisos temporales (*snackbar*) tras acciones como «Comida registrada» o «Plan publicado», y un banner persistente de **sin conexión** que indica qué se guardará hasta recuperar la red.
- **Acceso por código QR**: el nutricionista genera una invitación con un QR y el paciente la escanea con la cámara para vincularse.
- **Pantallas de arranque**: *Splash*, *Bienvenida*, *Registro* (con la aceptación de los términos), *Inicio de sesión* y *Recuperar contraseña* anteceden al *shell*, y una pantalla de **sesión expirada** permite volver a entrar sin perder el contexto.

<p class="caption"><strong>Figura 120</strong><br><em>Navegación de la app: Mis pacientes, menú lateral, Bandeja y ficha del paciente (nutricionista); Inicio y menú lateral (paciente)</em></p>

<p align="center">
  <img src="../assets/img/chapter3/information-architecture/navigation-practitioner.png" alt="Pantallas del nutricionista: Mis pacientes, menú lateral abierto, Bandeja y ficha del paciente" width="820" />
</p>

<p align="center">
  <img src="../assets/img/chapter3/information-architecture/navigation-patient.png" alt="Inicio del paciente con la barra inferior y el botón Registrar, y el menú lateral abierto" width="420" />
</p>

### 3.1.3. Landing Page UI Design

#### 3.1.3.1. Landing Page Wireframe

Los wireframes del landing page se elaboraron en Figma, en escala de grises y con textos reales, para validar la estructura, el orden del contenido y la jerarquía antes de aplicar color y tipografía de marca. El sitio tiene cuatro páginas (Inicio, Nosotros, Contacto y Términos y condiciones) y se diseñó para escritorio (1440 px) y móvil (390 px).

**Desktop Web Browser**

La página de Inicio se organiza en el orden definido en la sección 3.1.2.1: encabezado con navegación, héroe, propuesta de valor, «La consulta, paso a paso», «Entre citas», «Para nutricionistas», «Para pacientes», prueba social, llamada final y pie de página.

<p class="caption"><strong>Figura 121</strong><br><em>Wireframe de Inicio en escritorio</em></p>

<p align="center">
  <img src="../assets/img/chapter3/landing/wireframe/desktop-home-parts/part-1.png" alt="Wireframe de Inicio en escritorio (sección 1)" style="width:520px" />
</p>

<p align="center">
  <img src="../assets/img/chapter3/landing/wireframe/desktop-home-parts/part-2.png" alt="Wireframe de Inicio en escritorio (sección 2)" style="width:520px" />
</p>

<p align="center">
  <img src="../assets/img/chapter3/landing/wireframe/desktop-home-parts/part-3.png" alt="Wireframe de Inicio en escritorio (sección 3)" style="width:520px" />
</p>

<p align="center">
  <img src="../assets/img/chapter3/landing/wireframe/desktop-home-parts/part-4.png" alt="Wireframe de Inicio en escritorio (sección 4)" style="width:520px" />
</p>

<p align="center">
  <img src="../assets/img/chapter3/landing/wireframe/desktop-home-parts/part-5.png" alt="Wireframe de Inicio en escritorio (sección 5)" style="width:520px" />
</p>

<p align="center">
  <img src="../assets/img/chapter3/landing/wireframe/desktop-home-parts/part-6.png" alt="Wireframe de Inicio en escritorio (sección 6)" style="width:520px" />
</p>

<p align="center">
  <img src="../assets/img/chapter3/landing/wireframe/desktop-home-parts/part-7.png" alt="Wireframe de Inicio en escritorio (sección 7)" style="width:520px" />
</p>

<p align="center">
  <img src="../assets/img/chapter3/landing/wireframe/desktop-home-parts/part-8.png" alt="Wireframe de Inicio en escritorio (sección 8)" style="width:520px" />
</p>

<p class="caption"><strong>Tabla 185</strong><br><em>Justificación de las decisiones de diseño del wireframe del landing page</em></p>

| Elemento | Justificación |
|---|---|
| **Shape** | Las tarjetas de cifras, el ejemplo de plan propuesto, las citas y los pasos usan esquinas redondeadas del mismo radio (24 px en las tarjetas grandes). Los marcadores de imagen (rectángulo con diagonales) van siempre dentro de un marco de teléfono, para indicar que ahí irá una pantalla de la app. |
| **Space** | El contenido ocupa un contenedor central de 1200 px. En escritorio cada sección mide una pantalla (900 px) y los fondos alternan entre claro y oscuro, de modo que cada tema se lee como una unidad. Las ocho funciones del nutricionista se listan en una columna junto a la captura de «Mis pacientes». |
| **Direction** | La lectura es vertical y descendente. Las secciones alternan el lado del texto y de la imagen, y dentro de cada una el ojo recorre el título, el texto y la evidencia en ese orden. «La consulta, paso a paso» se lee de izquierda a derecha en cuatro columnas numeradas, que marcan la secuencia. |
| **Size** | Los títulos en Anton son varias veces más grandes que el texto corrido; después del héroe, lo más grande son las cifras de la propuesta de valor («6 de 7», «−0,3 kg»). El botón «Descargar para Android» es más alto que los enlaces, de modo que la acción principal se identifica de inmediato. |

<p class="caption"><strong>Tabla 186</strong><br><em>Heurísticas de Nielsen aplicadas al wireframe del landing page</em></p>

| Heurística de Nielsen | Aplicación |
|---|---|
| **H1. Visibilidad del estado del sistema** | El carrusel del héroe muestra puntos de posición, el indicador de pasos marca el paso visible en móvil y los chips de las preguntas frecuentes indican el filtro activo. |
| **H3. Control y libertad del usuario** | El carrusel tiene flechas y puntos para avanzar o retroceder, las preguntas se abren y se cierran, el menú móvil se cierra con su botón o con Esc, y el logotipo lleva al inicio desde cualquier página. |
| **H4. Consistencia y estándares** | Logotipo a la izquierda y navegación a la derecha, como en la mayoría de los sitios web; el mismo encabezado y pie de página en las cuatro páginas. |
| **H6. Reconocer antes que recordar** | La navegación está siempre visible, y los títulos de las funciones («Invitación por QR», «Plan versionado») describen lo que hace cada una sin necesidad de recordar nada. |
| **H8. Diseño estético y minimalista** | Cada función tiene un título y una sola línea de descripción. Cada sección muestra una sola llamada a la acción primaria. |
| **H9. Ayudar a reconocer y corregir errores** | El formulario de Contacto reúne los errores en un resumen al inicio («Revise los campos») y cada campo indica qué corregir. |

<p class="caption"><strong>Tabla 187</strong><br><em>Principios de arquitectura de información aplicados al wireframe</em></p>

| Principio de arquitectura de información | Aplicación |
|---|---|
| **Organización jerárquica** | Del resultado que ve el nutricionista (propuesta de valor) a lo que lo respalda (prueba social) y a la acción final. |
| **Etiquetado** | Los textos de la navegación son los de la sección 3.1.2.2: Inicio, Cómo funciona, Para pacientes, Nosotros, Contacto. |
| **Navegación** | Encabezado fijo, anclas a dos secciones de Inicio y pie de página con los mismos destinos más los enlaces legales y las preguntas frecuentes. |
| **Búsqueda y filtrado** | Sin buscador de texto. Las preguntas frecuentes de Nosotros se filtran por tema con chips (Todas, Pacientes, Nutricionistas, Privacidad, IA). |

**Diseño inclusivo:** el wireframe separa el contenido en bloques con encabezados claros para que los lectores de pantalla puedan navegar por títulos. Los botones y chips tienen un tamaño de toque cómodo, la información no depende solo del color (los chips y estados llevan texto), y el sitio tiene selector de idioma español / inglés. Las preguntas frecuentes de Nosotros terminan con la tarjeta «¿No encontraste tu respuesta?», que lleva a Contacto, donde el equipo se compromete a responder en menos de 48 horas hábiles.

Las demás páginas siguen la misma estructura de encabezado y pie. **Nosotros** presenta la historia, la misión y visión, los valores, el equipo y las preguntas frecuentes. **Contacto** abre con tres casos para elegir (Soy nutricionista, Soy paciente, Alianzas), seguidos del formulario y de otras formas de contacto. **Términos y condiciones** presenta nueve cláusulas con un índice lateral fijo.

<p class="caption"><strong>Figura 122</strong><br><em>Wireframe de Nosotros en escritorio</em></p>

<p align="center">
  <img src="../assets/img/chapter3/landing/wireframe/desktop-about-parts/part-1.png" alt="Wireframe de Nosotros en escritorio (sección 1)" style="width:520px" />
</p>

<p align="center">
  <img src="../assets/img/chapter3/landing/wireframe/desktop-about-parts/part-2.png" alt="Wireframe de Nosotros en escritorio (sección 2)" style="width:520px" />
</p>

<p align="center">
  <img src="../assets/img/chapter3/landing/wireframe/desktop-about-parts/part-3.png" alt="Wireframe de Nosotros en escritorio (sección 3)" style="width:520px" />
</p>

<p align="center">
  <img src="../assets/img/chapter3/landing/wireframe/desktop-about-parts/part-4.png" alt="Wireframe de Nosotros en escritorio (sección 4)" style="width:520px" />
</p>

<p align="center">
  <img src="../assets/img/chapter3/landing/wireframe/desktop-about-parts/part-5.png" alt="Wireframe de Nosotros en escritorio (sección 5)" style="width:520px" />
</p>

<p align="center">
  <img src="../assets/img/chapter3/landing/wireframe/desktop-about-parts/part-6.png" alt="Wireframe de Nosotros en escritorio (sección 6)" style="width:520px" />
</p>

<p class="caption"><strong>Figura 123</strong><br><em>Wireframe de Contacto en escritorio</em></p>

<p align="center">
  <img src="../assets/img/chapter3/landing/wireframe/desktop-contact-parts/part-1.png" alt="Wireframe de Contacto en escritorio (sección 1)" style="width:520px" />
</p>

<p align="center">
  <img src="../assets/img/chapter3/landing/wireframe/desktop-contact-parts/part-2.png" alt="Wireframe de Contacto en escritorio (sección 2)" style="width:520px" />
</p>

<p class="caption"><strong>Figura 124</strong><br><em>Wireframe de Términos y condiciones en escritorio</em></p>

<p align="center">
  <img src="../assets/img/chapter3/landing/wireframe/desktop-terms-parts/part-1.png" alt="Wireframe de Términos y condiciones en escritorio (sección 1)" style="width:520px" />
</p>

<p align="center">
  <img src="../assets/img/chapter3/landing/wireframe/desktop-terms-parts/part-2.png" alt="Wireframe de Términos y condiciones en escritorio (sección 2)" style="width:520px" />
</p>

**Mobile Web Browser**

En móvil el contenido se apila en una sola columna. La navegación se oculta tras un botón de menú y se abre como una pantalla completa con los cinco enlaces en Anton, el selector de idioma y el botón «Descargar para Android». «La consulta, paso a paso» pasa de cuatro columnas a un carrusel horizontal con un indicador de pasos, de modo que cada paso conserva su captura sin alargar la página.

<p class="caption"><strong>Figura 125</strong><br><em>Wireframe de Inicio en móvil</em></p>

<p align="center">
  <img src="../assets/img/chapter3/landing/wireframe/mobile-home-parts/part-1.png" alt="Wireframe de Inicio en móvil (sección 1)" style="width:150px" />
  <img src="../assets/img/chapter3/landing/wireframe/mobile-home-parts/part-2.png" alt="Wireframe de Inicio en móvil (sección 2)" style="width:150px" />
  <img src="../assets/img/chapter3/landing/wireframe/mobile-home-parts/part-3.png" alt="Wireframe de Inicio en móvil (sección 3)" style="width:150px" />
  <img src="../assets/img/chapter3/landing/wireframe/mobile-home-parts/part-4.png" alt="Wireframe de Inicio en móvil (sección 4)" style="width:150px" />
</p>

<p align="center">
  <img src="../assets/img/chapter3/landing/wireframe/mobile-home-parts/part-5.png" alt="Wireframe de Inicio en móvil (sección 5)" style="width:150px" />
  <img src="../assets/img/chapter3/landing/wireframe/mobile-home-parts/part-6.png" alt="Wireframe de Inicio en móvil (sección 6)" style="width:150px" />
  <img src="../assets/img/chapter3/landing/wireframe/mobile-home-parts/part-7.png" alt="Wireframe de Inicio en móvil (sección 7)" style="width:150px" />
  <img src="../assets/img/chapter3/landing/wireframe/mobile-home-parts/part-8.png" alt="Wireframe de Inicio en móvil (sección 8)" style="width:150px" />
</p>

<p align="center">
  <img src="../assets/img/chapter3/landing/wireframe/mobile-home-parts/part-9.png" alt="Wireframe de Inicio en móvil (sección 9)" style="width:150px" />
  <img src="../assets/img/chapter3/landing/wireframe/mobile-menu.png" alt="Wireframe del menú abierto en móvil" style="width:150px" />
</p>

<p class="caption"><strong>Tabla 188</strong><br><em>Justificación de las decisiones de diseño del wireframe del landing page móvil</em></p>

| Elemento | Justificación |
|---|---|
| **Shape** | Los mismos radios y formas que en escritorio, para que la versión móvil se reconozca como la misma página. |
| **Space** | Un solo margen lateral de 16 px y bloques apilados con separación uniforme. Los botones ocupan todo el ancho para facilitar el toque con el pulgar. |
| **Direction** | Lectura vertical. El único desplazamiento horizontal es el carrusel de pasos, que avanza con el dedo o con su indicador numerado. |
| **Size** | Los enlaces del menú usan Anton en tamaño grande, y los botones principales mantienen un alto mínimo de 48 px. |

**Diseño inclusivo en móvil:** los blancos de toque tienen al menos 48 px, y el menú abierto tiene un botón de cierre visible, retiene el foco del teclado y se cierra con Esc. Los textos mantienen un tamaño mínimo de 12 px y el orden de lectura es igual al orden visual.

#### 3.1.3.2. Landing Page Mock-up

Los mock-ups aplican sobre los wireframes el sistema de diseño descrito en 3.1.1.1: verde oscuro `#24461A` en el encabezado, el héroe, la sección del nutricionista y el pie; crema `#F6F4EE` en la propuesta de valor y en «Entre citas»; blanco en «La consulta, paso a paso» y en la prueba social; verde claro `#E5F5D1` en la sección del paciente; verde `#3B6E23` en la llamada final; naranja `#F5A623` para la acción principal; y Anton y Open Sans como tipografías. Las capturas son pantallas de los mock-ups de la app (Seguimiento, estimación por foto, los cuatro pasos de la consulta, Bandeja, Mis pacientes e Inicio), en español o en inglés según el idioma elegido, de modo que el visitante ve el producto que va a usar.

**Desktop Web Browser**

<p class="caption"><strong>Figura 126</strong><br><em>Mock-up de Inicio en escritorio</em></p>

<p align="center">
  <img src="../assets/img/chapter3/landing/mockup/desktop-home-parts/part-1.png" alt="Mock-up de Inicio en escritorio (sección 1)" style="width:520px" />
</p>

<p align="center">
  <img src="../assets/img/chapter3/landing/mockup/desktop-home-parts/part-2.png" alt="Mock-up de Inicio en escritorio (sección 2)" style="width:520px" />
</p>

<p align="center">
  <img src="../assets/img/chapter3/landing/mockup/desktop-home-parts/part-3.png" alt="Mock-up de Inicio en escritorio (sección 3)" style="width:520px" />
</p>

<p align="center">
  <img src="../assets/img/chapter3/landing/mockup/desktop-home-parts/part-4.png" alt="Mock-up de Inicio en escritorio (sección 4)" style="width:520px" />
</p>

<p align="center">
  <img src="../assets/img/chapter3/landing/mockup/desktop-home-parts/part-5.png" alt="Mock-up de Inicio en escritorio (sección 5)" style="width:520px" />
</p>

<p align="center">
  <img src="../assets/img/chapter3/landing/mockup/desktop-home-parts/part-6.png" alt="Mock-up de Inicio en escritorio (sección 6)" style="width:520px" />
</p>

<p align="center">
  <img src="../assets/img/chapter3/landing/mockup/desktop-home-parts/part-7.png" alt="Mock-up de Inicio en escritorio (sección 7)" style="width:520px" />
</p>

<p align="center">
  <img src="../assets/img/chapter3/landing/mockup/desktop-home-parts/part-8.png" alt="Mock-up de Inicio en escritorio (sección 8)" style="width:520px" />
</p>

<p class="caption"><strong>Tabla 189</strong><br><em>Aplicación del sistema de diseño en el mock-up del landing page</em></p>

| Aspecto | Aplicación |
|---|---|
| **Branding** | El logotipo blanco (corazón y hoja) en el encabezado y el pie, sobre verde oscuro. El héroe presenta el lema «Una app para los dos lados de la consulta» con el texto de apoyo en lima claro. |
| **Color y contraste** | Texto crema sobre verde oscuro y texto `#1C1C1A` sobre crema y blanco, con contraste superior a 4.5:1. El lima se usa para resaltar, y el naranja solo para el botón principal. |
| **Tipografía** | Anton para títulos y cifras; Open Sans para el cuerpo. La propuesta de valor muestra tres cifras grandes en Anton («6 de 7», «5 de 7», «−0,3 kg») y su explicación en Open Sans. |
| **Jerarquía visual** | Los fondos alternan (verde oscuro, crema, blanco, crema, verde oscuro, verde claro, blanco y verde) y separan los bloques. En «Entre citas», un ejemplo de plan propuesto por IA («Energía diaria: 1 796 → 1 650 kcal») acompaña las capturas de la Bandeja. |
| **Heurística H4 (consistencia)** | Los botones, chips, tarjetas y el estilo de los títulos son los del sistema de diseño de la app, así que quien pasa del sitio a la aplicación reconoce los mismos patrones. |
| **Heurística H1 (estado del sistema)** | El punto activo del carrusel, el paso visible en móvil y el chip de filtro activo se distinguen por forma o por texto, no solo por color. |
| **Arquitectura de información** | La navegación, el orden de secciones y los rótulos son los definidos en 3.1.2. «Para nutricionistas» lista ocho funciones: Mis pacientes, Invitación por QR, Seguimiento en solo lectura, Plan versionado, Agenda, Derivaciones y alta clínica, Catálogo de alimentos locales y Datos base una sola vez. |
| **Diseño inclusivo** | Enlace «Saltar al contenido principal», texto alternativo que describe cada captura, selector de idioma ES / EN que también cambia las capturas al inglés, foco visible de 2 px (verde sobre fondos claros, lima sobre verde oscuro) y pausa del carrusel cuando el usuario prefiere menos movimiento. |

Las otras tres páginas conservan el encabezado y el pie de página, y cambian solo el contenido central.

<p class="caption"><strong>Figura 127</strong><br><em>Mock-up de Nosotros en escritorio</em></p>

<p align="center">
  <img src="../assets/img/chapter3/landing/mockup/desktop-about-parts/part-1.png" alt="Mock-up de Nosotros en escritorio (sección 1)" style="width:520px" />
</p>

<p align="center">
  <img src="../assets/img/chapter3/landing/mockup/desktop-about-parts/part-2.png" alt="Mock-up de Nosotros en escritorio (sección 2)" style="width:520px" />
</p>

<p align="center">
  <img src="../assets/img/chapter3/landing/mockup/desktop-about-parts/part-3.png" alt="Mock-up de Nosotros en escritorio (sección 3)" style="width:520px" />
</p>

<p align="center">
  <img src="../assets/img/chapter3/landing/mockup/desktop-about-parts/part-4.png" alt="Mock-up de Nosotros en escritorio (sección 4)" style="width:520px" />
</p>

<p align="center">
  <img src="../assets/img/chapter3/landing/mockup/desktop-about-parts/part-5.png" alt="Mock-up de Nosotros en escritorio (sección 5)" style="width:520px" />
</p>

<p align="center">
  <img src="../assets/img/chapter3/landing/mockup/desktop-about-parts/part-6.png" alt="Mock-up de Nosotros en escritorio (sección 6)" style="width:520px" />
</p>

<p class="caption"><strong>Figura 128</strong><br><em>Mock-up de Contacto en escritorio</em></p>

<p align="center">
  <img src="../assets/img/chapter3/landing/mockup/desktop-contact-parts/part-1.png" alt="Mock-up de Contacto en escritorio (sección 1)" style="width:520px" />
</p>

<p align="center">
  <img src="../assets/img/chapter3/landing/mockup/desktop-contact-parts/part-2.png" alt="Mock-up de Contacto en escritorio (sección 2)" style="width:520px" />
</p>

<p class="caption"><strong>Figura 129</strong><br><em>Mock-up de Términos y condiciones en escritorio</em></p>

<p align="center">
  <img src="../assets/img/chapter3/landing/mockup/desktop-terms-parts/part-1.png" alt="Mock-up de Términos y condiciones en escritorio (sección 1)" style="width:520px" />
</p>

<p align="center">
  <img src="../assets/img/chapter3/landing/mockup/desktop-terms-parts/part-2.png" alt="Mock-up de Términos y condiciones en escritorio (sección 2)" style="width:520px" />
</p>

**Mobile Web Browser**

<p class="caption"><strong>Figura 130</strong><br><em>Mock-up de Inicio en móvil</em></p>

<p align="center">
  <img src="../assets/img/chapter3/landing/mockup/mobile-home-parts/part-1.png" alt="Mock-up de Inicio en móvil (sección 1)" style="width:150px" />
  <img src="../assets/img/chapter3/landing/mockup/mobile-home-parts/part-2.png" alt="Mock-up de Inicio en móvil (sección 2)" style="width:150px" />
  <img src="../assets/img/chapter3/landing/mockup/mobile-home-parts/part-3.png" alt="Mock-up de Inicio en móvil (sección 3)" style="width:150px" />
  <img src="../assets/img/chapter3/landing/mockup/mobile-home-parts/part-4.png" alt="Mock-up de Inicio en móvil (sección 4)" style="width:150px" />
</p>

<p align="center">
  <img src="../assets/img/chapter3/landing/mockup/mobile-home-parts/part-5.png" alt="Mock-up de Inicio en móvil (sección 5)" style="width:150px" />
  <img src="../assets/img/chapter3/landing/mockup/mobile-home-parts/part-6.png" alt="Mock-up de Inicio en móvil (sección 6)" style="width:150px" />
  <img src="../assets/img/chapter3/landing/mockup/mobile-home-parts/part-7.png" alt="Mock-up de Inicio en móvil (sección 7)" style="width:150px" />
  <img src="../assets/img/chapter3/landing/mockup/mobile-home-parts/part-8.png" alt="Mock-up de Inicio en móvil (sección 8)" style="width:150px" />
</p>

<p align="center">
  <img src="../assets/img/chapter3/landing/mockup/mobile-home-parts/part-9.png" alt="Mock-up de Inicio en móvil (sección 9)" style="width:150px" />
  <img src="../assets/img/chapter3/landing/mockup/mobile-menu.png" alt="Mock-up del menú abierto en móvil" style="width:150px" />
</p>

La versión móvil usa los mismos colores, tipografías y componentes. Los cambios respecto de escritorio responden al tamaño de pantalla: una sola columna, titulares con la escala *Mobile/* de Anton, el menú de pantalla completa, los pasos de la consulta en carrusel y botones de ancho completo. El pie de página apila sus columnas (Producto, Empresa, Legal y Contacto).

### 3.1.4. Mobile Applications UX/UI Design

#### 3.1.4.1. Mobile Applications Wireframes

La aplicación Android de Healthify tiene dos roles, paciente y nutricionista, y se diseñó en 360 × 800 dp. En total el diseño tiene más de cien pantallas con sus estados (carga, vacío, sin conexión y error). Se presentan seis wireframes representativos: tres del paciente (Inicio, estimación por foto y tendencia de peso) y tres del nutricionista (Bandeja, ficha del paciente y diagnóstico con IA). Los wireframes se elaboraron en Figma, con textos reales y componentes del sistema de diseño en escala de grises.

<p class="caption"><strong>Figura 131</strong><br><em>Wireframes de las pantallas representativas de la aplicación móvil</em></p>

<table align="center">
  <tr>
    <td align="center"><img src="../assets/img/chapter3/mobile/wireframes/1-inicio.png" alt="Wireframe de Inicio del paciente" width="150" /><br/><sub>Paciente · Inicio</sub></td>
    <td align="center"><img src="../assets/img/chapter3/mobile/wireframes/2-estimacion.png" alt="Wireframe de estimación propuesta" width="150" /><br/><sub>Paciente · Estimación propuesta</sub></td>
    <td align="center"><img src="../assets/img/chapter3/mobile/wireframes/3-tendencia.png" alt="Wireframe de tendencia de peso" width="150" /><br/><sub>Paciente · Tendencia de peso</sub></td>
  </tr>
  <tr>
    <td align="center"><img src="../assets/img/chapter3/mobile/wireframes/4-bandeja.png" alt="Wireframe de la bandeja de revisión" width="150" /><br/><sub>Nutricionista · Bandeja</sub></td>
    <td align="center"><img src="../assets/img/chapter3/mobile/wireframes/5-ficha.png" alt="Wireframe de la ficha del paciente" width="150" /><br/><sub>Nutricionista · Ficha del paciente</sub></td>
    <td align="center"><img src="../assets/img/chapter3/mobile/wireframes/6-diagnostico.png" alt="Wireframe del diagnóstico con IA" width="150" /><br/><sub>Nutricionista · Diagnóstico con IA</sub></td>
  </tr>
</table>

<p class="caption"><strong>Tabla 190</strong><br><em>Decisiones de diseño de las pantallas de los wireframes móviles</em></p>

| Pantalla | Decisión de diseño |
|---|---|
| **Inicio (paciente)** | Lo primero que se ve es el medidor de energía: las kcal que quedan hoy y, debajo, los macros. Luego «Tu semana» marca los días con registro, y al final están las tarjetas «Cómo voy hoy» y «Próxima consulta». Para registrar una comida, el paciente usa el botón central «Registrar» de la barra inferior, visible desde cualquier pestaña, y el botón ☰ abre el menú lateral. |
| **Estimación propuesta** | El plato y el porcentaje de confianza ocupan la parte superior. La pregunta «¿Esta comida estaba en tu plan?» tiene dos opciones, «Sí» y «No»; si la IA cree que el plato encaja, deja marcado «Sí» y lo avisa, y el paciente puede cambiarlo. El botón principal «Sí, es correcto» está separado del enlace secundario «Ajustar gramos». |
| **Tendencia de peso** | Pestaña «Peso», con el título «Tu tendencia». Arriba, la tarjeta «Tu semana» con la insignia «Resumen con IA»; debajo, el gráfico del promedio de los últimos autopesajes y el botón «Registrar mi peso» al pie. Muestra una tendencia y no el peso de un día, que es el principio del producto. |
| **Bandeja** | Una lista de señales con un indicador de estado, el nombre del paciente, el tipo de señal y la fecha de recepción. Sin acciones en la lista: tocar una fila abre la señal. |
| **Ficha del paciente** | Cuatro pestañas (Resumen, Seguimiento, Expediente y Plan). El resumen agrupa la identidad y el estado del plan, la próxima consulta, los datos base, dos indicadores y las acciones de gestión; el botón «Iniciar consulta» queda fijo al pie. |
| **Diagnóstico con IA** | Paso 2 de 4 de la consulta guiada. La sugerencia de la IA va en una tarjeta con la insignia «Sugerencia de IA» y los botones «Usar sugerencia» y «Elegir otro»; el diagnóstico final lo elige el nutricionista. |

**Principios y elementos de diseño.** *Shape*: tarjetas y botones con esquinas redondeadas del mismo radio. *Space*: margen de 16 dp y separación de 8 y 16 dp entre bloques, según la escala del sistema. *Direction*: lectura vertical, con la acción principal siempre al pie, en el área del pulgar. *Size*: el título de pantalla y las métricas tienen el mayor tamaño, y los botones principales miden 56 dp.

**Arquitectura de información.** Cada rol tiene su barra inferior (cuatro pestañas y el botón «Registrar» el paciente, tres pestañas el nutricionista) y un menú lateral, según la sección 3.1.2.5. Los rótulos son los de 3.1.2.2, y las pantallas de detalle muestran la flecha de retroceso y el título en la barra superior.

**Diseño inclusivo.** Los textos respetan el tamaño de fuente del sistema (en sp, con un mínimo de 12 sp) y se revisaron con la fuente al 200 %, con desplazamiento donde el contenido no cabe. El contraste de texto es de al menos 4.5:1. Las áreas táctiles tienen al menos 48 dp. Los estados no se comunican solo con color: los chips y avisos llevan texto («Vigente», «Por confirmar»). Todas las pantallas definen su estado sin conexión, de carga y de error, y los textos de la aplicación están disponibles en español e inglés.

#### 3.1.4.2. Mobile Applications Wireflow Diagrams

Se elaboró un wireflow por cada objetivo del usuario. Los objetivos 1 a 3 corresponden al nutricionista (persona: Willyan Guerrero Ortega) y los objetivos 4 y 5 al paciente (persona: Evelyn Del Aguila). Antes de cada wireflow se definió su Task Flow, que fija la ruta típica de pasos. Cada paso agrega un wireframe con el nuevo estado de la pantalla.

##### Wireflow 1: Atender una consulta

<p class="caption"><strong>Tabla 191</strong><br><em>User goal del Wireflow 1: Atender una consulta</em></p>

| **User Goal N°1** | Como nutricionista, quiero conducir la consulta de un paciente en cuatro pasos guiados, con apoyo de IA en el diagnóstico, para publicar un plan actualizado de forma rápida y precisa. |
|---|---|

<p class="caption"><strong>Tabla 192</strong><br><em>Task flow del Wireflow 1: Atender una consulta</em></p>

| **Task Flow** |
|---|
| 1. El nutricionista abre «Mis pacientes» y toca a Ana Flores. |
| 2. Ve la pestaña Resumen de Ana y toca «Iniciar consulta». |
| 3. Registra la medición de hoy (paso 1) y toca «Continuar a diagnóstico». |
| 4. Revisa el diagnóstico con apoyo de IA (paso 2) y toca «Continuar a metas». |
| 5. Revisa las metas calculadas (paso 3) y toca «Aceptar metas». |
| 6. Escribe las indicaciones (paso 4) y toca «Publicar y cerrar consulta». |
| 7. Vuelve al Resumen del paciente y ve el aviso «Plan publicado». |

El flujo recorre las cuatro etapas de la consulta con una barra de progreso («Paso 1 de 4», «Paso 2 de 4»). El botón principal al pie cambia de etiqueta según el paso y siempre indica a dónde lleva. Al final, el aviso temporal confirma la publicación sin interrumpir al nutricionista.

<p class="caption"><strong>Figura 132</strong><br><em>Wireflow 1: Atender una consulta</em></p>

<img src="../assets/img/chapter3/wireflows/01_Attend_Consultation_Wireflow.png" alt="Wireflow 1: Atender una consulta" width="100%" />

##### Wireflow 2: Evaluar a un paciente nuevo

<p class="caption"><strong>Tabla 193</strong><br><em>User goal del Wireflow 2: Evaluar a un paciente nuevo</em></p>

| **User Goal N°2** | Como nutricionista, quiero registrar los datos base de un paciente nuevo una sola vez, para iniciar su primera consulta sin volver a pedir la misma información. |
|---|---|

<p class="caption"><strong>Tabla 194</strong><br><em>Task flow del Wireflow 2: Evaluar a un paciente nuevo</em></p>

| **Task Flow** |
|---|
| 1. El nutricionista abre «Mis pacientes» y toca a Luz Ramírez. |
| 2. Ve el perfil del paciente nuevo, sin datos base, y toca «Registrar datos base». |
| 3. Ingresa los datos base y toca «Guardar e iniciar consulta». |
| 4. Inicia la primera consulta en el paso 1 (Medición de hoy). |

El perfil de un paciente sin datos base muestra una llamada a registrarlos antes de iniciar la consulta. Una vez guardados, el paso 1 los toma como punto de partida y solo pide lo que cambió.

<p class="caption"><strong>Figura 133</strong><br><em>Wireflow 2: Evaluar a un paciente nuevo</em></p>

<img src="../assets/img/chapter3/wireflows/02_Evaluate_New_Patient_Wireflow.png" alt="Wireflow 2: Evaluar a un paciente nuevo" width="75%" />

##### Wireflow 3: Atender una señal de la bandeja

<p class="caption"><strong>Tabla 195</strong><br><em>User goal del Wireflow 3: Atender una señal de la bandeja</em></p>

| **User Goal N°3** | Como nutricionista, quiero revisar las señales de mis pacientes en la bandeja y ajustar un plan propuesto por la IA, para actuar entre consultas sin perder el control del plan. |
|---|---|

<p class="caption"><strong>Tabla 196</strong><br><em>Task flow del Wireflow 3: Atender una señal de la bandeja</em></p>

| **Task Flow** |
|---|
| 1. El nutricionista abre la Bandeja de revisión y toca la señal de Ana Flores (desviación sostenida). |
| 2. Revisa la señal y el plan propuesto por la IA y toca «Ajustar». |
| 3. Ajusta el plan propuesto y toca «Asignar plan ajustado». |
| 4. Vuelve a la bandeja y ve la señal marcada como resuelta. |

La IA propone un plan y el nutricionista lo acepta con cambios. Nada se asigna al paciente sin esa decisión.

<p class="caption"><strong>Figura 134</strong><br><em>Wireflow 3: Atender una señal de la bandeja</em></p>

<img src="../assets/img/chapter3/wireflows/03_Handle_Inbox_Signal_Wireflow.png" alt="Wireflow 3: Atender una señal de la bandeja" width="75%" />

##### Wireflow 4: Registrar una comida con foto

<p class="caption"><strong>Tabla 197</strong><br><em>User goal del Wireflow 4: Registrar una comida con foto</em></p>

| **User Goal N°4** | Como paciente, quiero registrar una comida tomándole una foto y confirmando la porción estimada, para mantener mi diario al día con el mínimo esfuerzo. |
|---|---|

<p class="caption"><strong>Tabla 198</strong><br><em>Task flow del Wireflow 4: Registrar una comida con foto</em></p>

| **Task Flow** |
|---|
| 1. El paciente toca «Registrar» en la barra inferior. |
| 2. Toma una foto de la comida con la cámara. |
| 3. Ve la foto y toca «Usar esta foto». |
| 4. Espera mientras se estima el plato. |
| 5. Ve la estimación propuesta y toca «Ajustar gramos». |
| 6. Ajusta la porción y toca «Confirmar». |
| 7. Ve el Diario con el aviso «Comida registrada». |

Desde la barra inferior hasta la confirmación hay seis pasos y solo uno requiere escribir (la porción). La pantalla de espera informa qué ocurre («Viendo tu foto…»), y la estimación muestra su porcentaje de confianza.

<p class="caption"><strong>Figura 135</strong><br><em>Wireflow 4: Registrar una comida con foto</em></p>

<img src="../assets/img/chapter3/wireflows/04_Log_Meal_With_Photo_Wireflow.png" alt="Wireflow 4: Registrar una comida con foto" width="100%" />

##### Wireflow 5: Prepararme para la consulta

<p class="caption"><strong>Tabla 199</strong><br><em>User goal del Wireflow 5: Prepararme para la consulta</em></p>

| **User Goal N°5** | Como paciente, quiero saber cómo prepararme para mi próxima consulta y contarle a mi nutricionista cómo me ha ido, para aprovechar mejor la cita. |
|---|---|

<p class="caption"><strong>Tabla 200</strong><br><em>Task flow del Wireflow 5: Prepararme para la consulta</em></p>

| **Task Flow** |
|---|
| 1. El paciente abre Inicio y toca «Próxima consulta». |
| 2. Lee cómo prepararse para la consulta y toca «Ver mis consultas». |
| 3. Ve «Mis consultas» y toca «Responder». |
| 4. Le cuenta a su nutricionista cómo le fue y toca «Enviar a mi nutricionista». |
| 5. Ve «Mis consultas» con la respuesta enviada. |

<p class="caption"><strong>Figura 136</strong><br><em>Wireflow 5: Prepararme para la consulta</em></p>

<img src="../assets/img/chapter3/wireflows/05_Prepare_For_Consultation_Wireflow.png" alt="Wireflow 5: Prepararme para la consulta" width="85%" />

#### 3.1.4.3. Mobile Applications Mock-ups

Los mock-ups aplican el sistema de diseño «Healthify M3» sobre los wireframes de 3.1.4.1: fondo crema `#F6F4EE`, tarjetas blancas, verde `#3B6E23` para la navegación activa y los enlaces, naranja `#F5A623` para la acción principal, Anton en títulos y métricas, y Open Sans en el resto. Se presentan las mismas seis pantallas.

<p class="caption"><strong>Figura 137</strong><br><em>Mock-ups de las pantallas representativas de la aplicación móvil</em></p>

<table align="center">
  <tr>
    <td align="center"><img src="../assets/img/chapter3/mobile/mockups/1-inicio.png" alt="Mock-up de Inicio del paciente" width="150" /><br/><sub>Paciente · Inicio</sub></td>
    <td align="center"><img src="../assets/img/chapter3/mobile/mockups/2-estimacion.png" alt="Mock-up de estimación propuesta" width="150" /><br/><sub>Paciente · Estimación propuesta</sub></td>
    <td align="center"><img src="../assets/img/chapter3/mobile/mockups/3-tendencia.png" alt="Mock-up de tendencia de peso" width="150" /><br/><sub>Paciente · Tendencia de peso</sub></td>
  </tr>
  <tr>
    <td align="center"><img src="../assets/img/chapter3/mobile/mockups/4-bandeja.png" alt="Mock-up de la bandeja de revisión" width="150" /><br/><sub>Nutricionista · Bandeja</sub></td>
    <td align="center"><img src="../assets/img/chapter3/mobile/mockups/5-ficha.png" alt="Mock-up de la ficha del paciente" width="150" /><br/><sub>Nutricionista · Ficha del paciente</sub></td>
    <td align="center"><img src="../assets/img/chapter3/mobile/mockups/6-diagnostico.png" alt="Mock-up del diagnóstico con IA" width="150" /><br/><sub>Nutricionista · Diagnóstico con IA</sub></td>
  </tr>
</table>

<p class="caption"><strong>Tabla 201</strong><br><em>Aplicación del sistema de diseño en los mock-ups móviles</em></p>

| Aspecto | Aplicación |
|---|---|
| **Sistema de diseño** | Los componentes (botón, tarjeta, chip de estado, campo de texto, barra de navegación, snackbar, diálogo) son los del sistema, con los mismos nombres en el Figma y en el código de la app. Cada pantalla tiene su frame de notas con estados y validaciones. |
| **Color** | El naranja aparece una vez por pantalla, en la acción principal (en las pestañas del paciente, el botón «Registrar» de la barra). El verde marca lo activo y lo vigente (ítem de la barra inferior, chip «Vigente»). El rojo se reserva a errores. Un punto naranja en la bandeja indica señales sin resolver. |
| **Tipografía** | Anton en el título de pantalla y en las métricas («1 260 / 1 850 kcal», «−0,3 kg/sem»), para que el dato se lea de un vistazo. Open Sans en el resto de textos. |
| **Jerarquía visual** | En Inicio, la meta del día y el botón naranja ocupan el centro de la pantalla. En la ficha del paciente, el botón «Iniciar consulta» queda fijo al pie, sobre el contenido que se desplaza. |
| **Heurísticas** | H1 (la estimación muestra su confianza y el diario marca «Por confirmar» lo no confirmado), H5 (prevención de errores: el nutricionista confirma antes de salir de una consulta), H9 (los mensajes de error explican qué pasó y qué hacer: «Lo que escribiste no se perdió» y «Volver a intentarlo») y H4 (consistencia entre las pantallas de ambos roles). |
| **IA bajo control del usuario** | Las sugerencias llevan la insignia «IA» y se pueden aceptar, cambiar o ignorar. La estimación de una foto queda «Por confirmar» hasta que el paciente la confirma. |
| **Diseño inclusivo** | Contraste verificado de texto (≥ 4.5:1) y de elementos no textuales (≥ 3:1), áreas táctiles de 48 dp, estados con texto además de color, tamaño de fuente que sigue la configuración del sistema, español e inglés, y funcionamiento sin conexión para registrar comidas y autopesajes con aviso al usuario. |
| **Arquitectura de información** | Barra inferior por rol, rótulos breves y títulos de pantalla que coinciden con la etiqueta por la que se llegó a ellas («Bandeja» lleva a «Bandeja», «Diario» a «Tu diario»). |

#### 3.1.4.4. Mobile Applications User Flow Diagrams

Cada User Flow parte del mismo objetivo que su Wireflow y se construye con los mock-ups de las pantallas. Muestra la ruta esperada (happy path) y las rutas alternativas (unhappy paths) con las condiciones que las activan. Los user flows son consistentes con los wireflows de 3.1.4.2.

##### User Flow 1: Atender una consulta

<p class="caption"><strong>Tabla 202</strong><br><em>User goal del User Flow 1: Atender una consulta</em></p>

| **User Goal N°1** | Como nutricionista, quiero conducir la consulta de un paciente en cuatro pasos guiados, con apoyo de IA en el diagnóstico, para publicar un plan actualizado de forma rápida y precisa. |
|---|---|

<p class="caption"><strong>Tabla 203</strong><br><em>Happy path del User Flow 1: Atender una consulta</em></p>

| **Happy Path** |
|---|
| 1. El nutricionista abre «Mis pacientes» y toca a Ana Flores. |
| 2. Ve la pestaña Resumen de Ana y toca «Iniciar consulta». |
| 3. Registra la medición de hoy (paso 1) y toca «Continuar a diagnóstico». |
| 4. Revisa el diagnóstico con apoyo de IA (paso 2) y toca «Continuar a metas». |
| 5. Revisa las metas calculadas (paso 3) y toca «Aceptar metas». |
| 6. Escribe las indicaciones (paso 4) y toca «Publicar y cerrar consulta». |
| 7. Vuelve al Resumen del paciente y ve el aviso «Plan publicado». |

<p class="caption"><strong>Tabla 204</strong><br><em>Unhappy path 1 (falla la publicación) del User Flow 1: Atender una consulta</em></p>

| **Unhappy Path 1: falla la publicación** |
|---|
| 1. El nutricionista toca «Publicar y cerrar consulta» en el paso 4. |
| 2. Ve el error «No pudimos publicar el plan» y toca «Volver a intentarlo». |
| 3. Vuelve al paso 4 para publicar otra vez. |

<p class="caption"><strong>Tabla 205</strong><br><em>Unhappy path 2 (salir de la consulta) del User Flow 1: Atender una consulta</em></p>

| **Unhappy Path 2: salir de la consulta** |
|---|
| 1. El nutricionista toca «Atrás» durante el paso 1 (Medición de hoy). |
| 2. Ve «¿Salir de la consulta?» y toca «Salir y continuar después». |
| 3. Ve el perfil del paciente con la consulta en curso y toca «Continuar consulta». |
| 4. Retoma la consulta en el paso 1. |

La consulta se puede interrumpir sin perder lo ingresado: queda como borrador y se reanuda desde el perfil del paciente. Si la consulta se abrió por error, el paso 1 permite borrarla («¿Borrar esta consulta?»); el plan y las metas vigentes no cambian.

<p class="caption"><strong>Figura 138</strong><br><em>User Flow 1: Atender una consulta</em></p>

<img src="../assets/img/chapter3/userflows/01_Attend_Consultation_Userflow.png" alt="User Flow 1: Atender una consulta" width="100%" />

##### User Flow 2: Evaluar a un paciente nuevo

<p class="caption"><strong>Tabla 206</strong><br><em>User goal del User Flow 2: Evaluar a un paciente nuevo</em></p>

| **User Goal N°2** | Como nutricionista, quiero registrar los datos base de un paciente nuevo una sola vez, para iniciar su primera consulta sin volver a pedir la misma información. |
|---|---|

<p class="caption"><strong>Tabla 207</strong><br><em>Happy path del User Flow 2: Evaluar a un paciente nuevo</em></p>

| **Happy Path** |
|---|
| 1. El nutricionista abre «Mis pacientes» y toca a Luz Ramírez. |
| 2. Ve el perfil del paciente nuevo, sin datos base, y toca «Registrar datos base». |
| 3. Ingresa los datos base y toca «Guardar e iniciar consulta». |
| 4. Inicia la primera consulta en el paso 1 (Medición de hoy). |

<p class="caption"><strong>Tabla 208</strong><br><em>Unhappy path 1 (guardar sin iniciar la consulta) del User Flow 2: Evaluar a un paciente nuevo</em></p>

| **Unhappy Path 1: guardar sin iniciar la consulta** |
|---|
| 1. El nutricionista ingresa los datos base y toca «Guardar y salir». |
| 2. Vuelve al perfil del paciente sin iniciar la consulta. |

<p class="caption"><strong>Figura 139</strong><br><em>User Flow 2: Evaluar a un paciente nuevo</em></p>

<img src="../assets/img/chapter3/userflows/02_Evaluate_New_Patient_Userflow.png" alt="User Flow 2: Evaluar a un paciente nuevo" width="75%" />

##### User Flow 3: Atender una señal de la bandeja

<p class="caption"><strong>Tabla 209</strong><br><em>User goal del User Flow 3: Atender una señal de la bandeja</em></p>

| **User Goal N°3** | Como nutricionista, quiero revisar las señales de mis pacientes en la bandeja y ajustar un plan propuesto por la IA, para actuar entre consultas sin perder el control del plan. |
|---|---|

<p class="caption"><strong>Tabla 210</strong><br><em>Happy path del User Flow 3: Atender una señal de la bandeja</em></p>

| **Happy Path** |
|---|
| 1. El nutricionista abre la Bandeja de revisión y toca la señal de Ana Flores (desviación sostenida). |
| 2. Revisa la señal y el plan propuesto por la IA y toca «Ajustar». |
| 3. Ajusta el plan propuesto y toca «Asignar plan ajustado». |
| 4. Vuelve a la bandeja y ve la señal marcada como resuelta. |

Este flujo no tiene ruta alternativa documentada: la pantalla de la señal solo ofrece «Ajustar», «Resolver» y el retroceso.

<p class="caption"><strong>Figura 140</strong><br><em>User Flow 3: Atender una señal de la bandeja</em></p>

<img src="../assets/img/chapter3/userflows/03_Handle_Inbox_Signal_Userflow.png" alt="User Flow 3: Atender una señal de la bandeja" width="75%" />

##### User Flow 4: Registrar una comida con foto

<p class="caption"><strong>Tabla 211</strong><br><em>User goal del User Flow 4: Registrar una comida con foto</em></p>

| **User Goal N°4** | Como paciente, quiero registrar una comida tomándole una foto y confirmando la porción estimada, para mantener mi diario al día con el mínimo esfuerzo. |
|---|---|

<p class="caption"><strong>Tabla 212</strong><br><em>Happy path del User Flow 4: Registrar una comida con foto</em></p>

| **Happy Path** |
|---|
| 1. El paciente toca «Registrar» en la barra inferior. |
| 2. Toma una foto de la comida con la cámara. |
| 3. Ve la foto y toca «Usar esta foto». |
| 4. Espera mientras se estima el plato. |
| 5. Ve la estimación propuesta y toca «Ajustar gramos». |
| 6. Ajusta la porción y toca «Confirmar». |
| 7. Ve el Diario con el aviso «Comida registrada». |

<p class="caption"><strong>Tabla 213</strong><br><em>Unhappy path 1 (no se pudo estimar el plato) del User Flow 4: Registrar una comida con foto</em></p>

| **Unhappy Path 1: no se pudo estimar el plato** |
|---|
| 1. El paciente ve «No pudimos estimar» y toca «Registrar a mano». |
| 2. Busca el alimento manualmente. |
| 3. Ve el alimento encontrado y toca «Registrar». |
| 4. Ve el Diario con el aviso «Comida registrada» (registro manual). |

Si la foto no se reconoce, el paciente no pierde el registro: la app le ofrece la búsqueda de alimentos de 3.1.2.4 con el mismo destino final.

<p class="caption"><strong>Figura 141</strong><br><em>User Flow 4: Registrar una comida con foto</em></p>

<img src="../assets/img/chapter3/userflows/04_Log_Meal_With_Photo_Userflow.png" alt="User Flow 4: Registrar una comida con foto" width="100%" />

##### User Flow 5: Prepararme para la consulta

<p class="caption"><strong>Tabla 214</strong><br><em>User goal del User Flow 5: Prepararme para la consulta</em></p>

| **User Goal N°5** | Como paciente, quiero saber cómo prepararme para mi próxima consulta y contarle a mi nutricionista cómo me ha ido, para aprovechar mejor la cita. |
|---|---|

<p class="caption"><strong>Tabla 215</strong><br><em>Happy path del User Flow 5: Prepararme para la consulta</em></p>

| **Happy Path** |
|---|
| 1. El paciente abre Inicio y toca «Próxima consulta». |
| 2. Lee cómo prepararse para la consulta y toca «Ver mis consultas». |
| 3. Ve «Mis consultas» y toca «Responder». |
| 4. Le cuenta a su nutricionista cómo le fue y toca «Enviar a mi nutricionista». |
| 5. Ve «Mis consultas» con la respuesta enviada. |

<p class="caption"><strong>Tabla 216</strong><br><em>Unhappy path 1 (falla el envío) del User Flow 5: Prepararme para la consulta</em></p>

| **Unhappy Path 1: falla el envío** |
|---|
| 1. El paciente toca «Enviar a mi nutricionista». |
| 2. Ve «No pudimos enviar tu respuesta» y toca «Volver a intentarlo». |
| 3. Vuelve al formulario de respuesta para enviarla otra vez. |

<p class="caption"><strong>Figura 142</strong><br><em>User Flow 5: Prepararme para la consulta</em></p>

<img src="../assets/img/chapter3/userflows/05_Prepare_For_Consultation_Userflow.png" alt="User Flow 5: Prepararme para la consulta" width="100%" />

#### 3.1.4.5. Mobile Applications Prototyping

<p class="caption"><strong>Figura 143</strong><br><em>Prototipo del landing page en móvil (Mobile Web Browser)</em></p>

|<center> Mobile Web Browser|
|---|
|![Mobile Web Browser](../assets/img/chapter3/prototyping/mobile.png)|
|[Link video Mobile Web Browser](https://upcedupe-my.sharepoint.com/:v:/g/personal/u202417857_upc_edu_pe/IQBGTplwBUVkRaZOZoRPKNXUAabFknjnSM3TRiy17Mg37Js?nav=eyJyZWZlcnJhbEluZm8iOnsicmVmZXJyYWxBcHAiOiJPbmVEcml2ZUZvckJ1c2luZXNzIiwicmVmZXJyYWxBcHBQbGF0Zm9ybSI6IldlYiIsInJlZmVycmFsTW9kZSI6InZpZXciLCJyZWZlcnJhbFZpZXciOiJNeUZpbGVzTGlua0NvcHkifX0&e=9b2JMj)|

<div style="page-break-after: always"></div>
