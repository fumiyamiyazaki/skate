class TopicsController < ApplicationController
  before_action :set_topic, only: [:destroy, :edit, :update, :show]
  before_action :move_to_index, only: [:new, :create, :destroy, :edit, :update]

  def index
    @topics = Topic.includes(:user)
    @randams = Topic.all.shuffle
    @news = Topic.order(updated_at: :desc).limit(11).includes(:user)
    # @topics = Topic.all.with_attached_images
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.new(topic_params)
    if @topic.save
      redirect_to root_path
    else
      render new_topic_path
    end
     # topic_params[:post].each do |a|
    #   topic = Topic.new(topic_params.clone.merge({post: a}))
    #   topic.save
    # end
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

  def search
    @topics = Topic.search(params[:keyword])
  end

  private
  def topic_params
    params.require(:topic).permit(:text, :post).merge(user_id: current_user.id)
  end


  def set_topic
    @topic = Topic.find(params[:id])
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

end
