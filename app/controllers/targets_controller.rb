class TargetsController < ApplicationController
before_filter :authenticate_user!

def index
  @targets = Target.all.paginate(:page => params[:page], :per_page =>20)
  @target_reachable = Target.where(:is_alive=>true).count
  @target_unreachable = @targets.count - @target_reachable
end

end
