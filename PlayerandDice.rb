class Player  #Player class
	attr_accessor:name, :score, :banked_score
	def initialize name
		@name = name
		@score = 0
		@bankscore = 0
	end
	def addscore (points)
		@score += points
	end
	def bankscore
		@bankscore += @score
	end
end
class Die #Dice class
	def roll
		@scoreShowing = 1 + rand(6)
	end
	def facing
		@scoreShowing
	end
end