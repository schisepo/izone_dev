class OrganisationsController < ApplicationController

def index
    @organisations = Organisation.paginate(page: params[:page])
 end
 def new
    @organisation = Organisation.new

 end
 def show
 	@organisation =Organisation.find(params[:id])
 	@users=@organisation.users.paginate(page: params[:page])
 	@tasks=@organisation.tasks.paginate(page: params[:page])
 	
 end
 def create
 	@organisation = Organisation.new(organisation_params)
 	   if @organisation.save
	      flash[:info] = "Organisation Created."
	      flash[:danger]="Please create a profile for one of your founders."
 		#byebug
 		redirect_to new_organisation_user_path(@organisation)
	     # redirect_to @organisation
	    else
	      render 'new'
	    end
 end
 private

    def organisation_params
      params.require(:organisation).permit(:name, :email, :bpn)
    end

end
