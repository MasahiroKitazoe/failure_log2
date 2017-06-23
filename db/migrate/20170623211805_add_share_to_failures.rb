class AddShareToFailures < ActiveRecord::Migration
  def change
    add_column :failures, :share, :boolean
  end
end