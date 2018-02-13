FactoryBot.define do 
	factory :product do
		sequence(:name) { |n| "product #{n}" }
    sequence(:description) { |n| "product description #{n}" }
  end
end