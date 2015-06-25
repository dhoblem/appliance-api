require 'sqlite3'

namespace :targets do
  desc "To monitor and record the reachanble targets count"
  task monitor: :environment do
    # Open a SQLite 3 database file
    db = SQLite3::Database.new Rails.root.to_s + '/db/development.sqlite3'

    @reachable = 0
    @un_reachable = 0

    db.execute 'SELECT * FROM targets limit 50' do |row|
      `ping -q -c 1 #{row[3]}`
      if ($?.exitstatus == 0)
        @reachable = @reachable + 1
      end
      if ($?.exitstatus == 1)
        @un_reachable = @un_reachable + 1
      end
    end
    db.execute 'update target_statics set reachable=?, unreachable=?', @reachable,@un_reachable

  end

end
