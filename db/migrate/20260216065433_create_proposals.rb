class CreateProposals < ActiveRecord::Migration[8.1]
  def change
    create_table :proposals do |t|
      t.string :title, null: false
      t.text :description
      t.references :organization, null: false, foreign_key: true

      t.timestamps
    end

    add_index :proposals, :title
  end
end
