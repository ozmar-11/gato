require_relative 'spec_helper'

describe Gato do
	before :each do
		@tablero = Tablero.new(3)
		@jugadorX = Jugador.new('X')
		@jugadorO = Jugador.new('O')
	end
	describe '3 vertical' do
		it 'jugador X debe ganar en vertical' do
			@jugadorX.mover(@tablero, 0, 0)
			@jugadorO.mover(@tablero, 1, 1)
			@jugadorX.mover(@tablero, 0, 1)
			@jugadorO.mover(@tablero, 2, 2)
			@jugadorX.mover(@tablero, 0, 2)
			expect(@tablero.obtener_ganador).to be == @jugadorX.get_jugador
		end

		it 'jugador O debe ganar en vertical' do
			@jugadorX.mover(@tablero, 2, 0)
			@jugadorO.mover(@tablero, 0, 0)
			@jugadorX.mover(@tablero, 2, 1)
			@jugadorO.mover(@tablero, 0, 1)
			@jugadorX.mover(@tablero, 1, 0)
			@jugadorO.mover(@tablero, 0, 2)
			expect(@tablero.obtener_ganador).to be == @jugadorO.get_jugador
		end
	end

	describe '3 en diagonal' do
		it 'jugador X debe ganar el diagonal' do
			@jugadorX.mover(@tablero, 0, 0)
			@jugadorO.mover(@tablero, 0, 1)
			@jugadorX.mover(@tablero, 1, 1)
			@jugadorO.mover(@tablero, 0, 2)
			@jugadorX.mover(@tablero, 2, 2)
			expect(@tablero.obtener_ganador).to be == @jugadorX.get_jugador
		end

		it 'jugador O debe ganar en diagonal' do
			@jugadorX.mover(@tablero, 0, 0)
			@jugadorO.mover(@tablero, 0, 2)
			@jugadorX.mover(@tablero, 1, 2)
			@jugadorO.mover(@tablero, 1, 1)
			@jugadorX.mover(@tablero, 1, 0)
			@jugadorO.mover(@tablero, 2, 0)
			expect(@tablero.obtener_ganador).to be == @jugadorO.get_jugador
		end
	end

	describe '3 en horizontal' do
		it 'jugador X debe ganar en horizontal' do
			@jugadorX.mover(@tablero, 0, 1)
			@jugadorO.mover(@tablero, 1, 0)
			@jugadorX.mover(@tablero, 1, 1)
			@jugadorO.mover(@tablero, 0, 0)
			@jugadorX.mover(@tablero, 2, 1)
			expect(@tablero.obtener_ganador).to be == @jugadorX.get_jugador
		end

		it 'jugador O debe ganar en horizontal' do
			@jugadorX.mover(@tablero, 0, 0)
			@jugadorO.mover(@tablero, 0, 2)
			@jugadorX.mover(@tablero, 1, 0)
			@jugadorO.mover(@tablero, 1, 2)
			@jugadorX.mover(@tablero, 0, 1)
			@jugadorO.mover(@tablero, 2, 2)
			expect(@tablero.obtener_ganador).to be == @jugadorO.get_jugador
		end
	end

	describe 'Empate' do
		it 'deben empatar' do
			@jugadorX.mover(@tablero, 0, 0)
			@jugadorO.mover(@tablero, 1, 0)
			@jugadorX.mover(@tablero, 0, 1)
			@jugadorO.mover(@tablero, 1, 1)
			@jugadorX.mover(@tablero, 2, 1)
			@jugadorO.mover(@tablero, 2, 0)
			@jugadorX.mover(@tablero, 0, 2)
			@jugadorO.mover(@tablero, 1, 2)
			@jugadorX.mover(@tablero, 2, 2)
			expect(@tablero.comprobar_empate).to be == true
		end
	end
end