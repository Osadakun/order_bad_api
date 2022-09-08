class Api::V1::OrdersController < ApplicationController
  before_action :authenticate_api_v1_user!, only: []

	def show_order
    order = Order.where(event_name: params[:event_name], users_id: params[:users_id]).first
    order_list = {
			id: order.id,
      name: order.name,
			enemy_name: order.enemy_name,
			first_double_1: order.first_double_1,
			first_double_2: order.first_double_2,
			first_single: order.first_single,
			second_double_1: order.second_double_1,
			second_double_2: order.second_double_2,
			teams_id: order.teams_id,
      event_name: order.event_name,
		}
		render json: order_list
	end

  def have_team_all
    teams = Team.all.where(users_id: params[:team_id]).order(:event_name)
    team_array = teams.map do |team|
      {
        id: team.id,
        event_name: team.event_name,
      }
    end
    render json: team_array
  end

  def create
    members = Team.find(params[:id])
    member_list = {
      event_name: members.event_name,
      members: [
        members.member1,
        members.member2,
        members.member3,
        members.member4,
        members.member5,
        members.member6,
        members.member7,
      ],
    }
    render json: member_list
  end

  def submit
    select_player
    set_member
    order = Order.new(
              name: params[:name],
              enemy_name: params[:enemy_name],
              first_double_1: @players[0],
              first_double_2: @players[1],
              first_single: @players[2],
              second_double_1: @players[3],
              second_double_2: @players[4],
              event_name: params[:event_name],
              teams_id: params[:teams_id],
              users_id: params[:users_id]
            )
      if order.save
          render json: order
      else
          render json: order.errors, status: 422
      end
  end

	private
    def post_params
      params.require(:order).permit(:id, :name, :enemy_name, :first_double_1, :first_double_2, :first_single, :second_double_1, :second_double_2, :team_id)
    end

    # ダブルスの場合2つカラムが必要になるわけだが，第1ダブルス_1・第1ダブルス_2をここで判断している
    # DBに保存するためのフォーマットはset_memberで指定される
    def select_player
      @selected_team = Team.find(params[:teams_id])
      @first_double_1 = ''
      @first_double_2 = ''
      @first_single = ''
      @second_double_1 = ''
      @second_double_2 = ''
      for i in 1..7 do
        player = params[:"member#{i}_kind"]
        case player
        when 'double_1' then
          if @first_double_1 == ''
            @first_double_1 = "member#{i}"
          else
            @first_double_2 = "member#{i}"
          end
        when 'single' then
          @first_single = "member#{i}"
        when 'double_2' then
          if @second_double_1 == ''
            @second_double_1 = "member#{i}"
          else
            @second_double_2 = "member#{i}"
          end
        else
          # 控えの選手の動きは特になし
        end
      end

      # order_kindの中身を順に見ていく．書く種目に該当する選手がDBのどこに保存されているかで判断する
      # @playersは配列で，頭から順に第1ダブル→シングル→第2ダブルになっている
      # この中身をshow_orderで見てる
      def set_member
        order_kind = [@first_double_1, @first_double_2, @first_single, @second_double_1, @second_double_2]
        @players = []
        order_kind.each do |value|
          key = ''
          case value
          when 'member1' then
            key = @selected_team.member1
            @players << key
          when 'member2' then
            key = @selected_team.member2
            @players << key
          when 'member3' then
            key = @selected_team.member3
            @players << key
          when 'member4' then
            key = @selected_team.member4
            @players << key
          when 'member5' then
            key = @selected_team.member5
            @players << key
          when 'member6' then
            key = @selected_team.member6
            @players << key
          else
            key = @selected_team.member7
            @players << key
          end
        end
      end
    end
end
