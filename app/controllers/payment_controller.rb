class PaymentController < ApplicationController
	def new
		@order = Order.find(id: session[:order_id])
	end

	def create
		#binding.pry
		order = Order.where(id: session[:order_id])
		payment = Payment.new
		payment.order = order
		payment.amount = order.total
		payment.status = true
		if payment.save
			current_user.shoppingkarts.delete_all
		end

		render 'show'
	end

	def show
	end
end
