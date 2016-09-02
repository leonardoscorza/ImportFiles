require 'rails_helper'

RSpec.describe SalesGroupController, type: :controller do
  describe "DELETE destroy" do

    before(:each) do
      @sales_group = FactoryGirl.create(:sales_group)
      FactoryGirl.create(:sale, sales_group: @sales_group)
      FactoryGirl.create(:sale, sales_group: @sales_group)
      FactoryGirl.create(:sale, sales_group: @sales_group)
      FactoryGirl.create(:sale, sales_group: @sales_group)
    end

    it "has a 302 status code" do
      delete :destroy, params: { id: @sales_group.id }
      expect(response.status).to eq(302)
    end

    it "0 sales group" do
      delete :destroy, params: { id: @sales_group.id }
      expect(SalesGroup.all.count).to eq(0)
    end

    it "0 sales" do
      delete :destroy, params: { id: @sales_group.id }
      expect(Sale.all.count).to eq(0)
    end
  end

  describe "POST create" do

    before(:each) do
      @file = fixture_file_upload('dados.txt', 'text/txt')
    end

    it "has a 302 status code" do
      post :create, params: {sales_group: {text_file: @file}}
      expect(response.status).to eq(302)
    end

    it "has 1 SaleGroup" do
      post :create, params: {sales_group: {text_file: @file}}
      expect(SalesGroup.all.count).to eq(1)
    end

    it "has 4 Sales in the Sale Group" do
      post :create, params: {sales_group: {text_file: @file}}
      expect(SalesGroup.last.sales.count).to eq(4)
    end

    it "First Line is identical of the inputed file" do
      post :create, params: {sales_group: {text_file: @file}}

      sale = SalesGroup.last.sales[0]
      saleValues = [sale.buyer_name, sale.description, sale.amount, sale.full_address, sale.provider_name]
      expectedValues = ["João Silva","R$10 off R$20 of food", 2,"987 Fake St", "Bob's Pizza"]

      expect(saleValues).to eq(expectedValues)
    end

    it "Second Line is identical of the inputed file" do
      post :create, params: {sales_group: {text_file: @file}}

      sale = SalesGroup.last.sales[1]
      saleValues = [sale.buyer_name, sale.description, sale.amount, sale.full_address, sale.provider_name]
      expectedValues = ["Amy Pond", "R$30 of awesome for R$10", 5, "456 Unreal Rd", "Tom's Awesome Shop"]

      expect(saleValues).to eq(expectedValues)
    end

    it "Third Line is identical of the inputed file" do
      post :create, params: {sales_group: {text_file: @file}}

      sale = SalesGroup.last.sales[2]
      saleValues = [sale.buyer_name, sale.description, sale.amount, sale.full_address, sale.provider_name]
      expectedValues = ["Marty McFly", "R$20 Sneakers for R$5", 1, "123 Fake St", "Sneaker Store Emporium"]

      expect(saleValues).to eq(expectedValues)
    end

    it "Fourth Line is identical of the inputed file" do
      post :create, params: {sales_group: {text_file: @file}}

      sale = SalesGroup.last.sales[3]
      saleValues = [sale.buyer_name, sale.description, sale.amount, sale.full_address, sale.provider_name]
      expectedValues = ["Snake Plissken", "R$20 Sneakers for R$5", 4, "123 Fake St", "Sneaker Store Emporium"]

      expect(saleValues).to eq(expectedValues)
    end
  end
end
