module ValueChecker
	def straightcheck
		1.upto(6) do |yy|
			if @current_roll_eval.to_s.include?(yy.to_s) == true
			else 
				@straight = :false
			end
		end
	end

	def threepaircheck
		die_locations = [1, 2, 3, 4, 5, 6]
		if @current_roll_eval.length == 6
			die_locations.each_with_index do |y, x|
				if x.even? == true and y.odd? == true
					if @current_roll_eval[x] == @current_roll_eval[y]
					else
						@threepair = :false
					end
				else
					@threepair = :false
				end
			end
	  else
	    @threepair = :false
		end
	end
	
	def three_of_a_kind_check
		if @current_roll_eval.count(1) >= 3
			@threeones = :true
		end
		if @current_roll_eval.count(2) >= 3
			@threetwos = :true
		end						
		if @current_roll_eval.count(3) >= 3
			@threethrees = :true
		end						
		if @current_roll_eval.count(4) >= 3
			@threefours = :true
		end
		if @current_roll_eval.count(5) >= 3
			@threefives = :true
		end
		if @current_roll_eval.count(6) >= 3
			@threesixes = :true
		end
	end

	def one_check
		if @straight == :false
		  if @threepair == :false
	    	if @current_roll_eval.count(1) >= 1 and @current_roll_eval.count(1) <=2
			    if @current_roll_eval.count(1) == 1
				    @oneones = :true
		    	else
			    	@twoones = :true
		    	end
	    	end
    	end
    end
  end

	def five_check
		if @straight == :false
		  if @threepair == :false
	    	if @current_roll_eval.count(5) >= 1 and @current_roll_eval.count(5) <=2
		    	if @current_roll_eval.count(5) == 1
			    	@onefives = :true
			    else
			    	@twofives = :true
			    end
		    end
	    end
    end
  end
  
end

