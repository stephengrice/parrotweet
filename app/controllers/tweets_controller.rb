class TweetsController < ApplicationController
  #before_action :set_tweet, only: [:show, :edit, :update, :destroy]
  before_action :authorize
  #respond_to :html
  
  def index
    @tweets = Tweet.where(:user_id => current_user.id).order(created_at: :desc)
    #respond_with(@tweets)
  end
  
  def show
    @tweet = Tweet.find(params[:id])
    @children = Tweet.where(:parent_tweet_id => @tweet.id)
    #respond_with(@tweet)
  end
  
  def new
    @tweet = Tweet.new
    #respond_with(@tweet)
  end
  
  
  #def edit
  #  @tweet = Tweet.find(params[:id])
  #end
  
  def create
    # Post the original language tweet
    @tweet = Tweet.new(tweet_params)
    @tweet.user_id = current_user.id
    @tweet.language = "en"
    @tweet.save
    @tweet.twitter_id = @tweet.post_to_twitter.id
    @tweet.save
    
    # Post one for each language specified
    languages = [] #English included by default
    params[:languages].each do |key, val|
      if val == "on"
        # Key is the langauge code
        languages.push(key)
      end
    end
    
    # Get translations array
    translations = getTranslations(@tweet.body, languages)
    translations.each_with_index do |t, index|
      @langTweet = Tweet.new
      @langTweet.user_id = current_user.id
      @langTweet.body = t["translationText"]
      @langTweet.parent_tweet_id = @tweet.id
      @langTweet.language = languages[index]
      @langTweet.save
      @langTweet.twitter_id = @langTweet.post_to_twitter.id
      @langTweet.save
    end
    
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
