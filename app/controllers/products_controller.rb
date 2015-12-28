class ProductsController < ApplicationController
	def index
		@categories = Category.all
	end

	def show
		@products = Product.where(category: category).take
	end
	
end
