require './tablero.rb'
require './jugador'
tab = Tablero.new(3)
jugadorX = Jugador.new('X')
jugadorO = Jugador.new('O')
fin = false
while (fin != true)
	fin = jugadorX.mover(tab)
	tab.recorrer_tablero
	fin = jugadorO.mover(tab) if !fin
	tab.recorrer_tablero
end