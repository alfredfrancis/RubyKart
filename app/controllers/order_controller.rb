class OrderController < ApplicationController
	def create
		if !session[:order_id].nil?
	  	@order=Order.find(session[:order_id])
	 	else
	    @order= Order.new
	    @order.user = current_user
			@order.status = false
			@order.total = params[:total]
			@order.payment_id = nil
			status = @order.save
			session[:order_id] = @order.id
			items = current_user.shoppingkarts.all
						binding.pry
			items.each do |item|
				order_detail = OrderDetail.new
				order_detail.order = @order
				order_detail.product = item.product
				order_detail.nos	=	item.nos
				order_detail.save
			end
	  end
		render 'payment/new'
	end

end
