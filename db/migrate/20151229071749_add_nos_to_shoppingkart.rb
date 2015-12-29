class AddNosToShoppingkart < ActiveRecord::Migration
  def change
    add_column :shoppingkarts, :nos, :integer
  end
end
