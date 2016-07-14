require './tablero.rb'
require './jugador'
tab = Tablero.new(3)
jugadorX = Jugador.new('X')
jugadorO = Jugador.new('O')
fin = false
while (fin != true)
	fin = jugadorX.mover(tab)
	tab.recorrer_tablero
	if fin
		break
	end
	fin = jugadorO.mover(tab)
	tab.recorrer_tablero
end