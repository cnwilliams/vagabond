class TipsController < ApplicationController

  before_action :set_tip, only: [:show, :edit, :update]

  def index
    @tip = Tip.all
  end

  def new
    @tip = Tip.new
  end

  def show
    @author = User.find(@tip.user_id)
  end

  def create
    @tip = current_user.tips.create(tip_params)
    @city = session[:city]
    @city.tips << @tip
    redirect_to @tip
  end

  private

  def tip_params
  #  params[:user_id] = current_user.id
    params.require(:tip).permit(:title, :body) #, :user_id)
  end

  def set_tip
    tip_id = params[:tip_id]
    @tip = Tip.find_by_id(tip_id)
  end

  def tip_form_redirect
    redirect_to new_tip_path
  end

end
