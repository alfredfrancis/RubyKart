class CartController < ApplicationController

	def index
		@cart_items = current_user.shoppingkarts 
		#Shoppingkart.find(current_user)
	end
	def create
		shopping_cart = Shoppingkart.new
		shopping_cart.user = current_user
		shopping_cart.product = Product.find(params[:product_id])
		shopping_cart.nos	= 1
		if shopping_cart.save
			render plain: "OK"
		else
			render plain: "error"
		end
	end

	def destroy
		@cart_item = Shoppingkart.find(params[:id])
		@cart_item.destroy
		redirect_to cart_index_path
	end

end
