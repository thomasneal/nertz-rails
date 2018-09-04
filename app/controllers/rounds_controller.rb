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
    # Check if game has rounds in order to update game status
    if @game.rounds.count > 0
      # puts "Game has rounds."
    else
      @game.update_attribute(:status, "Playing")
    end

    @round = @game.rounds.build(round_params)


     if @round.save
       if @game.isFinished
         @game.status = "Finished"
         @game.save
       end
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

   def destroy
     @round = Round.find(params[:id])
     @round.destroy
     redirect_to @game
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
