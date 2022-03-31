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

    describe 'GET /api/v1/items/:item_id' do
        before { get "/api/v1/items/#{id}" }

        context 'when the item exists' do
            it 'returns status code 200' do
                expect(response).to have_http_status(200)
            end

            it 'returns the item' do
                expect(json["data"]).not_to be_empty
                expect(json["data"]["id"].to_i).to eq(id)
                expect(json["data"]["attributes"]["merchant_id"].to_i).to eq(merchant_id)
            end 
        end

        context 'when the item does not exist' do
            let(:id) { 0 }

            it 'returns status code 404' do
                expect(response).to have_http_status(404)
            end

            it 'returns a not found message' do
                expect(response.body).to match(/Couldn't find Item/)
            end 
        end 
    end 

    describe 'POST /api/v1/items' do
        let(:valid_attributes) { { name: 'Hubert Cup', description: "Cool ass Hubert cup.", unit_price: 9.99, merchant_id: merchant.id } }

        context 'when request attributes are valid' do
          before { post "/api/v1/items", params: valid_attributes }
    
          it 'returns status code 201' do
            expect(response).to have_http_status(201)
          end
        end
    
        context 'when an invalid request' do
          before { post "/api/v1/items/", params: { description: "Cool ass Hubert cup.", unit_price: 9.99, merchant_id: merchant_id } }
    
          it 'returns status code 422' do
            expect(response).to have_http_status(422)
          end
    
          it 'returns a failure message' do
            expect(response.body).to match(/Validation failed: Name can't be blank/)
          end
        end
      end    
end 