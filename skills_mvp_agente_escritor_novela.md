# Especificación MVP de skills para un agente IA escritor de historias/novelas

## Objetivo

Este documento define las **8 skills MVP** para un primer prototipo de agente IA especializado en escribir historias/novelas/cuentos, diseñado para poder reutilizarse sobre distintos agentes de consola/TUI orientados originalmente a programación.

La filosofía es simple:

- cada skill hace una tarea concreta;
- cada skill lee y escribe ficheros persistentes en un repositorio local;
- el agente trabaja sobre una **biblia editorial** y no solo sobre el contexto de la conversación;
- el flujo soporta tanto **redacción** como **review**;
- las skills deben ser suficientemente explícitas para funcionar en distintos agentes de coding con mínimos cambios.

---

# Principios generales

## Reglas globales para todas las skills

Todas las skills deben seguir estas reglas:

1. **Persistencia primero**
   La información importante debe guardarse en archivos del proyecto, no quedarse solo en la conversación.

2. **Idempotencia razonable**
   Si una skill se ejecuta varias veces, no debe destruir el trabajo existente. Debe completar, actualizar o proponer cambios.

3. **Preguntas mínimas**
   Solo preguntar lo imprescindible si faltan datos críticos.

4. **Trazabilidad**
   Toda salida debe quedar escrita en archivos claramente identificables.

5. **Compatibilidad con git**
   Los cambios deben ser comprensibles como commits pequeños y revisables.

6. **Respeto estricto a estilo y canon**
   El agente no debe improvisar contradiciendo la biblia del proyecto.

7. **Explicitar incertidumbre**
   Si faltan datos, la skill debe indicarlo claramente y proponer supuestos mínimos.

---

# Estructura estándar del proyecto

La skill de inicialización debe crear esta estructura base:

```text
story/
  README.md
  story.yaml

  00_meta/
    premise.md
    goals.md
    constraints.md

  01_style/
    voice.md
    prose_rules.md
    pov.md
    taboo_list.md
    lexical_notes.md

  02_story/
    logline.md
    synopsis.md
    themes.md
    worldbuilding.md
    timeline.md
    chapter_list.md
    open_loops.md

  03_characters/
    protagonist.md
    supporting_cast.md
    relationships.md

  04_outline/
    act_1.md
    act_2.md
    act_3.md
    scene_cards/

  05_draft/
    chapter_01.md
    chapter_02.md

  06_review/
    chapter_01.review.md
    chapter_02.review.md
    manuscript.review.md

  07_continuity/
    canon_facts.yaml
    entities.yaml
    locations.yaml
    unresolved_threads.yaml

  08_exports/
```

---

# Flujo de trabajo MVP

## Fase 1: preparación

1. `init-story-project`
2. `define-style-bible`
3. `create-character-bible`
4. `generate-high-level-outline`

## Fase 2: por cada capítulo

1. `plan-chapter`
2. `draft-chapter`
3. `chapter-review`
4. `continuity-check`

## Fase 3: iteración

- si el review detecta problemas, volver a `plan-chapter` o `draft-chapter`;
- si continuidad detecta contradicciones, actualizar outline, canon o capítulo.

---

# Convención recomendada para implementar cada skill

Cada skill debería convertirse en una carpeta del estilo:

```text
skills/
  init-story-project/
    SKILL.md
  define-style-bible/
    SKILL.md
  ...
```

Cada `SKILL.md` debe incluir, como mínimo:

- Nombre
- Propósito
- Cuándo usarla
- Inputs requeridos
- Archivos a leer
- Archivos a escribir
- Preguntas a hacer si faltan datos
- Procedimiento
- Formato de salida
- Definition of done
- Restricciones
- Ejemplo de invocación

---

# 1) Skill: init-story-project

## Nombre
`init-story-project`

## Propósito
Crear la estructura inicial del proyecto de historia o novela y recopilar el briefing mínimo necesario para empezar a trabajar.

## Cuándo usarla
Usar esta skill cuando:

- no existe todavía un proyecto de historia;
- existe un proyecto parcial y faltan carpetas o archivos esenciales;
- el usuario quiere arrancar una nueva historia desde cero;
- se quiere normalizar un proyecto existente a la estructura estándar.

## Inputs requeridos
Idealmente la skill debe conseguir o derivar estos datos:

- título provisional;
- género y subgénero;
- idioma;
- audiencia objetivo;
- extensión estimada;
- tono general;
- voz narrativa;
- POV;
- tiempo verbal;
- premisa en 1–3 párrafos;
- temas principales;
- restricciones o preferencias explícitas.

