class TopicsController < ApplicationController

  def index
    # @topics = Topic.all
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.create params.require(:topic).permit(:name, :text, :image)
    redirect_to @topic
  end

  def show
    @topic = Topic.find(params[:id])
  end

end
