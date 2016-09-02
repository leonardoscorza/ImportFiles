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

    it "Firt name of first Sale is João Silva" do
      post :create, params: {sales_group: {text_file: @file}}
      expect(SalesGroup.last.sales.first.buyer_name).to eq("João Silva")
    end

    it "Last Sale has a Provider with name Sneaker Store Emporium" do
      post :create, params: {sales_group: {text_file: @file}}
      expect(SalesGroup.last.sales.last.provider_name).to eq("Sneaker Store Emporium")
    end
  end
end
