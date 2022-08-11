class Api::V1::OrdersController < ApplicationController
  before_action :authenticate_api_v1_user!, only: []
	def index
	end

	def show
    order = Order.find_by(team_id: params[:team_id])
    order_list = {
			id: order.id,
      name: order.name,
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

  def have_team_all
    teams = Team.all.where(user_id: params[:team_id]).order(:name)
    team_array = teams.map do |team|
      {
        id: team.id,
        name: team.name,
      }
    end
    render json: team_array
  end

  def create
    members = Team.find(params[:id])
    member_list = {
      user_name: members.user_name,
      name: members.name,
      member1: [
        members.member1,
        members.member2,
        members.member3,
        members.member4,
        members.member5,
        members.member6,
        members.member7,
      ],
      # member1: members.member1,
      # member2: members.member2,
      # member3: members.member3,
      # member4: members.member4,
      # member5: members.member5,
      # member6: members.member6,
      # member7: members.member7,
    }
    render json: member_list
  end

	private
	def post_params
		params.require(:order).permit(:id, :name, :enemy_name, :first_double_1, :first_double_2, :first_single, :second_double_1, :second_double_2, :team_id)
	end
end
