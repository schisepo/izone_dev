class AddOrganisationRefToUser < ActiveRecord::Migration
  def change
    add_reference :users, :organisation, index: true, foreign_key: true
  end
end
