class Tablero
	def initialize(size)
		@tablero = Array.new(size) {
			Array.new(size)
		}
		@casillas_disponibles = size * size
	end

	def obtener_tablero
		return @tablero
	end

	def colocar_ficha ( x, y, jugador)
		size = @tablero.length
		if x < size && y < size
			if @tablero[y][x] == nil
				@tablero[y][x] = jugador
				return [true, juego_terminado?(x, y, jugador)]
			else
				return [false, nil]
			end
		else
			return [false, nil]
		end
	end

	def juego_terminado?(x, y, jugador)
		if comprobar_ganador(x, y, jugador,1)
			return "Fin de juego victoria de jugador #{jugador}"
		else
			if comprobar_empate()
				return 'Fin del juego han empatado'
			end
		end
		return false
	end

	def contar_movimientos
		contador = 0
		@tablero.each do |fila|
			fila.each do |columna|
				contador += 1 if columna != nil
			end
		end
		return contador
	end

	def comprobar_empate
		movimientos = contar_movimientos()
		if movimientos == (@tablero.length ** 2)
			return true
		end
		return false
	end

	def casilla_1(x, y, jugador, contador)
		i = 1
		while ((x - i) >= 0 && (y - i) >= 0 && (@tablero.length != contador))
			contador += 1 if @tablero[y-i][x-i] == jugador
			i += 1
		end
		@tablero.length == contador ? true : casilla_5(x, y, jugador, contador)
	end

	def casilla_2(x, y, jugador, contador)
		i = 1
		while ((y - i) >= 0 && (@tablero.length != contador))
			contador += 1 if @tablero[y-i][x] == jugador
			i += 1
    end
		@tablero.length === contador ? true : casilla_6(x, y, jugador, contador)
	end

	def casilla_3(x, y, jugador, contador)
		i = 1
		while ((x + i) < @tablero.length && (y - i) >= 0 &&(@tablero.length != contador))
			contador += 1 if @tablero[y-i][x+i] == jugador
			i += 1
		end
		@tablero.length == contador ? true : casilla_7(x, y, jugador, contador)
	end

	def casilla_4(x, y, jugador, contador)
		i = 1
		while ((x + i) < @tablero.length && (@tablero.length != contador))
			contador += 1 if @tablero[y][x+i] == jugador
			i += 1
    end
		@tablero.length == contador ? true : casilla_8(x, y, jugador, contador)
	end

	def casilla_5(x, y, jugador, contador)
		i = 1
		while ((x + i) < @tablero.length && (y + i) < @tablero.length && (@tablero.length != contador))
			contador += 1 if @tablero[y+i][x+i] == jugador
			i += 1
		end
		true if @tablero.length == contador
	end

	def casilla_6(x, y, jugador, contador)
		i = 1
		while ((y + i) < @tablero.length && (@tablero.length != contador))
			contador += 1 if @tablero[y+i][x] == jugador
			i += 1
    end
		true if @tablero.length == contador
	end

	def casilla_7(x, y, jugador, contador)
		i = 1
		while ((x - i) >= 0 && (y + i) < @tablero.length && (@tablero.length != contador))
			contador += 1 if @tablero[y+i][x-i] == jugador
			i += 1
		end
		true if @tablero.length == contador
	end

	def casilla_8(x, y, jugador, contador)
		i = 1
		while ((x - i) >= 0 && (@tablero.length != contador))
			contador += 1 if @tablero[y][x-i] == jugador
			i += 1
		end
		true if @tablero.length == contador
	end

	def comprobar_ganador(x, y, jugador, contador)
		size = @tablero.length
		juego_ganado = false
		juego_ganado = casilla_1(x, y, jugador, 1)
		juego_ganado = casilla_2(x, y, jugador, 1) if !juego_ganado
	    juego_ganado = casilla_3(x, y, jugador, 1) if !juego_ganado
	    juego_ganado = casilla_4(x, y, jugador, 1) if !juego_ganado
	    juego_ganado = casilla_5(x, y, jugador, 1) if !juego_ganado
	    juego_ganado = casilla_6(x, y, jugador, 1) if !juego_ganado
	    juego_ganado = casilla_7(x, y, jugador, 1) if !juego_ganado
	    juego_ganado = casilla_8(x, y, jugador, 1) if !juego_ganado
		return juego_ganado
	end
end