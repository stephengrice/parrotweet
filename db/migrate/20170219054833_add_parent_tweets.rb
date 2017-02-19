class AddParentTweets < ActiveRecord::Migration[5.0]
  def change
    add_column :tweets, :parent_tweet_id, :integer
  end
end
