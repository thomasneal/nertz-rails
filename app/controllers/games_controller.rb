class GamesController < ApplicationController
  before_action :authenticate_admin, :only => [:new, :edit, :create, :destroy]

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

end
