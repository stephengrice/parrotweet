class AddTweetLanguage < ActiveRecord::Migration[5.0]
  def change
    add_column :tweets, :language, :string
  end
end
