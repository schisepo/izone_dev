class ValuePropsController < ApplicationController
  def new 
  	@valueprop = ValueProp.new
  	@valueprop.organisation_id = params[:organisation_id]
  end

  def create
  	    @valueprop = ValueProp.new(valueprop_params)
	    if @valueprop.save	       	      
	      redirect_to Organisation.find(@valueprop.organisation_id)
	    else
	      render 'new'
	    end
  end

  def edit
  end
 
  def update
  end

  def valueprop_params
      params.require(:value_prop).permit(:who, :why,:organisation_id,:what)
  end
end
