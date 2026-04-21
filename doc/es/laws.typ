#set text(lang: "es")
#set document(title: [Reglamento de Amarukusi])

#align(center)[
  #title()
  #linebreak()
  _Versión del 22 de noviembre del 2025._
]

#outline()

#pagebreak()

= Prólogo

Las leyes del juego no abarcan todas las situaciones posibles o modos derivados, por lo cual el arbitraje ve las soluciones previas.

Una condición para considerar una partida como oficial es que se deben seguir las leyes vigentes.

Se recomienda seguir el reglamento para las partidas no competitivas.

= Reglas de juego

== Artículo 1. Naturaleza y objetivos de la partida

1.1. La partida se juega entre dos adversarios que mueven de forma alternada sus piezas sobre un tablero cuadrado, llamado "tablero de juego".

1.2. El jugador con las piezas claras realiza el primer movimiento, de forma alternada el siguiente movimiento lo juega con las piezas oscuras.

1.3. Se considera "turno de juego" desde el momento que el jugador tiene posibilidad de movimiento hasta que se ha realizado un movimiento y sus efectos.

1.4. El objetivo del jugador con las piezas claras (Jugador Sol), es ocupar el centro con una pieza en estado civil, usar dos de sus piezas para realizar un rescate y finalmente mover todas sus piezas a la frontera del tablero de juego.

1.5. El objetivo del jugador con las piezas oscuras (Jugador Luna), es impedir que ocupen el centro o que el rival no llegue a la frontera del tablero de juego.

1.6. Cuando se cumple el objetivo de no tener piezas del jugador Sol fuera de la frontera no continental se considera como "partida finalizada".

1.7. Finalizada la partida se realiza un recuento de puntos para determinar al ganador o empate.

== Artículo 2. Condición inicial de juego

2.1. El espacio de juego tiene un tablero tiene 49 casillas cuadradas, con distribución de 7 x 7, donde cada una tiene una representación, diferenciadas por casillas claras y oscuras.

2.2. Al comienzo de la partida, el jugador Sol tiene 7 piezas claras fuera del tablero; el jugador Luna tiene 7 piezas oscuras fuera del tablero.

2.3. Se considera como primera casilla a la ubicada en la parte inferior más a la derecha desde la perspectiva del jugador, teniendo a los jugadores adversarios ubicados uno frente al otro.

2.4. Las siete hileras horizontales se denominan Marcas, desde "a" hasta "g" para jugador Sol y jugador Luna. Las siete hileras verticales se denominan Escalas, numeradas desde cero hasta seis, desde la primara casilla.

== Artículo 3. El movimiento de piezas

3.1. No se permite mover piezas en casillas ocupadas por el mismo color.

3.2. Una pieza en el tablero no puede cambiar su estado de pieza.

3.3. Según el estado de pieza tiene un movimiento correspondiente.

3.3.1. Estado civil, se puede mover una casilla libre a cualquier dirección.

3.3.2. Estado militar, se puede mover hasta dos casillas libres en horizontal o vertical.

3.3.3. Estado estatal, se puede mover hasta dos casillas libres en diagonal.

3.4. En el primer movimiento del jugador Sol, puede colocar una pieza en estado civil en cualquier casilla que representa al continente dentro del tablero de juego.

3.5. Para todo movimiento de colocar una nueva pieza en el tablero, debe ser desde cualquier casilla que representa a la frontera del tablero.

3.6. En las casillas oscuras en la frontera se permite colocar cualquier tipo de pieza y a las casillas claras en la frontera solo permite piezas en el estado civil cuando aparecen en el tablero.

3.7. Existen tres clases de efectos por los movimientos.

3.7.1. Movimiento de derribo, consiste en poner dos piezas en horizontal o vertical teniendo al adversario en medio. La pieza del adversario sale y se agrega a tus piezas fuera del tablero.

3.7.2. Movimiento de rescate, similar al derribo, pero se da de forma obligatoria en piezas civiles que no pertenecen al adversario.

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

5.2. En caso de empate, si se considera un desempate técnico se da por ganador al con mayor cantidad de piezas en orden al valor de puntos.

