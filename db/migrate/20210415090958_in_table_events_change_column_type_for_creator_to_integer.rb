class InTableEventsChangeColumnTypeForCreatorToInteger < ActiveRecord::Migration[6.1]
  def change
    change_column :events, :creator, :integer
  end
end
