require 'spec_helper'

describe AppliancesController, :type => :controller do
  describe "GET index" do
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:admin]
      admin = FactoryGirl.create(:admin)
      sign_in :user, admin
    end

    it "says 'Listing Appliances'" do
      expect(RSpec).not_to receive(:deprecate)
      get :index
      expect(response).to render_template(:index)
    end
  end
end
