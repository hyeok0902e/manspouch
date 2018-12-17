class TalksController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @creature = Creature.find(params[:creature_id])
    @talk = @creature.talks.create(params[:talk].permit(:body))
    @talk.user = current_user
    @talk.save

    redirect_to creature_path(@creature)
  end

  def destroy
    @creature = Creature.find(params[:creature_id])
    @talk = @creature.talks.find(params[:id])
    @talk.destroy

    redirect_to creature_path(@creature)
  end
end
