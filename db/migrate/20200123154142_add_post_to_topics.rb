class AddPostToTopics < ActiveRecord::Migration[5.2]
  def change
    add_column :topics, :post, :string
  end
end
