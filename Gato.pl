%Juego del gato con inteligencia artificial

%Vladimir Gutierrez
%Agreguen sus nombres

%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%Espacio de busqueda%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Primero definimos los simbolos

% Sim = {s | s = o, s = x, s = n tal que n es un elemento del conjunto {1,2,3,4,5,6,7,8,9}}. Por lo que

% Sim = {o,x,1,2,3,4,5,6,7,8,9}, donde o y x son las tiradas del jugador y los números del 1 al 9, las posibles opciones de tiro validas.

%Los estados quedarían definidos de la siguiente manera
% S = { m | m es una matriz de 3x3, y m[i,j] = s tal que s es un elemento de Sim para toda 0<=i,j<=2 con i,j en los Naturales.

%El estado inicial estaría definido como sigue 

%
%   |  |                |  |  
% __|__|__            1_|2_|3_
%   |  |       --->     |  |  
% __|__|__            4_|5_|6_
%   |  |                |  |  
%   |  |              7 |8 |9  
%

%Por lo que el estado inicial queda definido por el siguiente predicado

tableroNuevo([[1,2,3],[4,5,6],[7,8,9]]).

%Predicado para imprimir un tablero

imprimirTablero([[A,B,C],[D,E,F],[G,H,I]]):- swritef(I0, '%w%w%w%w%w%w%w%w', [' ',' ','|',' ',' ','|',' ',' ']),write(I0), nl,
                                       swritef(I1, '%w%w%w%w%w%w%w%w', [A,'_','|',B,'_','|',C,'_']),write(I1), nl, write(I0), nl,
                                       swritef(I2, '%w%w%w%w%w%w%w%w', [D,'_','|',E,'_','|',F,'_']),write(I2), nl, write(I0), nl,
                                       swritef(I3, '%w%w%w%w%w%w%w%w', [G,' ','|',H,' ','|',I,' ']),write(I3), nl,nl.

%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%Acciones%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Se definen las posibles acciones validas 

tira([[1,A,B],[C,D,E],[F,G,H]],1,Jugador,[[Jugador,A,B],[C,D,E],[F,G,H]]).
tira([[A,2,B],[C,D,E],[F,G,H]],2,Jugador,[[A,Jugador,B],[C,D,E],[F,G,H]]).
tira([[A,B,3],[C,D,E],[F,G,H]],3,Jugador,[[A,B,Jugador],[C,D,E],[F,G,H]]).
tira([[A,B,C],[4,D,E],[F,G,H]],4,Jugador,[[A,B,C],[Jugador,D,E],[F,G,H]]).
tira([[A,B,C],[D,5,E],[F,G,H]],5,Jugador,[[A,B,C],[D,Jugador,E],[F,G,H]]).
tira([[A,B,C],[D,E,6],[F,G,H]],6,Jugador,[[A,B,C],[D,E,Jugador],[F,G,H]]).
tira([[A,B,C],[D,E,F],[7,G,H]],7,Jugador,[[A,B,C],[D,E,F],[Jugador,G,H]]).
tira([[A,B,C],[D,E,F],[G,8,H]],8,Jugador,[[A,B,C],[D,E,F],[G,Jugador,H]]).
tira([[A,B,C],[D,E,F],[G,H,9]],9,Jugador,[[A,B,C],[D,E,F],[G,H,Jugador]]).


%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%Funciones%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Funcion g que define si un jugador gano

ganarFila([[Jugador,Jugador,Jugador],[_,_,_],[_,_,_]],Jugador).
ganarFila([[_,_,_],[Jugador,Jugador,Jugador],[_,_,_]],Jugador).
ganarFila([[_,_,_],[_,_,_],[Jugador,Jugador,Jugador]],Jugador).

ganarColumna([[Jugador,_,_],[Jugador,_,_],[Jugador,_,_]],Jugador).
ganarColumna([[_,Jugador,_],[_,Jugador,_],[_,Jugador,_]],Jugador).
ganarColumna([[_,_,Jugador],[_,_,Jugador],[_,_,Jugador]],Jugador).

ganarDiagonal([[Jugador,_,_],[_,Jugador,_],[_,_,Jugador]],Jugador).
ganarDiagonal([[_,_,Jugador],[_,Jugador,_],[Jugador,_,_]],Jugador).

ganador(Tablero,Jugador):-ganarColumna(Tablero,Jugador).
ganador(Tablero,Jugador):-ganarFila(Tablero,Jugador).
ganador(Tablero,Jugador):-ganarDiagonal(Tablero,Jugador).

%Predicados para indicar a los jugadores
jugador(x).
jugador(o).
otroJugador(x,o).
otroJugador(o,x).



%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%Implementar%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%

%predicado para que tire la computadora, este lo deben de implementar y es este el que debe tener la inteligencia
%
%
%


%predicados que indican las reglas del juego
explicacion(Jugador):-write('Quieres jugar con x, ó con o.') ,nl,read(Jugador),jugador(Jugador),write('Jugaras con: '),write(Jugador),nl,write('Debes introducir el numero de casilla donde quieras tirar'),nl,!.
explicacion(Jugador):- write('Debes escribir \'x\' ó \'o\''),nl,nl,explicacion(Jugador).


%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%Principal%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Juego del gato, se debe de implementar
gato:-explicacion(Jugador),
     tableroNuevo(Tablero),
     otroJugador(Jugador,Maquina),
     imprimirTablero(Tablero).
