class CreateVisitedCountries < ActiveRecord::Migration[6.0]
  def change
    create_table :visited_countries do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :country_id
      t.timestamps
    end
  end
end
