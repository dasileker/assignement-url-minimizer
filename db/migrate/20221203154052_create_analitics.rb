class CreateAnalitics < ActiveRecord::Migration[7.0]
  def change
    create_table :analitics do |t|
      t.string :click_count
      t.datetime :last_visit
      t.references :url, null: false, foreign_key: true

      t.timestamps
    end
  end
end
