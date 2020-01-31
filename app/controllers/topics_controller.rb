class TopicsController < ApplicationController
  before_action :set_topic, only: [:show]

  def index
    @topics = Topic.includes(:user)
    @randams = Topic.order("RAND()").all
    @news = Topic.order(updated_at: :desc).limit(10)
    # @topics = Topic.all.with_attached_images
  end

  def new
    @topic = Topic.new
  end

  def create
    topic = Topic.create!(topic_params)
    redirect_to root_path
  end

  def destroy
    topic = Topic.find(params[:id])
    topic.destroy
    redirect_to user_path(current_user)
  end
  
  def edit
    @topic = Topic.find(params[:id])
  end

  def update
    topic = Topic.find(params[:id])
    topic.update(topic_params)
    redirect_to topic
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
