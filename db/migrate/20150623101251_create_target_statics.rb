class CreateTargetStatics < ActiveRecord::Migration
  def change
    create_table :target_statics do |t|
      t.integer :reachable, :default=> 0
      t.integer :unreachable, :default =>0

      t.timestamps
    end
  end
end
