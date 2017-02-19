class TweetsController < ApplicationController
  #before_action :set_tweet, only: [:show, :edit, :update, :destroy]
  
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
  
  
  #def edit
  #  @tweet = Tweet.find(params[:id])
  #end
  
  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.user_id = current_user.id
    @tweet.save
    @tweet.twitter_id = @tweet.post_to_twitter.id
    @tweet.save
    redirect_to tweets_path
  end
  
  #def update
  #  @tweet = Tweet.find(params[:id])
  #  @tweet.update(tweet_params)
  #  #respond_with(@tweet)
  #end
  
  def destroy
    @tweet = Tweet.find(params[:id])
    current_user.twitter.destroy_tweet(@tweet.twitter_id)
    @tweet.destroy
    redirect_to tweets_path
  end
    
  private
  def tweet_params
    params.require(:tweet).permit(:id, :user_id, :body)
  end
end
