require 'rails_helper'

RSpec.describe 'Merchant Search API' do
    let!(:merchants) { create_list(:merchant, 5) }
    let(:merchant_name_f) { merchants.first.name }
    let(:merchant_name_l) { merchants.last.name }

    context 'a valid search query exists' do
        before { get "/api/v1/merchants/find?name=#{merchant_name_f}" }

        it 'returns all possibly valid queries' do
            expect(json).to_not be_empty
            expect(json["data"]["attributes"["name"]]).to eq(merchant_name_f)
        end 

        it 'returns status code 200' do
            expect(response).to have_http_status(204)
        end
    end 

    context 'no valid search query is found' do
        before { get "/api/v1/merchants/find?name=Hubert" }

        it 'returns status code 200' do
            expect(json).to be_empty
            expect(response).to have_http_status(200)
        end 
    end 
end 