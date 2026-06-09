#set text(lang: "es")
#set document(title: [Reglamento de Amarukusi])
#show table.cell: set text(size: 9pt)
#let chakana() = {
  table(
    inset: 10pt,
    columns: 7,
    rows: 7,
    stroke: none,
    fill: (x, y) => {
      let r = x * 7 + y
      if (0, 3, 6, 9, 11, 15, 17, 19, 21, 23, 25, 27, 29, 31, 33, 37, 39, 42, 45, 48).contains(r) {
        black
      } else {
        white
      }
    }
  )
}
#let piece(n) = {
  let hole = ((0pt, -12pt), (-12pt, 0pt), (0pt, 12pt), (12pt, 0pt)).at(n)
  circle(
    radius: 20pt,
    fill: black,
    place(
      center + horizon,
      dx: hole.at(0),
      dy: hole.at(1),
      circle(
        radius: 5pt,
        fill: white,
      ),
    ),
  )
}

#align(center)[
  #title()
  #linebreak()
  #chakana()
  #linebreak()
  _Versión del 09 de junio del 2026._
]

#outline()

#pagebreak()

= Prólogo

Las leyes del juego no abarcan todas las situaciones posibles o modos derivados, por lo cual el arbitraje resuelve en base a las soluciones previas.

Una condición para considerar una partida como oficial es que se deben seguir las leyes vigentes.

Se recomienda seguir el reglamento para las partidas no competitivas.

= Reglas de juego

== Artículo 1. Naturaleza y objetivos de la partida

1.1. La partida se juega entre dos adversarios que mueven de forma alternada sus piezas sobre un tablero cuadrado, llamado "tablero de juego".

1.2. El jugador con las piezas claras realiza el primer movimiento, de forma alternada el siguiente movimiento lo juega con las piezas oscuras.

1.3. Se considera "turno de juego" desde el momento que el jugador tiene posibilidad de movimiento hasta que se ha realizado un movimiento y sus efectos.

1.4. El objetivo del jugador con las piezas claras (Jugador Sol), es ocupar el centro con una pieza en estado civil, usar dos de sus piezas para realizar un rescate y finalmente mover todas sus piezas a la frontera del tablero de juego.

1.5. El objetivo del jugador con las piezas oscuras (Jugador Luna), es impedir que ocupen el centro o que el adversario llegue a la frontera del tablero de juego.

1.6. Cuando se cumple el objetivo de no tener piezas del jugador Sol fuera de la frontera no continental se considera como "partida finalizada".

1.7. Finalizada la partida se realiza un recuento de puntos para determinar al ganador o empate.

== Artículo 2. Condición inicial de juego

