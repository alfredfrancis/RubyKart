class ProductsController < ApplicationController
	def index
		@categories = Category.all
		#binding.pry
		if(params[:category_id])
			@products = Product.where(category: params[:category_id])
		else	
			@products = Product.all
		end
	end
end
