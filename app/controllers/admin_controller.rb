class AdminController < ApplicationController

	def index
		@users = User.all
		@products = Product.all
		@contents = Content.all
		@creatures = Creature.all

	end
end
