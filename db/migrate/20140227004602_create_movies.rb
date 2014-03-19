class CreateMovies < ActiveRecord::Migration
  def self.down 
    drop_table "movies"
  end
  def self.up
    create_table :movies,:force => true do |t|
      t.string :title
      t.string :rating
      t.text :description
      t.datetime :release_date

      t.timestamps
    end
  end

end
