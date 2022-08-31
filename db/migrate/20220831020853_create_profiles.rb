class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.references :user, null: false, foreign_key: true
      t.string :user_icon
      t.string :username, null: false, default: '', unique: true
      t.text :introduction
      t.string :twitter_url
      t.string :linkedin_url
      t.string :facebook_url
      t.string :blog_url
      t.timestamps
    end
  end
end
