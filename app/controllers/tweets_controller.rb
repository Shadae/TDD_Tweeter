class TweetsController < ApplicationController
  def new
    @tweet = Tweet.new
  end

  def show
    @tweet = Tweet.find(params[:id])
  end

  def index
    @tweets = Tweet.all
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new
    @tweet.author = params[:tweet][:author]
    @tweet.content = params[:tweet][:content]
    if @tweet.save
      redirect_to @tweet
    else
      render 'new'
    end
  end

  private

  def tweet_params
    params.permit(:author, :content)
  end
end
