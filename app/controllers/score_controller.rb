class ScoreController < ApplicationController
  def index
  	@score = Score.all
  end
  def new
  	@score = Score.new
  end

  def create
  	@score = Score.new(params.require(:score).permit(:name,:points))
    if @score.save
        redirect_to @score, alert: "User created successfully."
    else
        redirect_to new_score_path, alert: "Error creating user."
    end
  end

  def show
  	@score = Score.find(params[:id])
  	#@score = Score.where(:name => @score.name)
  end
end
