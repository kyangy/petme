class PostsController < ApplicationController

	def index
		@posts = Post.where(type: params[:type], gender: params[:gender], age: params[:age]).all
	end

	def new
		@users = User.all
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)
		@post.user = current_user
		if @post.save
			redirect_to list_path({type: @post.type, gender: @post.gender, age: @post.age})
		else
			render :new
		end
	end

	def show
		@post = Post.find(params[:id])
	end

	private

	def post_params
		params.require(:post).permit(:type, :breed, :age, :gender, :price, :about, :image, :user)
	end

end
