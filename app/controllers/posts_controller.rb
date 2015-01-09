class PostsController < ApplicationController

	def index
		@posts = Post.where(type: params[:type], gender: params[:gender], age: params[:age]).all
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
			redirect_to list_path({type: @post.type, gender: @post.gender, age: @post.age})
		else
			render :new
		end
	end

	private

	def post_params
		params.require(:post).permit(:type, :breed, :age, :gender, :price, :image)
	end

end
