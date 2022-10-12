class CreateMovies < ActiveRecord::Migration[7.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.date :release
      t.integer :rating
      t.references :director, null: false, foreign_key: true
      t.references :producer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
