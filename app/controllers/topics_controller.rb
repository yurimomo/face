class TopicsController < ApplicationController
    before_action :authenticate_user!

  before_action :set_topic, only: [:show, :edit, :update, :destroy]

  def index
    @topics = Topic.all
    respond_to do |format|
    format.html
    format.js
  end

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
    @topic.user_id = current_user.id

     if @topic.save
       redirect_to topics_path, notice: "投稿しました！"
       NoticeMailer.sendmail_topic(@topic).deliver

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

  # showアククションを定義します。入力フォームと一覧を表示するためインスタンスを2つ生成します。
  def show
    @comment = @topic.comments.build
    @comments = @topic.comments
  end


    private
    def topic_params
      params.require(:topic).permit(:picture, :content)
    end

      # idをキーとして値を取得するメソッド
    def set_topic
      @topic = Topic.find(params[:id])
    end


 end