## Archivos a leer
Si existen:

- `README.md`
- `story.yaml`
- cualquier archivo ya presente en el repositorio

## Archivos a escribir
Debe crear o completar:

- `README.md`
- `story.yaml`
- toda la estructura base de carpetas
- archivos markdown vacíos con plantilla mínima

## Preguntas a hacer si faltan datos
Solo si no están ya disponibles:

1. ¿Cuál es el título provisional?
2. ¿Qué género o subgénero tiene la historia?
3. ¿En qué idioma se va a escribir?
4. ¿Quién es la audiencia objetivo?
5. ¿Qué extensión aproximada buscas?
6. ¿Qué voz narrativa quieres?
7. ¿Qué POV y tiempo verbal prefieres?
8. ¿Cuál es la premisa?
9. ¿Qué tono o referencias estilísticas quieres?
10. ¿Hay restricciones claras que el agente deba respetar?

## Procedimiento
1. Inspeccionar el directorio actual.
2. Detectar si ya existe estructura previa.
3. Crear las carpetas faltantes.
4. Crear `story.yaml` con metadatos básicos.
5. Crear `README.md` con explicación del flujo recomendado.
6. Crear archivos base con plantillas mínimas.
7. No sobrescribir contenido existente sin justificación.
8. Si ya hay contenido, completar solo huecos.

## Formato de salida
- Resumen breve de lo creado.
- Lista de archivos principales inicializados.
- Siguiente paso recomendado: `define-style-bible`.

## Definition of done
La skill está terminada cuando:

- existe la estructura base del proyecto;
- existe `story.yaml`;
- existe `README.md`;
- están creados los archivos esenciales;
- el briefing mínimo ha quedado persistido en archivos.

## Restricciones
- No destruir trabajo previo.
- No inventar metadatos no confirmados sin marcarlos como provisionales.
- No empezar a redactar capítulos aquí.

## Ejemplo de invocación
```text
Usa init-story-project para crear un proyecto de historia de fantasía oscura en español, con narrador en tercera persona limitada y tono sobrio.
```

---

# 2) Skill: define-style-bible

## Nombre
`define-style-bible`

## Propósito
Construir la biblia de estilo que regirá toda la prosa de la historia.

## Cuándo usarla
Usar esta skill cuando:

- el proyecto ya existe pero no tiene estilo definido;
- la voz todavía es demasiado vaga;
- se quiere consolidar una guía de redacción antes de escribir capítulos;
- tras varios borradores se quiere normalizar el estilo.

## Inputs requeridos
- briefing del proyecto;
- género;
- audiencia;
- referencias estilísticas deseadas o rechazadas;
- tono;
- POV;
- tiempo verbal;
- densidad descriptiva;
- nivel de lirismo;
- preferencia de longitud de frase;
- preferencias de diálogo y exposición.

## Archivos a leer
- `story.yaml`
- `00_meta/premise.md`
- `00_meta/goals.md`
- `00_meta/constraints.md`
- cualquier nota previa del usuario

## Archivos a escribir
- `01_style/voice.md`
- `01_style/prose_rules.md`
- `01_style/pov.md`
- `01_style/taboo_list.md`
- `01_style/lexical_notes.md`

## Preguntas a hacer si faltan datos
1. ¿Quieres una prosa más sobria, lírica, directa, densa o comercial?
2. ¿Hay autores o referencias cuya textura quieras aproximar o evitar?
3. ¿Qué grado de descripción frente a acción prefieres?
4. ¿Qué papel debe tener el diálogo?
5. ¿Hay recursos que quieras prohibir o limitar?

## Procedimiento
1. Extraer señales de estilo del briefing.
2. Convertir preferencias vagas en reglas concretas y operativas.
3. Definir la voz narrativa en términos observables.
4. Especificar reglas de POV y tiempo verbal.
5. Identificar tabúes de estilo.
6. Guardar notas léxicas y decisiones de registro.
7. Escribir reglas que sirvan para evaluar capítulos posteriormente.

## Formato de salida
La skill debe dejar reglas accionables, no descripciones vagas.

### `voice.md`
Debe incluir:
- tono base;
- textura de la prosa;
- distancia narrativa;
- ritmo ideal;
- nivel de explicitud;
- relación entre descripción, acción y diálogo.

### `prose_rules.md`
Debe incluir listas como:
- hacer;
- evitar;
- preferible;
- no usar en exceso.

