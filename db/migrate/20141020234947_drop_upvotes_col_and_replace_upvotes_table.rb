class DropUpvotesColAndReplaceUpvotesTable < ActiveRecord::Migration
  def change
    remove_column :tracks, :upvotes
  end
end
