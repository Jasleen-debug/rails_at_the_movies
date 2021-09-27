class CreateMovies < ActiveRecord::Migration[6.1]
  def change
    create_table :movies do |t|
      t.string :title
      t.integer :year
      t.integer :duration
      t.text :description
      t.decimal :average_vote
      t.references :production_company, null: false, foreign_key: true

      t.timestamps
    end
  end
end
