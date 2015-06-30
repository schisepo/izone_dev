class AddBioToUser < ActiveRecord::Migration
  def change
    add_column :users, :bio, :text
    add_column :users, :jobtitle, :string
  end
end
