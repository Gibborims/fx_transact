require 'rails_helper'

RSpec.describe "Api::V1::Transactions", type: :request do

  describe "GET /index" do
    let!(:customer) { FactoryBot.create(:customer, is_active: true) }
    before do
      FactoryBot.create_list(:transaction, 2, customer_id: customer.id)
      get '/api/v1/transactions'
    end

    it 'returns all transactions' do
      expect(json["rows"].size).to eq(2)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(:success)
    end
  end


  describe "GET /show" do
    let!(:customer) { FactoryBot.create(:customer, is_active: true) }
    let!(:transaction) { FactoryBot.create(:transaction, customer_id: customer.id) }
    let!(:trans_id) { transaction.id }
    before do
      get "/api/v1/transaction/#{transaction.id}"
    end

    it 'returns the specific transaction id' do
      expect(json["resp_desc"]["id"]).to eq(trans_id)
    end

    it 'returns response code 000' do
      expect(json["resp_code"]).to eq(success)
    end

  end




  describe "GET /create" do
    context "with valid parameters" do
      let!(:customer) { FactoryBot.create(:customer, is_active: true) }
      let(:valid_params) do
        { transaction: {
            customer_id: customer.id,
            transaction_id: Transaction.trans_generator,
            input_amt: Faker::Number.decimal(l_digits: 2),
            input_currency: Faker::Currency.code,
            output_amt: Faker::Number.decimal(l_digits: 2),
            output_currency: Faker::Currency.code,
            is_active: true
        }}
      end

      it "creates a new transaction" do
        expect { post "/api/v1/transactions", params: valid_params}.to change(Transaction, :count).by(1)
        expect(response).to have_http_status(200)  # it's use for code 200
      end

      it "creates a transaction with the correct attributes" do
        post "/api/v1/transactions", params: valid_params
        expect(json["resp_code"]).to eq(success)
      end
    end

    context "with invalid parameters" do
      # testing for validation failures is just as important!
      #let!(:customer) { FactoryBot.create(:customer, is_active: true) }
      let(:valid_params) do
        { transaction: {
            input_amt: "#{Faker::Number.decimal(l_digits: 2)}",
            input_currency: Faker::Currency.code,
            output_amt: "#{Faker::Number.decimal(l_digits: 2)}",
            output_currency: Faker::Currency.code,
            is_active: true
        }}
      end

      it "cannot create a new transaction due to validation error" do
        expect { post "/api/v1/transactions", params: valid_params}.to change(Transaction, :count).by(0)
        expect(response).to have_http_status(200)  # it's use for code 200
      end

      it "cannot create a transaction with the wrong attributes" do
        post "/api/v1/transactions", params: valid_params
        expect(json["resp_code"]).to eq(fail)
      end

    end
  end


end
