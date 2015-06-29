require 'sqlite3'

namespace :targets do
  desc "Set the status for targets"
  task monitor: :environment do
    @targets = Target.all.limit(50)
    @targets.each do |target|
      `ping -q -c 1 #{target.address}`
      if ($?.exitstatus == 0)
        target.is_alive = true
        target.save!
      end
    end
  end
end
