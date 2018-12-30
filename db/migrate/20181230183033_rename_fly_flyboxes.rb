class RenameFlyFlyboxes < ActiveRecord::Migration[5.2]
  def change
    rename_table :flies_flyboxes, :fly_flyboxes
  end
end
