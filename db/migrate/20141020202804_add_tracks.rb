class AddTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.string :songtitle
      t.string :author
      t.string :url
      t.timestamps
    end
  end
end
