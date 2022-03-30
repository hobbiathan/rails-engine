require 'rails_helper'

RSpec.describe "Merchants", type: :request do
  let!(:merchants) { create_list(:merchant, 5) }
  let(:merchant_id) { :merchants.first.id }

  describe "GET /api/v1/merchants" do
    before { get '/api/v1/merchants' }

    it 'returns merchants' do
      expect(json).to_not be_empty
      expect(json["data"].size).to eq(5)
    end 

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /api/v1/merchants/merchant_id' do
    before { get "/api/v1/merchants/#{merchant_id}" }

    context 'when the record exists' do
      it 'returns the merchant' do
        expect(json["data"]).not_to be_empty
        expect(json["data"]["id"]).to eq(merchant_id)
      end 

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end 
    end 

    context 'when the record does not exist' do
      let(:merchant_id) { 12395412341234 } # Yea

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end 

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Merchant/)
      end 
    end 
  end 

end
