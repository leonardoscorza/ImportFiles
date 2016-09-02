require 'rails_helper'


RSpec.describe SalesGroup, :type => :model do
  it "Count total gross sales" do
    @sales_group = FactoryGirl.create(:sales_group)
    # Initialize Ramdom Price and amount to test
    unit_price1 = Faker::Number.decimal(2).to_d
    amount1 = Faker::Number.between(1, 99999)
    unit_price2 = Faker::Number.decimal(2).to_d
    amount2 = Faker::Number.between(1, 99999)
    unit_price3 = Faker::Number.decimal(2).to_d
    amount3 = Faker::Number.between(1, 99999)
    unit_price4 = Faker::Number.decimal(2).to_d
    amount4 = Faker::Number.between(1, 99999)

    #Generate 4 Sales like in example file
    FactoryGirl.create(:sale, unit_price: unit_price1, sales_group: @sales_group, amount: amount1)
    FactoryGirl.create(:sale, unit_price: unit_price2, sales_group: @sales_group, amount: amount2)
    FactoryGirl.create(:sale, unit_price: unit_price3, sales_group: @sales_group, amount: amount3)
    FactoryGirl.create(:sale, unit_price: unit_price4, sales_group: @sales_group, amount: amount4)

    #Expect the sum of the multiplication of unit_price * amount of all Sales
    expect(@sales_group.total).to eq((unit_price1 * amount1) + (unit_price2 * amount2) + (unit_price3 * amount3) + (unit_price4 * amount4))
  end
end
