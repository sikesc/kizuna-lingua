class ChallengesController < ApplicationController

  def show
    @challenge = Challenge.find(params[:id])
    @journal = @challenge.journal
    authorize @challenge
  end
end
