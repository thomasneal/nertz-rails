class RoundsController < ApplicationController
  before_action :set_game

  def index
    @rounds = @game.rounds
  end

  def new
    @round = Round.new
  end

  def show
    @round = Round.find(params[:id])
  end

  def create
     @round = @game.rounds.build(round_params)
     #debug(params[:scores])

     if @round.save
       redirect_to @game
    else
      byebug
    end
   end

   def update
     @round = Round.find(params[:id])
     @round.update(round_params)
     if @round.save
       redirect_to @round
    else
      byebug
    end
   end


   private

      def set_game
        @game = Game.find(params[:game_id])
      end

      def round_params
         params.require(:round).
            permit(scores_attributes: [:user_id, :value])
      end

end
