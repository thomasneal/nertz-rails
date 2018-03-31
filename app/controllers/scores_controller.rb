class ScoresController < ApplicationController
  def index
    @scores = Score.joins(:user)
    #@users = User.all
  end

  def new
     @score = Score.new
     @users = User.all
  end

  def create
     @score = Score.new(score_params)
     @score.status = new
     if @score.save
       redirect_to @score
    else
      byebug
    end
   end

   def update
     @score = Score.find(params[:id])
     @score.update(score_params)
     if @score.save
       redirect_to @score
    else
      byebug
    end
   end


   private

      def score_params
         params.require(:score).
            permit(:value, :user_id)
      end

end
