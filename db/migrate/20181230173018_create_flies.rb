class CreateFlies < ActiveRecord::Migration[5.2]
  def change
    create_table :flies do |t|
      t.string :name
    end
  end
end
