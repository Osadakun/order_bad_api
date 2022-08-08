class Api::V1::OrdersController < ApplicationController
  before_action :authenticate_api_v1_user!, only: [:create, :update, :destroy]
	def index
			posts = Post.all.order(created_at: :desc)
			posts_array = posts.map do |post|
				{
					id: post.id,
					content: post.content,
					user: User.find_by(id: post.user_id)
				}
			end
			render json: posts_array
	end

	def show
    order = Order.find_by(team_id: params[:team_id])
    order_list = {
			id: order.id,
			enemy_name: order.enemy_name,
			first_double_1: order.first_double_1,
			first_double_2: order.first_double_2,
			first_single: order.first_single,
			second_double_1: order.second_double_1,
			second_double_2: order.second_double_2,
			team_id: order.team_id
		}
		render json: order_list
	end

	def create
		post = Post.new(post_params)
		if post.save
			render json: post
		else
			render json: post.errors, status: 422
		end
	end

	def update
		post = Post.find(params[:id])
		if current_api_v1_user.id == post.user_id
			if post.update(post_params)
				render json: post
			else
				render json: post.errors, status: 422
			end
		else
			render json: {message: 'can not update data'}, status: 422
		end
	end

	def destroy
		post = Post.find(params[:id])
		if current_api_v1_user.id == post.user_id
			post.destroy
			render json: post
		else
			render json: {message: 'can not delete data'}, status: 422
		end
	end

	private
	def post_params
		params.require(:post).permit(:content).merge(user_id: current_api_v1_user.id)
	end
end
