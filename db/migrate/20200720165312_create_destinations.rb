class CreateDestinations < ActiveRecord::Migration
  def change
    create_table :destinations do |t|
      t.string :title
      t.date :date
      t.string :season
      t.string :location
      t.string :attractions 
      t.string :restaurants 
      t.string :shopping 
      t.text :content
      t.timestamps null: false
    end
  end
end


