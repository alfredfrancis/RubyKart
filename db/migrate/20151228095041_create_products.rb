class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :image
      t.text :desc
      t.decimal :price
      t.references :category

      t.timestamps null: false
    end
  end
end
