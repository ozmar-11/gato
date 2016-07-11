class Tablero

	def initialize(size)
		@tablero = Array.new(size) {
			Array.new(size)
		}
		@casillas_disponibles = size * size
	end

	def recorrer_tablero
		size = @tablero.length
		x = 0
		y = 0
		while y < size
			while x < size
				print @tablero[y][x] || '-'
				x += 1
			end
			x = 0
			y += 1
			puts ''
		end
	end

	def colocar_ficha ( x, y, jugador)
		size = @tablero.length
		puts "aqui"
		if x < size && y < size
			if @tablero[x][y] == nil
				@tablero[x][y] = jugador
				comprobar_ganador(x, y, jugador)
				@casillas_disponibles -= 1
				if @casillas_disponibles == 0
					@empate = true
				end
				return true
			else
				puts 'Lo siento esa casilla ya esta ocupada'
				return false
			end
		else
			puts 'Lo siento la casilla indicada no existe'
			return false
		end
	end

	def comprobar_ganador( x, y, jugador)
		movimientos = @tablero.reject { |casilla|
			casilla.empty?
		}
		if movimientos.length > ((@tablero.length * 2) - 1)
			juego_terminado?
		end
	end

	def juego_terminado?
		if @empate
			puts 'Fin del juego han empatado'
			return true
		end
	end
end

class Jugador
	@jugador = nil
	def initialize(jugador)
		@jugador = jugador

	end

	def mover(tab)
		x = nil
		y = nil
		puts "Turno de #{@jugador}"
		puts 'Ingresa la posicion en X'
		x = gets.to_i
		puts 'Ingresa la posicion en y'
		y = gets.to_i
		if tab.colocar_ficha(x, y, @jugador) == false
			mover(tab)
		end
	end
end
tab = Tablero.new(3)
#puts tab.recorrer_tablero
jugadorX = Jugador.new('X')
jugadorO = Jugador.new('O')
fin = false
while (tab.juego_terminado? != true)
	jugadorX.mover(tab)
	tab.recorrer_tablero
	if tab.juego_terminado?
		break
	end
	jugadorO.mover(tab)
	tab.recorrer_tablero
end