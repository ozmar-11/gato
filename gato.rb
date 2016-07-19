require './tablero'
require './jugador'

def obtener_posicion_jugador(jugador, tab)
  puts "Turno de jugador #{jugador.get_jugador}"
  puts 'Ingresa la posicion en X'
  x = gets.to_i
  puts 'Ingresa la posicion en Y'
  y = gets.to_i
  ficha_colocada = jugador.mover(tab, x, y)
  ficha_colocada[1] != nil ? ficha_colocada[1] : obtener_posicion_jugador(jugador, tab)
end

def recorrer_tablero(tablero)
  size = tablero.length
  x = 0
  y = 0
  while y < size
    while x < size
      print tablero[y][x] || '-'
      x += 1
    end
    x = 0
    y += 1
    puts ''
  end
end

tab = Tablero.new(3)
jugadorX = Jugador.new('X')
jugadorO = Jugador.new('O')
fin = false
while (fin == false)
  fin = obtener_posicion_jugador(jugadorX, tab)
  puts "#{fin}" if fin != false
  recorrer_tablero(tab.obtener_tablero)
  fin = obtener_posicion_jugador(jugadorO, tab) if fin == false
  puts "#{fin}" if fin != false
	recorrer_tablero(tab.obtener_tablero)
end