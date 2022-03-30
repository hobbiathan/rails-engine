require 'rails_helper'

RSpec.describe "Merchants", type: :request do
  let!(:merchants) { create_list(:merchant, 5) }
  let(:merchant_id) { :merchants.first.id }

  describe "GET /index" do
    before { get '/api/v1/merchants' }

    it 'returns merchants' do
      expect(json).to_not be_empty
      expect(json["data"].size).to eq(5)
    end 

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end
end