### `pov.md`
Debe dejar claro:
- POV principal;
- si hay cambios de POV;
- cómo se señalan;
- tiempo verbal;
- límites del acceso mental.

### `taboo_list.md`
Debe listar:
- clichés prohibidos;
- muletillas;
- adjetivación excesiva;
- explicaciones redundantes;
- tics estilísticos no deseados.

### `lexical_notes.md`
Debe anotar:
- registro del vocabulario;
- tecnicismo permitido o no;
- regionalismos;
- palabras recurrentes buscadas o evitadas.

## Definition of done
La skill está terminada cuando existe una biblia de estilo suficiente para que otro agente pueda redactar capítulos de forma consistente.

## Restricciones
- No confundir “inspiración” con imitación servil de autores.
- No dejar reglas ambiguas del tipo “que suene bien”.
- No escribir capítulos aquí.

## Ejemplo de invocación
```text
Usa define-style-bible para fijar una voz seca, elegante y contenida, con frases medias y poco adjetivo.
```

---

# 3) Skill: create-character-bible

## Nombre
`create-character-bible`

## Propósito
Definir personajes principales y secundarios de forma útil para la narración, no solo como fichas decorativas.

## Cuándo usarla
Usar esta skill cuando:

- los personajes todavía no están definidos;
- el usuario tiene ideas dispersas sobre el elenco;
- el agente necesita voz, deseo, conflicto y arco antes de redactar capítulos.

## Inputs requeridos
- premisa;
- género;
- tema;
- outline preliminar si existe;
- lista de personajes conocidos;
- relaciones importantes.

## Archivos a leer
- `story.yaml`
- `00_meta/premise.md`
- `02_story/logline.md`
- `02_story/synopsis.md` si existe
- notas previas de personajes

## Archivos a escribir
- uno o más archivos en `03_characters/`
- `03_characters/protagonist.md`
- `03_characters/supporting_cast.md`
- `03_characters/relationships.md`

Opcionalmente puede crear:
- `03_characters/<nombre_personaje>.md`

## Preguntas a hacer si faltan datos
1. ¿Quién protagoniza la historia?
2. ¿Qué quiere externamente?
3. ¿Qué necesita internamente?
4. ¿Qué le impide cambiar?
5. ¿Quiénes son aliados, antagonistas o figuras bisagra?
6. ¿Qué relaciones son emocionalmente centrales?

## Procedimiento
1. Identificar personajes necesarios para sostener la historia.
2. Priorizar función dramática y voz.
3. Especificar para cada personaje:
   - deseo;
   - necesidad;
   - herida;
   - miedo;
   - contradicción;
   - arco;
   - secretos;
   - forma de hablar;
   - relación con el conflicto central.
4. Documentar relaciones con tensión dramática.
5. Evitar fichas demasiado largas sin utilidad narrativa.

## Formato de salida
Cada personaje importante debe tener, como mínimo:

- rol en la historia;
- objetivo;
- conflicto interno;
- relación con el protagonista;
- arco esperado;
- rasgos de voz;
- información que sabe y que ignora.

## Definition of done
La skill está terminada cuando el agente puede responder de forma consistente:
- quién es cada personaje;
- qué quiere;
- cómo habla;
- cómo cambia;
- con quién entra en fricción.

## Restricciones
- No crear decenas de secundarios innecesarios.
- No hacer descripciones superficiales sin función narrativa.
- No contradecir el tono o género.

## Ejemplo de invocación
```text
Usa create-character-bible para definir protagonista, antagonista y tres secundarios clave.
```

---

# 4) Skill: generate-high-level-outline

## Nombre
`generate-high-level-outline`

## Propósito
Diseñar la estructura global de la historia y convertir la premisa en un recorrido narrativo por actos y capítulos.

## Cuándo usarla
Usar esta skill cuando:

- ya existe premisa, estilo y personajes básicos;
- aún no hay una estructura sólida;
- se quiere un mapa narrativo antes de redactar.

## Inputs requeridos
- premisa;
- tema;
- género;
- personajes;
- longitud estimada;
- preferencias estructurales del usuario.

## Archivos a leer
- `00_meta/premise.md`
- `01_style/*`
- `03_characters/*`
- `02_story/logline.md`
- `02_story/themes.md` si existe

## Archivos a escribir
- `04_outline/act_1.md`
- `04_outline/act_2.md`
- `04_outline/act_3.md`
- `02_story/chapter_list.md`
- opcionalmente `02_story/synopsis.md`

