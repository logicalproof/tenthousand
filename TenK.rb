require_relative 'Score_checker.rb'
require_relative 'playercollector.rb'
host = Playercollector.new
host.get_players
dice = [Die.new, Die.new, Die.new, Die.new, Die.new, Die.new]
winner = :false
x = ScoreChecker.new (0)
while  winner == :false 
	1.upto(host.players.to_i) do |number|
		print '' + host.people[number-1].name.to_s + ', press ENTER to roll the dice.' #waits till you press enter
		wait = gets.chomp
		cup = (6)
		1.upto(0+cup) do |die_number| #rolls each of the dice and displays the values
			puts 'Die ' + die_number.to_s + ':  ' + dice[die_number-1].roll.to_s 
		end
		out_of_cup =[] 
		points_area = []
		this_roll = [] #location of saved Values
		current_roll_eval = []
		while cup != 0
			if x.scoredpoints == :rollagain
				x.scoredpoints = :false
				points_area = []
				1.upto(6) do |die_location| #this code Compares what you saved with the main DICE array and forces the Dice array to reroll what is left
					if (die_location == points_area[5] or die_location == points_area[4] or die_location == points_area[3] or die_location == points_area[2] or die_location == points_area[1] or die_location == points_area[0])
					else
						puts 'Die ' + die_location.to_s + ': ' + dice[die_location.to_i-1].roll.to_s
					end
				end 
				x.scoredpoints = :false
			end
			print 'Which Dice would you like to keep? [1,2,3,4,5,6]' 
			dice_kept = gets.chomp 
			dice_kept.squeeze!        
			dice_kept.scan(/./) do |die_numbers| #Places each of the saved numbers into the points_area array 
				out_of_cup << die_numbers.to_i
				points_area << die_numbers.to_i
			end
			points_area.sort #Rerolls the dice in order
			1.upto(6) do |die_location| #Compares the dice array to the re_rolls array and pushes the Values into this_roll
				if (die_location == out_of_cup[5] or die_location == out_of_cup[4] or die_location == out_of_cup[3] or die_location == out_of_cup[2] or die_location == out_of_cup[1] or die_location == out_of_cup[0]) 
					this_roll << dice[die_location-1].facing
				else
				end
			end
			points_area.uniq! #prevents you from entering the same number multiple times
			if this_roll.length != 0
			  puts 'You kept ' + this_roll.to_s #THis is where to INSERT THE POINT SCANNER
			end
			this_roll.sort!
			x = ScoreChecker.new this_roll
			x.threepaircheck
			x.straightcheck
			x.three_of_a_kind_check
			x.one_check
			x.five_check
	    this_roll = []
			if x.threepair == :true
				puts 'Three Pair!'
				host.people[number-1].addscore(750)
				x.scoredpoints = :true
			end
			if x.straight == :true
				puts 'Straight!'
				host.people[number-1].addscore(750)
				x.scoredpoints = :true
			end
			if x.threeones == :true
				puts 'Three Ones!'
				host.people[number-1].addscore(1000)
				x.scoredpoints = :true
			end
			if x.threetwos == :true
				puts 'Three Twos!'
				host.people[number-1].addscore(200)
				x.scoredpoints = :true
			end
			if x.threethrees == :true
				puts 'Three Threes!'
				host.people[number-1].addscore(300)
				x.scoredpoints = :true
			end
			if x.threefours == :true
				puts 'Three Fours!'
				host.people[number-1].addscore(400)
				x.scoredpoints = :true
			end
			if x.threefives == :true
				puts 'Three Fives!'
				host.people[number-1].addscore(500)
				x.scoredpoints = :true
			end
			if x.threesixes == :true
				puts 'Three Sixes!'
				host.people[number-1].addscore(600)
				x.scoredpoints = :true
			end
			if x.oneones == :true
				puts 'One One!'
				host.people[number-1].addscore(100)
				x.scoredpoints = :true
			end
			if x.twoones == :true
				puts 'Two Ones!'
				host.people[number-1].addscore(200)
				x.scoredpoints = :true
			end
			if x.onefives == :true
				puts 'One Five!'
				host.people[number-1].addscore(50)
				x.scoredpoints = :true
			end
			if x.twofives == :true
				puts 'Two Fives!'
				host.people[number-1].addscore(100)
				x.scoredpoints = :true
			end	
			host.people[number-1].score =  host.people[number-1].score 
			puts ('Score: ' + host.people[number-1].score.to_s)
			this_roll = []
			if x.scoredpoints == :true
				print 'Would you like to roll again? [Y or N]: '
				roll_again = gets.chomp
				if roll_again == 'y'
					1.upto(6) do |die_location| #this code Compares what you saved with the main DICE array and forces the Dice array to reroll what is left
						if (die_location == points_area[5] or die_location == points_area[4] or die_location == points_area[3] or die_location == points_area[2] or die_location == points_area[1] or die_location == points_area[0])
						else
							puts 'Die ' + die_location.to_s + ': ' + dice[die_location.to_i-1].roll.to_s
						end
					end 
					cup = (6 - points_area.length)
				else
					cup = 0
					if host.people[number-1].banked_score == 0
						if host.people[number-1].score <= 700
							puts 'Not enough points to get on the board'
							host.people[number-1].score = 0
							puts 'Banked Points: ' + host.people[number-1].banked_score.to_s
						else
							puts 'Banked Points: ' + host.people[number-1].bankscore.to_s
							host.people[number-1].score = 0
						end
					else
						puts 'Banked Points: ' + host.people[number-1].bankscore.to_s
						host.people[number-1].score = 0
					end
				end
			else
				cup = 0
				puts 'YOU BUSTED!!!'
				host.people[number-1].score = 0
				x.scoredpoints = :false
				puts 'Banked Points: ' + host.people[number-1].banked_score.to_s
			end
			if cup == 0
				if x.scoredpoints == :true
					cup = 6
					if roll_again == 'y'
						x.scoredpoints = :rollagain
					else
						x.scoredpoints = :false
						cup = 0
					end
				end
			end
  		total_roll = [] #location of saved sets
  		out_of_cup = [] 
  	end
    if host.people[number-1].bankscore.to_i >= 10000
    	winner = :true
    	puts host.people[number-1].name + ' WINS!!'
    end
  end
end


