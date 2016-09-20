class CreateThoughts < ActiveRecord::Migration[5.0]
  def change
    create_table :thoughts do |t|
      t.string :title
      t.string :external_id
      t.text :text
      t.string :url
      t.timestamps
    end
  end
end
