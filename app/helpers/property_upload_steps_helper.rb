module PropertyUploadStepsHelper

	def active_step(step)
		if wizard_path == wizard_path(step)
		  	return "sidebar-active"
	 	end 
	end

end
