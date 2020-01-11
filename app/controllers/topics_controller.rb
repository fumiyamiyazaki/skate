class TopicsController < ApplicationController
  before_action :set_topic, only: [:show]

  def index
    @topics = Topic.includes(:user)
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.create(topic_params)
    redirect_to @topic
  end

  def show
    @topic = Topic.find(params[:id])
  end

  private
  def topic_params
    params.require(:topic).permit(:name, :text, :image).merge(user_id: current_user.id)
  end

  def set_topic
    @topic = Topic.find(params[:id])
  end

end
