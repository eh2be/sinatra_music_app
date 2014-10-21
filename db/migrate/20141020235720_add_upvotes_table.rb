class AddUpvotesTable < ActiveRecord::Migration
  def change
    create_table :upvotes do |t|
      t.integer :user_id
      t.integer :track_id
    end
  end
end
