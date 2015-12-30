class DeleteOrders < ActiveRecord::Migration
  def change
  	Order.all.delete_all
  end
end
