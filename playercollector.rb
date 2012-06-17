require_relative 'PlayerandDice.rb'
class Playercollector
	attr_accessor :players, :name, :people, :player
	def get_players
		@people = []
		print 'How many people are going to play?: ' 
		@players = gets.chomp.to_i
			1.upto(@players.to_i) do |total_players| #Creates and names each each player
				print 'What is the name of Player ' + total_players.to_s + '?: ' #each players name
				@name = gets.chomp.downcase.capitalize #each players name input
				@player = Player.new name 
				@people[total_players-1] = @player
			end
			@people.each do |peeps| #shows each players name and current score
				print 'Player: ' + peeps.name + '	Score: ' + peeps.score.to_s
				puts ''
			end
		end
	end
