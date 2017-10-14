class TopicsController < ApplicationController
  before_action :set_topic, only: [:edit, :update, :destroy]

  def index
    @topics = Topic.all
  end

  def new
  	if params[:back]
     @topic = Topic.new(topic_params)
     else
      @topic = Topic.new
    end
  end


  def create
    @topic = Topic.new(topic_params)
     if @topic.save
       redirect_to topics_path, notice: "投稿しました！"
     else
      render 'new'

    # Topic.create(topic_params)
    # redirect_to topics_path
    # redirect_to topics_path, notice: "投稿しました！"
    end
  end

  def edit
     @topic = Topic.find(params[:id])

  end

  def update
    @topic = Topic.find(params[:id])
    @topic.update(topic_params)
    redirect_to topics_path, notice: "投稿しました！"
  end

  def destroy
    @topic = Topic.find(params[:id])
    @topic.destroy
    redirect_to topics_path, notice: "投稿しました！"
  end

  def confirm
    @topic = Topic.new(topic_params)
    render :new if @topic.invalid?

  end

    private
    def topic_params
      params.require(:topic).permit(:title, :content)
    end

      # idをキーとして値を取得するメソッド
    def set_topic
      @topic = Topic.find(params[:id])
    end


 end
