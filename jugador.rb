class Jugador
	@jugador = nil
	def initialize(jugador)
		@jugador = jugador
	end

  def get_jugador
    return @jugador
  end

	def mover(tab, x, y)
		res = tab.colocar_ficha(x, y, @jugador)
	end
end