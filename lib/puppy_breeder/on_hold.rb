#Refer to this class as PuppyBreeder::OnHold
module PuppyBreeder
	class OnHold

		attr_accessor :on_hold_list

		def initialize #this is status attribute in purchase request table
			@on_hold_list = []
		end


	end

end