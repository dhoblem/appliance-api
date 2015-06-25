class AddDefaultTargetStatics < ActiveRecord::Migration
  def change
    execute 'insert into target_statics(reachable, unreachable) values(7,3)'
  end
end
