require 'rails_helper'

RSpec.describe 'Items API' do
    let!(:merchant) { create(:merchant) }
    let!(:items) { create_list(:item, 10, merchant_id: merchant.id) }
    let(:merchant_id) { merchant.id }
    let(:id) { items.first.id }

    describe 'GET /api/v1/items' do 
        before { get "/api/v1/items" }

        context 'when item exists' do
            it 'returns status code 200' do
                expect(response).to have_http_status(200)
            end 

            it 'returns all items' do
                expect(json["data"].size).to eq(10)
            end 
        end 

        context 'when items do not exist' do
            let (:items) { create_list(:item, 0, merchant_id: merchant.id) }

            it 'returns status code 200' do
                expect(response).to have_http_status(200)
            end 

            it 'returns an empty data array ' do
                expect(response.body).to match("{\"data\":[]}")
            end 
        end 
    end 
end 