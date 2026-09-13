# Conclusiones
 
## Conclusiones y Recomendaciones
 
### Conclusiones

#### Sobre el Problem Statement y los resultados obtenidos

El Problem Statement identificó que la brecha del tratamiento nutricional no se encuentra en la falta de un lugar donde almacenar la evaluación, el diagnóstico y el plan de alimentación, sino en la dificultad de contar con información continua, organizada y confiable sobre la alimentación del paciente durante el periodo entre consultas. Las entrevistas realizadas a ambos segmentos confirmaron este planteamiento. El nutricionista entrevistado describió un proceso estructurado en cuatro fases (evaluación, diagnóstico, intervención y seguimiento) y utiliza Nutrimind para diseñar el plan y registrar las medidas de sus pacientes; sin embargo, cuando el paciente regresa a consulta, debe reconstruir lo que comió mediante una nueva entrevista. Es decir, el vacío de información se ubica exactamente en el periodo que el Problem Statement había delimitado, y no en el acto clínico, que ya cuenta con herramientas en el mercado.

Desde la perspectiva del paciente, las entrevistas evidenciaron que la información del tratamiento se encuentra dispersa entre distintos medios. Ambas pacientes reciben y guardan su plan en WhatsApp, mientras que sus medidas y resultados de análisis quedan repartidos entre fotos del celular, el chat compartido y lo que conserva el propio nutricionista. Una de ellas lo resumió al señalar que su plan está en WhatsApp, sus medidas en un bloc de notas y su alimentación diaria únicamente en su memoria. Las entrevistas también confirmaron la omisión selectiva descrita en el perfil de la startup: una de las pacientes no reporta las comidas fuera del plan que considera "autorizadas" dentro del margen de flexibilidad que le otorga su nutricionista, lo que demuestra que la información llega incompleta no solo por olvido, sino también por la forma en que el paciente interpreta su propio plan.

En respuesta a este problema, el equipo diseñó Healthify a partir de un modelo de dominio compuesto por seis bounded contexts, de los cuales `Intake & Body Response` y `Monitoring & Adherence` fueron clasificados como Core por concentrar la diferenciación del producto: el registro de comidas por fotografía, el autopesaje expuesto como tendencia y el índice de consistencia. El diseño táctico de estos contextos garantiza desde la arquitectura los principios que dan respuesta directa al Problem Statement: un diario que el paciente registra sin ser juzgado y que no puede borrarse, una estimación por fotografía que siempre queda como propuesta sujeta a su confirmación, un funcionamiento sin conexión para contextos de conectividad intermitente y una cadena automática de seguimiento que termina en la bandeja del profesional y nunca modifica el plan clínico. Asimismo, las entrevistas permitieron identificar que el principal competidor del periodo entre consultas no es otro software de nutrición, sino WhatsApp, que ambos segmentos ya utilizan como canal informal de seguimiento.

---

## Video App Validation

## Video About the product

## Video About the team