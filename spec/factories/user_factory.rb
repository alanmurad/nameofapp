FactoryBot.define do
  factory :user do
	  sequence(:first_name) { |n| "user#{n}" }
	  sequence(:last_name) { |n| "user#{n}" }
	  sequence(:email) { |n| "user#{n}@example.com" }
	  password "1234567890"
    admin false
  end
  factory :admin do 
  	admin true
  end
end