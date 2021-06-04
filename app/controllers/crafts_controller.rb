class CraftsController < ApplicationController
  def index
    @craft = Craft.all
    render json: @craft
  end

  def create
    @craft = Craft.create(user_id: params[:user_id], name: params[:name], description: params[:description], supplylist: params[:supplylist], image: params[:image])
    @user = User.find(params[:user_id])
    render json: @user, include: :crafts
  end

end
