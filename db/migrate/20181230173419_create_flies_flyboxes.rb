class CreateFliesFlyboxes < ActiveRecord::Migration[5.2]
  def change
    create_table :flies_flyboxes do |t|
      t.integer :fly_id
      t.integer :flybox_id
    end
  end
end
