class OrganisationsController < ApplicationController
  before_action :logged_in_user, only: [:destroy]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: :destroy

def index
    if params[:q]
      @organisations = Organisation.search(params[:q]).order("created_at DESC").paginate(page: params[:page])
    else
      @organisations = Organisation.paginate(page: params[:page])
    end
     #@organisations = Organisation.paginate.search(params[:search])
 end
 def new
    @organisation = Organisation.new

 end

  def edit
    @organisation = Organisation.find(params[:id])
  end

  def update
    @organisation = Organisation.find(params[:id])
    if @organisation.update_attributes(organisation_params)
      # Handle a succes sful update.
      flash[:success] = "Profile updated"
      redirect_to @organisation

    else
      render 'edit'
    end
  end


 def show
#byebug()
 	@organisation =Organisation.find(params[:id])  
 	@users=@organisation.users.paginate(page: params[:page])
 	@tasks=@organisation.tasks.paginate(page: params[:page])
  @valueprop=@organisation.value_prop
  #byebug()
 	
 end
 def create
 	@organisation = Organisation.new(organisation_params)
 	   if @organisation.save
	      flash[:info] = "Organisation Created."
	      flash[:danger]="Please create a profile for one of your founders."
 		redirect_to new_organisation_user_path(@organisation)
	     # redirect_to @organisation
	    else
	      render 'new'
	    end
 end

# def destroy
#     Organisation.find(params[:id]).destroy
#     flash[:success] = "Organisation deleted"
#     redirect_to organisations_url
#   end

 def search
	@organisations = Organisation.paginate.search(params[:search])
 end

# Confirms a logged-in user.
  def logged_in_user
     unless logged_in?
       store_location
       flash[:danger] = "Please log in."
       redirect_to login_url
     end
  end
  # Confirms the correct user.
  def correct_user
      @user = User.find(params[:id])
      unless current_user?(@user)
        flash[:danger]="You can only view your own profile"
        redirect_to(root_url)
      end
      #redirect_to(root_url) unless current_user?(@user)
  end

       # Confirms an admin user.
  def admin_user
      flash[:warning] ="Function can only be performed by admin user"
      redirect_to(root_url) unless current_user.admin?
  end
 
 private

    def organisation_params
      params.require(:organisation).permit(:name, :email, :bpn, :logo)
    end

end
