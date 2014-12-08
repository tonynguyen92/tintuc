class ApiController < ApplicationController
	def getdata
		@data = Post.all
		if params[:category].present?
			@data = Post.where(:category_id => Category.where(name: params[:category]) )
		end
		if params[:tobao].present?
			@data = Post.where(:tobao_id => Tobao.where(name: params[:tobao]) )
		end
		render json: @data
	end
end
