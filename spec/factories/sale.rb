FactoryGirl.define do
  factory :sale do
   buyer_name 'test guy'
   description 'One Good Sales Day'
   unit_price 1
   amount 1
   full_address 'Wall Street'
   provider_name 'Jonh'
   sales_group SalesGroup.last
  end
end
