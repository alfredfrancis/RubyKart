class OrderController < ApplicationController
	def create
		@order = Order.new
		@order.user = current_user
		@order.status = false
		@order.total = params[:total]
		@order.payment_id = nil
		@order.save

		items = current_user.shoppingkarts.all
		items.each do |item|
			order_detail = OrderDetail.new
			order_detail.order = @order
			order_detail.product = item.product
			order_detail.nos	=	item.nos
			order_detail.save
		end
		current_user.shoppingkarts.delete_all
		render 'payment/new'
	end

end
