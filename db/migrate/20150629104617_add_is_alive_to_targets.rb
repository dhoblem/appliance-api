class AddIsAliveToTargets < ActiveRecord::Migration
  def change
    add_column :targets, :is_alive, :boolean, :default => false
  end
end
