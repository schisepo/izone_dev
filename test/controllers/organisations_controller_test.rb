require 'test_helper'

class OrganisationsControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
  	@organisation = organisations(:one)
  end

  test "should get new" do
  	get :new
  	assert_response :success
  end
  
end
