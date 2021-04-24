class CreateRoleModels < ActiveRecord::Migration[6.1]
  def change
    create_table :role_models do |t|
      t.integer :user_id, null: false
      t.string :title
      t.string :description
      t.string :good_point
      t.string :bad_point
      t.string :approach

      t.timestamps
    end
  end
end
