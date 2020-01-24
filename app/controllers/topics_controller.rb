class TopicsController < ApplicationController
  before_action :set_topic, only: [:show]

  def index
    @topics = Topic.includes(:user)
    # @topics = Topic.all.with_attached_images
  end

  def new
    @topic = Topic.new
  end

  def create
    topic = Topic.create!(topic_params)
    # topic.images.attach(params[:topic][:images])
    redirect_to topic
  end

  def destroy
    topic = Topic.find(params[:id])
    topic.destroy
    redirect_to user_path(current_user)
  end

  def show
    @topic = Topic.find(params[:id])
  end

  private
  def topic_params
    params.require(:topic).permit(:text, :post).merge(user_id: current_user.id)
  end

  def set_topic
    @topic = Topic.find(params[:id])
  end

end
