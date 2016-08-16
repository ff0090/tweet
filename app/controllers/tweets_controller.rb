class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all
  end

  def new
    #@tweets = Tweet.new
    if params[:back]
      @tweets = Tweet.new(tweets_params)
    else
      @tweets = Tweet.new
    end    
  end

  def edit
    @tweets = Tweet.find(params[:id])
  end
  
  def update
    @tweets = Tweet.find(params[:id])
    @tweets.update(tweets_params)
    redirect_to tweets_path, notice: "tweetを更新しました！"
  end
  
  def confirm
    @tweets = Tweet.new(tweets_params)
    render :new if @tweets.invalid?
  end    
  
  
  def destroy
    @tweets = Tweet.find(params[:id])
    @tweets.destroy
    redirect_to tweets_path, notice: "tweetを削除しました！"
  end  
  
  def create
     @tweets = Tweet.create(tweets_params)
    if @tweets.save
      redirect_to tweets_path, notice: "tweetを投稿しました！"
    else
      render action: 'new'
    end 
  end

  private
    def tweets_params
      params.require(:tweet).permit(:content)
    end
end