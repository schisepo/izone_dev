require 'test_helper'

class OrganisationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @organisation = Organisation.new(name: "Example Organisation", email: "organisation@example.com",
                     bpn: "foobpn")    
  end

  test "It should be valid" do
  	assert @organisation.valid?
  end

  test "It should have a name" do
  	@organisation.name="   "
  	assert_not @organisation.valid?
  end
  test "Organisation name should not be too long" do
  	@organisation.name= "a"*244
  	assert_not @organisation.valid?
  end

 test "email should not be too long" do
    @organisation.email = "a" * 244 + "@example.com"
    assert_not @organisation.valid?
  end

 test "email validation should accept valid addresses" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @organisation.email = valid_address
      assert @organisation.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @organisation.email = invalid_address
      assert_not @organisation.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end

  test "associated users should be destroyed" do
    @organisation.save
    @organisation.users.create!(name: "Example User", email: "user@example.com",
                     password: "foobar", password_confirmation: "foobar")
    assert_difference 'User.count', -1 do
      @organisation.destroy
    end
  end
end
