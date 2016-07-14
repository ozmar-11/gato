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