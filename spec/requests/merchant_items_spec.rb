require 'rails_helper'

RSpec.describe 'Items API' do
    let!(:merchant) { create(:merchant) }
    let!(:items) { create_list(:item, 10, merchant_id: merchant.id) }
    let(:merchant_id) { merchant.id }
    let(:id) { items.first.id }

    describe 'GET /api/v1/merchants/:merchant_id/items' do
        before { get "/api/v1/merchants/#{merchant_id}/items" }

        context "when merchant exists" do
            it 'returns status code 200' do
                expect(response).to have_http_status(200)
            end 

            it 'returns all merchant items' do
                expect(json["data"].size).to eq(10)
            end 
        end 

        context "when todo does not exist" do
            let(:merchant_id) { 29385 } #definitely real

            it 'returns status code 404' do
                expect(response).to have_http_status(404)
            end 

            it 'returns a not found message' do
                expect(response.body).to match (/Couldn't find Merchant/)
            end 
        end 
    end 
end 