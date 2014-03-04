class BlogController < ApplicationController


	include ApplicationHelper

	def index
		@recent_posts = Blogpost.all.order('created_at DESC').take(4);
	end

end
