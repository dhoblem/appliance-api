require 'ffaker'

FactoryGirl.define do 
  factory :user do
    email         { Faker::Internet.email }
    is_admin       false
#    super_admin   false
    password      "password"
    password_confirmation "password"

    factory (:admin) do
      is_admin true
    end

#    factory (:super_admin) do 
#      admin true
#      super_admin true
#    end
  end
end
