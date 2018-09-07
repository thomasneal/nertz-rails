class GamesController < ApplicationController
  #before_action :authenticate_admin, :only => [:new, :edit, :create, :destroy]
  before_action :authenticate_user!, :only => [:new, :edit, :create, :destroy]
  before_action :authenticate_current_user, :only => [:edit, :destroy]

  def index
    @games = Game.all
  end

  def new
     @game = Game.new
     @users = User.all
  end

  def show
    @game = Game.find(params[:id])
  end

  def create
     @game = Game.new(game_params)
     @game.status = "New"
     if @game.save
       flash[:notice] = "Game created!"
       redirect_to @game
    else
      render :new
    end
   end

   def update
     @game = Game.find(params[:id])
     @game.update(game_params)
     if @game.save
       redirect_to @game
    else
      render :new
    end
   end

   def destroy
     @game = Game.find(params[:id])
     @game.destroy
     redirect_to games_path
   end

   private

      def game_params
         params.require(:game).
            permit(user_ids:[])
      end

      def authenticate_current_user
        user_signed_in?
        alert_text = 'You must be a player in this game to do that action.'
        redirect_to '/', alert: alert_text unless @game.user_ids.include? current_user.id || authenticate_admin
      end

end
