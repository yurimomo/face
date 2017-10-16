class RemoveUserNameFromTopics < ActiveRecord::Migration
  def change
  	remove_column :topics, :user_name, :string
  end
end
