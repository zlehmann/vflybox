class AddCreatorToFlies < ActiveRecord::Migration
  def change
    add_column :flies, :creator_id, :integer
  end
end
