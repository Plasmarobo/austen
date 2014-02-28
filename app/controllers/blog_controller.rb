class BlogController < ApplicationController


	include ApplicationHelper

	def index
		@post = Blogpost.order(:created_at).last
	end

	def login
	end

	def logout
	end
end
