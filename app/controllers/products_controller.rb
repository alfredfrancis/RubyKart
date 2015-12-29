class ProductsController < ApplicationController
	def index
		@categories = Category.all
		if(params[:category_id])
			@products = Product.where(category: params[:category_id])
		else	
			@products = Product.last(7)
		end
	end

	def show
		@categories = Category.all
		@product = Product.find(params[:id])
		render 'index'	
	end
end
