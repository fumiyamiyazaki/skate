class RemoveImageFromTopics < ActiveRecord::Migration[5.2]
  def change
    remove_column :topics, :image, :string
  end
end
