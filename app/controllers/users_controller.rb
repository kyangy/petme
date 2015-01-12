class UsersController < ApplicationController

	def new
		@user = User.new
	end

	def create
		@posts = Post.all
		@user = User.new(user_params)
		if @user.save
			session[:user_id] = @user.id.to_s
			redirect_to root_path
		else
			render :new
		end
	end

	def edit
		@user = current_user
	end

	def update
		@user = current_user
		if @user.update_attributes(user_params)
			redirect_to root_path
		else
			render :edit
		end
	end

	private

	def user_params
		params.require(:user).permit(:name, :email, :password, :password_confirmation)
	end

end
