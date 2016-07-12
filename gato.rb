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
		if x < size && y < size
			if @tablero[y][x] == nil
				@tablero[y][x] = jugador
				return [true,juego_terminado?(x, y, jugador)]
			else
				puts 'Lo siento esa casilla ya esta ocupada'
				return [false,nil]
			end
		else
			puts 'Lo siento la casilla indicada no existe'
			return [false,nil]
		end
	end

	def juego_terminado?(x, y, jugador)
		if comprobar_ganador(x, y, jugador,1 ,1)
			puts "Fin del juego victoria del jugador #{jugador}"
			return true
		else
			if comprobar_empate()
				puts 'Fin del juego han empatado'
				return true
			end
		end
		return false
	end

	def contar_movimientos
		contador = 0
		@tablero.each do |fila|
			fila.each do |columna|
				if columna != nil
					contador += 1
				end
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

	def comprobar_ganador( x, y, jugador, casilla, contador)
		size = @tablero.length
		juego_ganado = false
		case casilla
			when 1
				continuar =  true
				i = 1
				while continuar
					if (x - i) >= 0 && (y - i) >= 0
						puts 1
						if @tablero[y-i][x-i] == jugador
							contador += 1
							if contador == @tablero.length
								juego_ganado = true
							end
						else
							continuar = false
						end
					else
						continuar = false
					end
					i += 1
				end
				if !juego_ganado
					comprobar_ganador(x, y, jugador, casilla += 1, contador)
				end

			when 2
				continuar =  true
				i = 1
				while continuar
					if (y - i) >= 0
						puts 2
						if @tablero[y-i][x] == jugador
							contador += 1
							if contador == @tablero.length
								juego_ganado = true
							end
						else
							continuar = false
						end
					else
						continuar = false
					end
					i += 1
				end
				if !juego_ganado
					comprobar_ganador(x, y, jugador, casilla += 1, contador)
				end

			when 3
				continuar =  true
				i = 1
				while continuar
					if (x + i) < size && (y - i) >= 0
						puts 3
						if @tablero[y-i][x+i] == jugador
							contador += 1
							if contador == @tablero.length
								juego_ganado = true
							end
						else
							continuar = false
						end
					else
						continuar = false
					end
					i += 1
				end
				if !juego_ganado
					comprobar_ganador(x, y, jugador, casilla += 1, contador)
				end

			when 4
				continuar =  true
				i = 1
				while continuar
					if (x + i) < size
						puts 4
						if @tablero[y][x+i] == jugador
							contador += 1
							if contador == @tablero.length
								juego_ganado = true
							end
						else
							continuar = false
						end
					else
						continuar = false
					end
					i += 1
				end
				if !juego_ganado
					comprobar_ganador(x, y, jugador, casilla += 1, contador)
				end

			when 5
				continuar =  true
				i = 1
				while continuar
					if (x + i) < size && (y + i) < size
						puts 5
						if @tablero[y+i][x+i] == jugador
							contador += 1
							if contador == size
								juego_ganado = true
							end
						else
							continuar = false
						end
					else
						continuar = false
					end
					i += 1
				end
				if !juego_ganado
					comprobar_ganador(x, y, jugador, casilla += 1, contador)
				end

			when 6
				continuar =  true
				i = 1
				while continuar
					if (y + i) < size
						puts 6
						if @tablero[y+i][x] == jugador
							contador += 1
							if contador == size
								juego_ganado = true
							end
						else
							continuar = false
						end
					else
						continuar = false
					end
					i += 1
				end
				if !juego_ganado
					comprobar_ganador(x, y, jugador, casilla += 1, contador)
				end

			when 7
			continuar =  true
				i = 1
				while continuar
					if (x - i) >= 0 && (y + i) < size
						puts 7
						if @tablero[y+i][x-i] == jugador
							contador += 1
							if contador == size
								juego_ganado = true
							end
						else
							continuar = false
						end
					else
						continuar = false
					end
					i += 1
				end
				if !juego_ganado
					comprobar_ganador(x, y, jugador, casilla += 1, contador)
				end

			when 8
				continuar =  true
				i = 1
				while continuar
					if (x - i) >= 0
						puts 8
						if @tablero[y][x-i] == jugador
							contador += 1
							if contador == size
								juego_ganado = true
							end
						else
							continuar = false
						end
					else
						continuar = false
					end
					i += 1
				end
		end
		return juego_ganado
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
		res = tab.colocar_ficha(x, y, @jugador)
		if !res[0]
			mover(tab)
		end
		return res[1]
	end
end
tab = Tablero.new(3)
#puts tab.recorrer_tablero
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