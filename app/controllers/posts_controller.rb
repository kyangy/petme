class PostsController < ApplicationController

	def index
		@posts = Post.where(type: params[:type])
	end

	def show
		@post = Post.find(params[:id])
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)
		if @post.save
			redirect_to list_path(params[:type])
		else
			render :new
		end
	end

	private

	def post_params
		params.require(:post).permit(:type, :breed, :age, :gender, :price, :image)
	end

end
