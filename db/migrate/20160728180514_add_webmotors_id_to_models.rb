class AddWebmotorsIdToModels < ActiveRecord::Migration
  def change
    add_column :models, :webmotors_id, :integer
  end
end
