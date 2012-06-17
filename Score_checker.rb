require_relative 'Value_Check.rb'
class ScoreChecker
	include ValueChecker
	attr_accessor 	:current_roll_eval, :threepair, :straight, 
				:threeones, :threetwos, :threethrees, 
				:threefours, :threefives, :threesixes,
				:oneones, :twoones, :onefives, :twofives,
				:scoredpoints
	def initialize (current_roll)
		@current_roll_eval = current_roll
		@threepair = :true
		@straight = :true
		@threeones = :false
		@threetwos = :false
		@threethrees = :false
		@threefours = :false
		@threefives = :false
		@threesixes = :false
		@oneones = :false
		@twoones = :false
		@onefives = :false
		@twofives = :false
		@scoredpoints = :false
	end
	
	
end