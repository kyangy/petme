module PostsHelper

	def google_maps(address)
		address = address.gsub " ","+"
		map_api = ENV['GOOGLE_MAPS']
		@map = "https://www.google.com/maps/embed/v1/place?key=#{map_api}&q=#{address}"
	end

	def post_owner
		current_user == @post.user
	end
end
