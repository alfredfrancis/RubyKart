class ProductsController < ApplicationController
	def index
		@categories = Category.all
		if(params[:category_id])
			@products = Product.where(category: params[:category_id])
		else	
			@products = Product.all
		end
	end

	def show
		@product = Product.find(params[:id])	
	end
end
