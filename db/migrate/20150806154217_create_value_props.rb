class CreateValueProps < ActiveRecord::Migration
  def change
    create_table :value_props do |t|
      t.text :who
      t.text :what
      t.text :why
      t.references :organisation, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
