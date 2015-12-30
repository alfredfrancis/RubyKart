class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.references :order, index: true, foreign_key: true
      t.decimal :amount
      t.boolean :status

      t.timestamps null: false
    end
  end
end