#align(center)[
  #table(
    columns: 9,
    rows: 9,
    stroke: (x, y) => {
      if (x >= 1 and x <= 7 and y >= 1 and y <= 7) {
        1pt
      } else {
        none
      }
    },
    ..("A", "B", "C", "D", "E", "F", "G").enumerate().map(((i, letra)) => table.cell(y: 8, x: 7 - i)[#letra]),
    ..("A", "B", "C", "D", "E", "F", "G").enumerate().map(((i, letra)) => table.cell(x: 1 + i)[#letra]),
    ..range(1, 8).map(i => table.cell(y: i)[#i]),
    ..range(1, 8).map(i => table.cell(x: 8, y: 8 - i)[#i]),
    table.cell(x: 0, y: 0)[#circle(radius: 3pt, fill: black)],
    table.cell(x: 8, y: 8)[#circle(radius: 3pt)],
  )
]

2.1. El espacio de juego tiene un tablero de 49 casillas cuadradas, con distribución de 7 x 7, donde cada una tiene una representación, diferenciadas por casillas claras y oscuras.

2.2. Al comienzo de la partida, el jugador Sol tiene 7 piezas claras fuera del tablero; el jugador Luna tiene 7 piezas oscuras fuera del tablero.

2.3. Se considera como primera casilla a la ubicada en la parte inferior más a la derecha desde la perspectiva del jugador, teniendo a los jugadores adversarios ubicados uno frente al otro.

2.4. Las siete hileras horizontales se denominan Marcas, desde "A" hasta "G" para jugador Sol y jugador Luna. Las siete hileras verticales se denominan Escalas, numeradas desde uno hasta siete, desde la primara casilla.

== Artículo 3. El movimiento de piezas

#align(center)[
  #table(
    columns: 17,
    rows: 6,
    gutter: 1pt,
    stroke: none,
    table.cell(y: 5, colspan: 5)[Civil],
    table.cell(y: 5, x: 6, colspan: 5)[Militar],
    table.cell(y: 5, x: 12, colspan: 5)[Estatal],
    ..(2, 8, 14).map(i => table.cell(y: 2, x: i, fill: black)[]),
    ..(
      (1, 1),
      (1, 2),
      (1, 3),
      (2, 1),
      (2, 3),
      (3, 1),
      (3, 2),
      (3, 3),
      (6, 2),
      (7, 2),
      (8, 0),
      (8, 1),
      (8, 3),
      (8, 4),
      (9, 2),
      (10, 2),
      (12, 0),
      (12, 4),
      (13, 1),
      (13, 3),
      (15, 1),
      (15, 3),
      (16, 0),
      (16, 4),
    ).map(cell => table.cell(x: cell.at(0), y: cell.at(1), fill: silver)[]),
  )
]

3.1. No se permite mover piezas en casillas ocupadas por el mismo color.

3.2. Una pieza en el tablero no puede cambiar su estado de pieza.

3.3. Según el estado de pieza tiene un movimiento correspondiente.

3.3.1. Estado civil, se puede mover una casilla libre a cualquier dirección.

3.3.2. Estado militar, se puede mover hasta dos casillas libres en horizontal o vertical.

3.3.3. Estado estatal, se puede mover hasta dos casillas libres en diagonal.

3.4. En el primer movimiento del jugador Sol, puede colocar una pieza en estado civil en cualquier casilla que representa al continente dentro del tablero de juego.

3.5. Para todo movimiento de colocar una nueva pieza en el tablero, debe ser desde cualquier casilla que representa a la frontera del tablero.

3.6. En las casillas oscuras en la frontera se permite colocar cualquier tipo de pieza y a las casillas claras en la frontera solo permite piezas en el estado civil cuando aparecen en el tablero.

3.7. Existen tres clases de efectos para los movimientos.

3.7.1. Movimiento de derribo, consiste en poner dos piezas en horizontal o vertical teniendo al adversario en medio. La pieza del adversario sale y se agrega a tus piezas fuera del tablero.

3.7.2. Movimiento de rescate, similar al derribo, pero se da de forma obligatoria en la pieza civil que ocupa el centro del tablero, esto extiende el turno, para mover la pieza civil afectada a la casilla libre más cercana.

3.7.3. Movimiento de ataque, consiste en reemplazar una pieza en una casilla ocupada por el adversario y la pieza reemplazada no puede volver al tablero.

== Artículo 4. La acción de mover las piezas

4.1. El movimiento de piezas debe ser visible para el adversario y otros observadores.

4.2. Cuando la pieza ocupa otra casilla y aplican sus efectos, se considera "movimiento completo" y se da por finalizado el tiempo de movimiento del jugador.

4.3. Los efectos del movimiento se da dependiendo si existe una pieza ocupando el centro del tablero, si está ocupado solo se permite derribos, sino ataques.

4.3.1. Es un movimiento de derribo o de derribo múltiple, cuando lleva a las piezas del adversario fuera del tablero de juego y luego se permite volver a utilizar.

4.3.2. Es un movimiento de ataque, cuando lleva a la pieza fuera del tablero de juego y no se permite volver a utilizar.

== Artículo 5. La finalización de la partida

5.1. La partida se considera ganada teniendo la mayor cantidad de puntos, cuando el jugador Sol tiene todas sus piezas en la frontera no continental o cuando un jugador se queda sin tiempo.

5.1.1. Cada pieza sobre el tablero tiene valor de 3 puntos.

5.1.2. Cada pieza atacada al adversario tiene valor de 2 puntos.

5.1.3. El resto de las piezas disponibles para utilizar tienen valor de 1 punto.

5.2. En caso de empate, si se considera un desempate técnico se da por ganador al con mayor cantidad de piezas en orden descendente al valor de puntos.

5.3. Cuando el adversario propone una rendición durante su turno de movimiento, la partida se considera finalizada.

== Artículo 6. Información sobre la partida

6.1. El tiempo de la partida es en UTC con fecha y hora (visible hasta segundos).

6.2. El tiempo del jugador, es un temporizador descendiente en milisegundos.

6.3. Las piezas para utilizar y las piezas por derribos, se consideran como iguales.

6.4. Las piezas atacadas se consideran diferentes a las anteriores.

6.5. Se tiene una notación para las casillas del tablero.

6.5.1. Desde arriba a la izquierda hacia la derecha, se anotan las casillas libres de la hilera usando números.

#align(center)[
  #table(
    columns: 4,
    stroke: none,
    [#piece(0)], [#piece(1)], [#piece(2)], [#piece(3)],
    [Civil], [Estatal Izquierdo], [Militar], [Estatal Derecho],
  )
]

6.5.2. Para las piezas claras se usa: K) civil, L) estatal a la izquierda, M) militar y N) estatal a la derecha; Las piezas oscuras usa: P) civil, Q) estatal a la izquierda, R) militar y S) estatal a la derecha.

