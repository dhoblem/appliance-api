require 'sqlite3'

namespace :targets do
  desc "Set the status for targets"
  task monitor: :environment do
    @targets = Target.all.limit(100)
    @targets.each do |target|
      begin
        `ping -q -c 1 #{target.address}`
      rescue Exception => ex
        logger.error "Exception: #{ex.message}"
      end
      if ($?.exitstatus == 0)
        target.is_alive = true
        target.save!
      end
    end
  end
end
