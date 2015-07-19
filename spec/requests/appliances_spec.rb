require 'spec_helper'

describe "Targets", :type => :feature do #:type => :request do
  describe "GET /targets" do
    it "should fail to reach the path as it needs user-signin" do
      visit appliances_path
      expect(page).to have_content("Log in")
    end

    it "should pass to reach the path as it needs user-signin" do
      visit appliances_path
      @user = User.create(:email => 'admin@abc.com', :password => 'admin123')
      fill_in("user_email", :with => @user.email)
      fill_in("user_password", :with => @user.password)
      click_button "Log in"
      expect(page).to have_content("Appliances List Page")
    end
  end
end
