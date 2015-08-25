module OrganisationsHelper
	  
  #Current User belongs to current organisation
  def belongs_to_organisation?
  	if current_user.nil?
  		return false
  	else
		#byebug()
  		!((@organisation.users.find_by id: current_user.id).nil?)
  	end
  end

end
