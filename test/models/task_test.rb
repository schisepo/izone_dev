require 'test_helper'

class TaskTest < ActiveSupport::TestCase
def setup
    @user = users(:michael)
    @organisation= organisations(:one)
    # This code is not idiomatically correct.    
    @task = @user.tasks.build(content: "Lorem ipsum", status: "false",organisation_id: @organisation.id)
  end

  test "should be valid" do
    assert @task.valid?
  end

  test "user id should be present" do
    @task.user_id = " "
    assert_not @task.valid?
  end

    test "content should be present" do
    @task.content = "   "
    assert_not @task.valid?
  end

end
