module PropertyHelper

	def color_by_property(type)
		if type == "House" 
			return "#00CED1;" 
		 elsif type == "Townhome"
			 return "#8080E6;" 
		 else 
			 return "#D2B48C;" 
		 end 
	 end 

	 def price_range(price_one, price_two)
		if price_two.present?
			return "$ #{price_one} - #{price_two}"
		else
			return "$ #{price_one}"
		end
	end

end