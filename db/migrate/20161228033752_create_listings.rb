class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string :title
      t.text :description
      t.integer :price
      t.string :address
      t.belongs_to :user, index: true, foreign_key: true
      t.integer :max_guests

      t.timestamps null: false
    end
  end
end
