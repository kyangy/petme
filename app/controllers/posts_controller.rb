class PostsController < ApplicationController
include PostsHelper

	def index
		@posts = Post.where(type: params[:type], gender: params[:gender], age: params[:age]).all
	end

	def new
		@post = Post.new
	end

	def create
		@post = current_user.posts.new(post_params)
		if @post.save
			redirect_to list_path({type: @post.type, gender: @post.gender, age: @post.age})
		else
			render "new"
		end
	end

	def show
		@post = Post.find(params[:id])
		@comment = Comment.new
		address = @post.address
		google_maps(address)
	end

	def destroy
		@post = Post.find(params[:id])
		if @post.destroy
			redirect_to list_path({type: @post.type, gender: @post.gender, age: @post.age})
		else
			redirect_to post_path(@post)
		end
	end

	private

	def post_params
		params.require(:post).permit(:type, :breed, :age, :gender, :price, :description, :image, :user, :coordinates, :address, :geocode)
	end

end
