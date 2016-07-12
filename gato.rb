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
				@casillas_disponibles -= 1
				if @casillas_disponibles == 0
					@empate = true
				end

				return [true,juego_terminado?(x, y, jugador)]
			else
				puts 'Lo siento esa casilla ya esta ocupada'
				return false
			end
		else
			puts 'Lo siento la casilla indicada no existe'
			return false
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

	def comprobar_empate
		movimientos = @tablero.reject { |casilla|
			casilla.empty?
		}

		if movimientos = (@tablero.length ** 2)
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
					if (x - i) > 0 && (y - i) > 0
						if @tablero[x-i][y-i] == jugador
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
					if (y - i) > 0
						if @tablero[x][y-i] == jugador
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
					if (x + i) < size && (y + i) < size
						if @tablero[x+i][y+i] == jugador
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
					if (x + i) > 0
						if @tablero[x+i][y] == jugador
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
					if (x + i) < @tablero.length && (y + i) < @tablero.length
						if @tablero[x+i][y+i] == jugador
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

			when 6
				continuar =  true
				i = 1
				while continuar
					if (y + i) < @tablero.length
						if @tablero[x][y+i] == jugador
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

			when 7
			continuar =  true
				i = 1
				while continuar
					if (x - i) > 0 && (y + i) < @tablero.length
						if @tablero[x-i][y+i] == jugador
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

			when 8
				continuar =  true
				i = 1
				while continuar
					if (x - i) > 0
						if @tablero[x-i][y] == jugador
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