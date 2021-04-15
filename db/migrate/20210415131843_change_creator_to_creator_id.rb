class ChangeCreatorToCreatorId < ActiveRecord::Migration[6.1]
  def change
    rename_column :events, :creator, :creator_id
  end
end
