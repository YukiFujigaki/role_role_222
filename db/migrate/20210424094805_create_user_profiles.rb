class CreateUserProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :user_profiles do |t|
      t.integer :user_id
      t.string :name
      t.string :introduction
      t.string :image
      t.string :background_image

      t.timestamps
    end
  end
end
