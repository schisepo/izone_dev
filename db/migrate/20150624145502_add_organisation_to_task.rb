class AddOrganisationToTask < ActiveRecord::Migration
  def change
    add_reference :tasks, :organisation, index: true, foreign_key: true
  end
end
