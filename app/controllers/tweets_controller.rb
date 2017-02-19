class TweetsController < ApplicationController
  before_action :set_tweet, only: [:show, :edit, :update, :destroy]
  
  #respond_to :html
  
  def index
    @tweets = Tweet.where(:user_id => current_user.id)
    #respond_with(@tweets)
  end
  
  def show
    respond_with(@tweet)
  end
  
  def new
    @tweet = Tweet.new
    #respond_with(@tweet)
  end
  
  def edit
  end
  
  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.user_id = current_user.id
    @tweet.save
    redirect_to tweets_path
  end
  
  def update
    @tweet.update(tweet_params)
    #respond_with(@tweet)
  end
  
  private
  def tweet_params
    params.require(:tweet).permit(:user_id, :body)
  end
end
