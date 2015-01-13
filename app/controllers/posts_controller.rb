class PostsController < ApplicationController

	def index
		@posts = Post.where(type: params[:type], gender: params[:gender], age: params[:age]).all
	end

	def new
		@users = User.all
		@post = Post.new
	end

	def create
		
		@post = current_user.posts.build(post_params)
		
		if @post.save
			redirect_to list_path({type: @post.type, gender: @post.gender, age: @post.age})
		else
			render "new"
		end
	end

	def show
		@post = Post.find(params[:id])
		@comment = Comment.new
	end

	private

	def post_params
		params.require(:post).permit(:type, :breed, :age, :gender, :price, :description, :image, :user)
	end

end
