class CreateFlyboxes < ActiveRecord::Migration[5.2]
  def change
    create_table :flyboxes do |t|
      t.string :name
      t.integer :user_id
    end
  end
end
