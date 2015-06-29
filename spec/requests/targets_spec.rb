require 'spec_helper'

describe "Targets", :type => :request do
  describe "GET /targets" do
    it "should fail to reach the path as it needs user-signin" do
      get targets_path
      expect(response.status).to be(302)
    end
    it "should pass to reach the path as it needs user-signin" do
      get targets_path
      fill_in "Email", :with => "admin@abc.com"
      fill_in "Password", :with => "admin123"
      clink_button "Log In"
      expect(response.status).to be(200)
    end
  end
end