## Preguntas a hacer si faltan datos
1. ¿Prefieres una estructura clásica en tres actos u otra variante?
2. ¿Quieres una historia más de trama, más de personaje o híbrida?
3. ¿Cuántos capítulos aproximados imaginas?
4. ¿Hay hitos obligatorios que quieras incluir?

## Procedimiento
1. Traducir la premisa a conflicto principal.
2. Definir punto de partida y promesa narrativa.
3. Localizar:
   - hook inicial;
   - incidente incitador;
   - primer gran punto de giro;
   - midpoint;
   - crisis;
   - clímax;
   - resolución.
4. Distribuir progresión por actos.
5. Generar una lista provisional de capítulos.
6. Asegurar que cada capítulo avance conflicto, personaje o revelación.

## Formato de salida
### `chapter_list.md`
Cada capítulo debería incluir:
- número;
- título provisional opcional;
- propósito dramático;
- POV;
- resumen de 3–6 líneas;
- cambio que produce.

### archivos de acto
Cada acto debería incluir:
- función del acto;
- tensión dominante;
- hitos clave;
- transformación esperada.

## Definition of done
La skill está terminada cuando existe un outline legible y suficiente para planificar capítulos sin improvisar toda la estructura.

## Restricciones
- No generar una lista de capítulos decorativa sin progresión real.
- No resolver conflictos demasiado pronto.
- No inflar el número de capítulos sin justificación.

## Ejemplo de invocación
```text
Usa generate-high-level-outline para una historia de 18 capítulos con estructura clásica en tres actos.
```

---

# 5) Skill: plan-chapter

## Nombre
`plan-chapter`

## Propósito
Preparar el diseño detallado de un capítulo antes de escribirlo.

## Cuándo usarla
Usar esta skill cuando:

- ya existe outline global;
- se va a redactar un capítulo concreto;
- el agente necesita bajar el capítulo a beats y escenas.

## Inputs requeridos
- número de capítulo;
- outline global;
- estado actual de personajes;
- capítulos previos relevantes;
- canon;
- voz y POV.

## Archivos a leer
- `01_style/*`
- `03_characters/*`
- `04_outline/*`
- `02_story/chapter_list.md`
- capítulos previos en `05_draft/`
- `07_continuity/*` si existe

## Archivos a escribir
Puede escribir o actualizar:
- `05_draft/chapter_XX.md` con cabecera de planificación
- o un archivo auxiliar como `04_outline/chapter_XX.plan.md`

## Preguntas a hacer si faltan datos
1. ¿Qué capítulo quieres planificar?
2. ¿Debe centrarse más en avance de trama, desarrollo de personaje o ambas?
3. ¿Hay escenas obligatorias o revelaciones que quieras incluir?

## Procedimiento
1. Leer el contexto necesario.
2. Determinar desde dónde viene el capítulo y hacia dónde debe llevar.
3. Definir:
   - objetivo del capítulo;
   - conflicto principal;
   - POV;
   - escenas o beats;
   - revelaciones;
   - cierre del capítulo.
4. Verificar continuidad con timeline y estado emocional.
5. Dejar un plan operativo que sirva para redactar sin desviarse.

## Formato de salida
El plan del capítulo debe incluir:

- objetivo narrativo;
- resumen del punto de partida;
- resumen del punto de llegada;
- lista de escenas o beats;
- emociones dominantes;
- información nueva revelada;
- riesgos de continuidad;
- checklist de estilo.

## Definition of done
La skill está terminada cuando otro agente podría escribir el capítulo directamente usando el plan sin tener que reinterpretar todo el outline.

## Restricciones
- No redactar el capítulo completo aquí salvo que el usuario lo pida.
- No ignorar lo ya ocurrido en capítulos anteriores.
- No introducir cambios estructurales mayores sin dejar constancia.

## Ejemplo de invocación
```text
Usa plan-chapter para preparar el capítulo 7, centrado en una confrontación entre la protagonista y su hermano.
```

---

# 6) Skill: draft-chapter

## Nombre
`draft-chapter`

## Propósito
Redactar el borrador completo de un capítulo respetando estilo, outline, continuidad y estado de personajes.

## Cuándo usarla
Usar esta skill cuando:

- ya existe un plan razonable del capítulo;
- el usuario quiere un borrador completo;
- hay suficientes materiales de contexto para escribir con consistencia.

## Inputs requeridos
- número de capítulo;
- plan del capítulo;
- biblia de estilo;
- personajes;
- outline;
- continuidad;
- capítulos anteriores relevantes.

