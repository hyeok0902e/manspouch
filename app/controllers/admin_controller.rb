class AdminController < ApplicationController

	def index
		@users = User.all
		@products = Product.all
		@contents = Content.all
		@creatures = Creature.all

	end

	def userinfo
		@users = User.all
	end

	def productinfo
		@products = Product.all
	end

	def contentinfo
		@contents = Content.all
	end

	def creatureinfo
		@creatures = Creature.all
	end

end