6.5.3. Para diferenciar entre hileras de siete casillas se utiliza un separador diferente a espacio (considerar barra invertida "/").

6.6. La notación para un movimiento o colocación de pieza en el tablero.

6.6.1. Con letras se diferencia el estado de la pieza según el jugador.

6.6.2. Con letras la marca según el jugador y su escala con números.

6.6.3. Un separador (considerar "/") para luego colocar desde donde viene la pieza, omitir si se coloca por primera vez en el tablero de juego.

#pagebreak()

== Artículo 7. La representación de las casillas

#align(center)[
  #grid(
    columns: (auto, 2cm, auto, 2cm, auto),
    rows: 2,
    align: horizon,
    inset: 1pt,
    table(
      columns: 9,
      rows: 9,
      stroke: none,
      table.cell(x: 4, y: 4, stroke: 1pt)[X],
      table.cell(x: 4, y: 5, colspan: 4, rowspan: 3, stroke: 1pt)[I],
      table.cell(x: 1, y: 4, colspan: 3, rowspan: 4, stroke: 1pt)[II],
      table.cell(x: 1, y: 1, colspan: 4, rowspan: 3, stroke: 1pt)[III],
      table.cell(x: 5, y: 1, colspan: 3, rowspan: 4, stroke: 1pt)[IV],
      ..("A", "B", "C", "D", "E", "F", "G").enumerate().map(((i, letra)) => table.cell(y: 8, x: 7 - i)[#letra]),
      ..range(1, 8).map(i => table.cell(x: 8, y: 8 - i)[#i]),
    ),
    [],
    table(
      columns: 9,
      rows: 9,
      stroke: none,
      ..range(0, 49).map(i => {
        let x = calc.trunc(i / 7)
        let y = calc.rem(i, 7)
        let color = rgb("#00f")
        if (0, 6, 42, 48).contains(i) {
          color = rgb("#f00")
        } else if (3, 21, 27, 45).contains(i) {
          color = rgb("#dd0")
        } else if (9, 11, 15, 19, 29, 33, 37, 39).contains(i) {
          color = rgb("#0a0")
        } else if (10, 22, 26, 38).contains(i) {
          color = rgb("#0f0")
        } else if (17, 23, 25, 31).contains(i) {
          color = rgb("#a0a")
        } else if (16, 18, 30, 32).contains(i) {
          color = rgb("#f0f")
        } else if i == 24 {
          color = rgb("#0ff")
        }

        return table.cell(x: x + 1, y: y + 1, stroke: 1pt, fill: color)[]
      }),
      ..("A", "B", "C", "D", "E", "F", "G").enumerate().map(((i, letra)) => table.cell(y: 8, x: 7 - i)[#letra]),
      ..range(1, 8).map(i => table.cell(x: 8, y: 8 - i)[#i]),
    ),

    [],
    table(
      columns: 9, rows: 9, stroke: none,
      ..(3, 9, 10, 11, 15, 16, 17, 18, 19, 21, 22, 23, 24, 25, 26, 27, 29, 30, 31, 32, 33, 37, 38, 39, 45).map(i => {
        let x = calc.trunc(i / 7)
        let y = calc.rem(i, 7)
        return table.cell(x: x + 1, y: y + 1, fill: black, stroke: 1pt)[]
      }),
      ..(0, 1, 2, 4, 5, 6, 7, 13, 14, 20, 28, 34, 35, 41, 42, 43, 44, 46, 47, 48).map(i => {
        let x = calc.trunc(i / 7)
        let y = calc.rem(i, 7)
        return table.cell(x: x + 1, y: y + 1, fill: gray, stroke: 1pt)[]
      }),
      ..("A", "B", "C", "D", "E", "F", "G").enumerate().map(((i, letra)) => table.cell(y: 8, x: 7 - i)[#letra]),
      ..range(1, 8).map(i => table.cell(x: 8, y: 8 - i)[#i]),
    ),

    [Sectores], [], [Regiones], [], [Continente y Frontera],
  )
]

7.1. Desde la perspectiva del jugador Sol, el tablero tiene 4 sectores de 12 casillas y un sector de una casilla.

7.1.1. Primer sector, desde "A1" hasta "D3".

7.1.2. Segundo sector, desde "E1" hasta "G4".

7.1.3. Tercer sector, desde "G5" hasta "D7".

7.1.4. Cuarto sector, desde "C7" hasta "A4".

7.1.5. Sector de gobierno es en "D4".

7.2. Las casillas en el perímetro del tablero se le conoce como frontera.

7.2.1. Las casillas en las esquinas (A1, A7, G1 y G7) representan al territorio exterior o islas.

7.2.2. Las otras casillas representan a la frontera, salvo las que pertenecen al continente (A4, D1, D7 y G4).

7.3. Casillas del territorio continental.

7.3.1. Casilla del cielo: D4.

7.3.2. Casillas de la costa, oscuras: A4, D1, D7 y G4.

7.3.3. Casillas de la selva, oscuras: B3, B5, C2, C6, E2, E6, F3 y F5; claras: B4, D2, D6 y F4.

7.3.4. Casillas de la sierra, oscuras: C4, D3, D5 y E4; claras: C3, C5, E3 y E5.

7.4. Las casillas que no son territorio representan al océano.


= Reglas del competitivo

== Artículo 8. Dimensiones en el juego

8.1. El lado de la casilla es la unidad de medida básica, donde la pieza tiene una proporción de 80/100, con dos caras (claro y oscuro) y una marca o perforación pasante para diferenciar su orientación (estado de pieza).

8.1.1. El juego requiere 16 piezas, 7 para cada jugador y 2 de ayuda.

8.1.2. Las 2 piezas de ayuda sirven para que el adversario y terceros tengan visible quien tiene el turno de juego, así como la orientación de la pieza en estado civil.

8.1.3. Los colores claros y oscuros de las piezas deben ser diferentes a los colores de las casillas.

8.2. La casilla se encuentran en hileras de 9 x 9 formando el espacio de juego, y las hileras de 7 x 7 centrales son el tablero de juego.

8.2.1. Opcionalmente, para marcar contraste se usan líneas con grosor propocional al lado de la casilla.

8.3. El tiempo para cada jugador es de 12 minutos por partida y son dos partidas intercambiando quien es el jugador Sol.

== Artículo 9. El marcador final

9.1. Se requiere el registro por un tercero de cada movimiento hasta finalizar la partida.

9.2. Si es partida única no se permite un empate por puntos, pero sí un empate técnico.

9.3. Si es por más de una partida se juega en ida y vuelva, sumando los puntos para decidir al ganador.

9.4. El ganador tiene una bonificación agregada de 50% de los puntos obtenidos que son destinados a la asignación del rango de jugador (Oro, plata, cobre).
