class CreateOrganisations < ActiveRecord::Migration
  def change
    create_table :organisations do |t|
      t.string :name
      t.string :email
      t.string :bpn

      t.timestamps null: false
    end
  end
end
