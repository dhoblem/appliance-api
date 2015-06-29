class AppliancesController < ApplicationController
before_filter :authenticate_user!

def index
  @appliances = Appliance.all.paginate(:page => params[:page], :per_page => 30)
end

def show
  @appliance = Appliance.where(:id=> params[:id]).first
end

private
def appliance_params
  params.require(:appliance).permit(:name, :customer)
end

end
