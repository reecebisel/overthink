class CreateThoughtsTable < ActiveRecord::Migration[5.0]
  def change
    create_table :thoughts_tables do |t|
      t.string :title
      t.string :subreddit
      t.string :url
      t.text :text
    end
  end
end
