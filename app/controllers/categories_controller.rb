class CategoriesController < ApplicationController

def create
	@category = @restaurant.categories.build(category_params)
end

def show
	@category = Category.find params[:id]
end

def index
	@categories = Category.all
end
private

	def category_params
		params.require(:category).permit(:name)
	end
end