## Archivos a leer
- `01_style/*`
- `03_characters/*`
- `04_outline/*`
- `05_draft/chapter_XX.md` si contiene un plan
- capítulos previos
- `07_continuity/*`

## Archivos a escribir
- `05_draft/chapter_XX.md`

## Preguntas a hacer si faltan datos
Solo si son imprescindibles:
1. ¿Qué capítulo quieres redactar?
2. ¿Debo seguir exactamente el plan existente o puedo optimizarlo ligeramente?
3. ¿Hay longitud objetivo aproximada?

## Procedimiento
1. Reunir el contexto mínimo suficiente.
2. Confirmar POV, tiempo verbal y tono.
3. Redactar el capítulo completo.
4. Respetar:
   - canon factual;
   - estado emocional y conocimiento de personajes;
   - progresión del outline;
   - restricciones estilísticas.
5. Evitar exposición redundante y contradicciones.
6. Dejar un final de capítulo con impulso, cambio o resonancia.

## Formato de salida
El archivo final debe contener:

- título de capítulo o encabezado;
- texto del capítulo;
- opcionalmente una pequeña metadata al inicio si el proyecto la usa.

No debe mezclar comentario editorial dentro del cuerpo narrativo.

## Definition of done
La skill está terminada cuando existe un capítulo completo, legible y coherente con el proyecto, apto para pasar a review.

## Restricciones
- No añadir notas al lector dentro del capítulo.
- No reescribir la historia entera.
- No introducir deus ex machina o contradicciones para resolver un hueco de planning.

## Ejemplo de invocación
```text
Usa draft-chapter para escribir el capítulo 7 a partir del plan existente y con un tono tenso y contenido.
```

---

# 7) Skill: chapter-review

## Nombre
`chapter-review`

## Propósito
Realizar una revisión editorial de un capítulo ya redactado y producir feedback accionable.

## Cuándo usarla
Usar esta skill cuando:

- un capítulo ya está escrito;
- se quiere detectar problemas antes de continuar;
- se necesita priorizar mejoras narrativas y estilísticas.

## Inputs requeridos
- capítulo redactado;
- biblia de estilo;
- outline relevante;
- capítulos cercanos;
- expectativas de calidad del proyecto.

## Archivos a leer
- `05_draft/chapter_XX.md`
- `01_style/*`
- `04_outline/*`
- capítulos adyacentes si procede
- `03_characters/*`

## Archivos a escribir
- `06_review/chapter_XX.review.md`

## Preguntas a hacer si faltan datos
1. ¿Qué capítulo quieres revisar?
2. ¿Quieres una review más editorial-comercial, más literaria o más técnica?
3. ¿Quieres priorización estricta de problemas?

## Procedimiento
1. Leer el capítulo completo.
2. Evaluarlo en varias dimensiones:
   - claridad;
   - tensión;
   - progresión;
   - voz;
   - diálogo;
   - exposición;
   - cierre;
   - coherencia con el outline.
3. Distinguir problemas mayores de ajustes menores.
4. Proponer acciones concretas.
5. Evitar feedback vago o puramente estético.

## Formato de salida
La review debería incluir estas secciones:

1. Resumen del capítulo
2. Lo que funciona
3. Problemas principales
4. Problemas secundarios
5. Riesgos de continuidad detectados
6. Recomendaciones priorizadas
7. Propuesta de siguiente acción

## Definition of done
La skill está terminada cuando el autor o el agente sabe exactamente qué corregir y en qué orden.

## Restricciones
- No limitarse a elogios generales.
- No pedir cambios contradictorios entre sí.
- No reescribir el capítulo completo salvo que el usuario lo solicite explícitamente.

## Ejemplo de invocación
```text
Usa chapter-review para revisar el capítulo 7 con foco en tensión, claridad y cierre.
```

---

# 8) Skill: continuity-check

## Nombre
`continuity-check`

## Propósito
Detectar contradicciones y desajustes de continuidad entre capítulos, personajes, timeline, worldbuilding y canon.

## Cuándo usarla
Usar esta skill cuando:

- se ha redactado un capítulo nuevo;
- se han hecho reescrituras importantes;
- aparecen dudas sobre consistencia;
- antes de encadenar varios capítulos;
- antes de una review más global.

## Inputs requeridos
- capítulo o conjunto de capítulos a revisar;
- canon existente;
- personajes;
- timeline;
- outline.