5.3. Cuando el adversario propone una rendición durante su turno de movimiento, la partida se considera finalizada.

== Artículo 6. Información sobre la partida

6.1. El tiempo de la partida es en UTC con fecha y hora (visible hasta segundos).

6.2. El tiempo del jugador, es un temporizador descendiente en mili-segundos.

6.3. Las piezas para utilizar y las piezas por derribos, se consideran como iguales.

6.4. Las piezas atacadas se consideran diferentes a las anteriores.

6.5. Se tiene una notación para las casillas del tablero.

6.5.1. Desde arriba a la izquierda hacia la derecha, se anotan las casillas libres de la hilera usando números.

6.5.2. Para las piezas claras se usa: k) civil, l) estatal a la izquierda, m) militar y n) estatal a la derecha; Las piezas oscuras usa: p) civil, q) estatal a la izquierda, r) militar y s) estatal a la derecha.

6.5.3. Para diferenciar entre hileras de siete casillas se utiliza un separador diferente a espacio (considerar barra invertida "/").

6.6. La notación para un movimiento o colocación de pieza en el tablero.

6.6.1. Con letras se diferencia el estado de la pieza según el jugador.

6.6.2. Con letras la marca según el jugador y su escala con números.

6.6.3. Un separador (considerar "/") para luego colocar desde donde viene la pieza, omitir si se coloca por primera vez en el tablero de juego.

== Artículo 7. La representación de las casillas

7.1. Desde la perspectiva del jugador Sol, el tablero tiene 4 sectores de 12 casillas y un sector de una casilla.

7.1.1. Primer sector, desde "a0" hasta "d2".

7.1.2. Segundo sector, desde "e0" hasta "g3".

7.1.3. Tercer sector, desde "g4" hasta "d6".

7.1.4. Cuarto sector, desde "c6" hasta "a3".

7.1.5. Sector de gobierno es en "d3".

7.2. Las casillas en el perímetro del tablero se le conoce como frontera.

7.2.1. Las casillas oscuras en las esquinas (a0, a6, g0 y g6) representan al territorio exterior o islas.

7.2.2. Las casillas oscuras en medio (a3, d0, d6 y g3) representan a la frontera continental.

7.3. Casillas del territorio continental.

7.3.1. Casilla del sector de gobierno: d3.

7.3.2. Casillas de la costa, oscuras: a3, d0, d6 y g3.

7.3.3. Casillas de la selva, oscuras: b2, b4, c1, c5, e1, e5, f2 y f4; claras: b3, d1, d5 y f3.

7.3.4. Casillas de la sierra, oscuras: c3, d2, d4 y e3; claras: c2, c4, e2 y e4.

7.4. Las casillas que no son territorio representan al océano.


= Reglas del competitivo

== Artículo 8. Dimensiones en el juego

8.1. El lado de la casilla es la unidad de medida básica, donde la pieza tiene una proporción de 80/100 con la mitad de color claro y una marca o perforación pasante para diferenciar su orientación.

8.1.1. El juego requiere 16 piezas, 7 para cada jugador y 2 de ayuda.

8.1.2. Las 2 piezas de ayuda sirven para que el adversario y terceros tengan visible quien tiene el turno de juego, así como la orientación de la pieza en estado civil.

8.1.3. Los colores claros y oscuros de las piezas deben ser diferentes a los colores de las casillas.

8.2. La casilla se encuentran en hileras de 9 x 9 formando el espacio de juego y las hileras de 7 x 7 centrales son el tablero de juego.

8.2.1. Para marcar contraste se usan líneas de 5/100 en proporción al lado de la casilla.

8.3. El tiempo para cada jugador es de 12 minutos por partida y son dos partidas intercambiando quien es el jugador Sol.

== Artículo 9. El marcador final

9.1. Se requiere el registro por un tercero de cada movimiento hasta finalizar la partida.

9.2. Si es partida única no se permite un empate por puntos, pero sí un empate técnico.

9.3. Si es por más de una partida se juega en ida y vuelva, sumando los puntos para decidir al ganador.

9.4. El ganador o en empate se tiene una bonificación agregada de 50% de los puntos obtenidos.