## Archivos a leer
- `05_draft/*.md` según alcance
- `03_characters/*`
- `02_story/timeline.md`
- `02_story/worldbuilding.md`
- `07_continuity/canon_facts.yaml`
- `07_continuity/entities.yaml`
- `07_continuity/locations.yaml`
- `07_continuity/unresolved_threads.yaml`

## Archivos a escribir
- `06_review/chapter_XX.review.md` si añade sección de continuidad
- y/o actualizar:
  - `07_continuity/canon_facts.yaml`
  - `07_continuity/entities.yaml`
  - `07_continuity/locations.yaml`
  - `07_continuity/unresolved_threads.yaml`

## Preguntas a hacer si faltan datos
1. ¿Sobre qué capítulo o rango de capítulos quieres hacer el chequeo?
2. ¿Quieres solo detección o también propuesta de corrección?
3. ¿Debe actualizar automáticamente los ficheros de continuidad?

## Procedimiento
1. Revisar hechos relevantes del material narrativo.
2. Compararlos con el canon persistido.
3. Detectar inconsistencias en:
   - edades;
   - lugares;
   - tiempos;
   - heridas;
   - conocimiento de personajes;
   - reglas del mundo;
   - objetos;
   - relaciones;
   - promesas narrativas abiertas.
4. Distinguir entre:
   - contradicción real;
   - ambigüedad;
   - dato nuevo que debe añadirse al canon.
5. Registrar hallazgos y actualizar inventarios.

## Formato de salida
La salida debe incluir:

- contradicciones confirmadas;
- ambigüedades;
- nuevos hechos canónicos;
- hilos abiertos detectados;
- recomendaciones de corrección.

## Definition of done
La skill está terminada cuando el estado del canon queda más claro que antes y las contradicciones quedan registradas para corregirse.

## Restricciones
- No inventar correcciones silenciosas dentro de capítulos sin indicarlo.
- No tratar como contradicción lo que puede ser simple omisión.
- No sobrescribir el canon sin justificación.

## Ejemplo de invocación
```text
Usa continuity-check sobre los capítulos 5 a 7 y actualiza los archivos de canon si aparecen nuevos hechos fiables.
```

---

# Recomendaciones de implementación para agentes de coding

## Cómo deben comportarse las skills

Para que estas skills funcionen bien sobre agentes de coding generalistas:

- cada skill debe indicar claramente qué archivos leer antes de actuar;
- cada skill debe recordar al agente que no improvise fuera del canon;
- cada skill debe producir salidas persistidas en disco;
- cada skill debe especificar cuándo preguntar al usuario y cuándo asumir algo provisional.

## Recomendación de tono interno de las skills

Conviene que el texto de cada `SKILL.md` fuerce al agente a operar como:

- editor de desarrollo;
- arquitecto narrativo;
- redactor disciplinado;
- revisor de continuidad;

y no como asistente conversacional genérico.

## Recomendación de commits

Un flujo git razonable sería:

- commit tras `init-story-project`
- commit tras `define-style-bible`
- commit tras `create-character-bible`
- commit tras `generate-high-level-outline`
- commit por cada ciclo:
  - plan capítulo
  - draft capítulo
  - review y fixes
  - continuity update

---

# Orden recomendado de implementación

## Ola 1
- `init-story-project`
- `define-style-bible`

## Ola 2
- `create-character-bible`
- `generate-high-level-outline`

## Ola 3
- `plan-chapter`
- `draft-chapter`

## Ola 4
- `chapter-review`
- `continuity-check`

---

# Checklist de calidad del MVP

El MVP está bien encaminado si permite esto:

1. crear un proyecto nuevo;
2. capturar estilo y restricciones;
3. definir personajes útiles;
4. generar un outline global;
5. planificar un capítulo;
6. redactarlo;
7. revisarlo;
8. detectar problemas de continuidad.

Si esas ocho operaciones funcionan bien, ya existe una base real para iterar hacia un agente escritor serio.

---

# Siguientes pasos sugeridos

Después de este MVP, las siguientes skills naturales serían:

- `sync-story-bible`
- `update-character-state`
- `update-timeline`
- `rewrite-chapter`
- `manuscript-review`
- `beta-reader-pass`
- `prepare-export`

---

# Nota final

Estas skills no intentan “automatizar la literatura” de forma ciega. Su objetivo es proporcionar una **infraestructura editorial agentiva**: un sistema en el que el modelo pueda colaborar de forma consistente, acumulativa y revisable sobre un manuscrito largo.
