require 'rails_helper'

RSpec.describe 'Item Search API' do
    before(:each) do
        merchant = Merchant.create!(name: "Hubert Industries")
        @item = merchant.items.create!(name: "Cobalt Bomb", description: "Isn't this against the Geneva convention or something?", unit_price: 12.99)
        @item_2 = merchant.items.create!(name: "Enriched Uranium", description: "Ethically Sourced", unit_price: 5.99)
        @item_3 = merchant.items.create!(name: "Corn on a Cob", description: "What else would corn be on? A leaf?", unit_price: 139.99)
    end 

    context 'a search query contains multiple valid results' do
        before { get "/api/v1/items/find_all?name=oB" }

        it 'returns all possibly valid queries' do
            expect(json).to_not be_empty
            expect(json["data"][0]["attributes"]["name"]).to eq(@item.name)
            expect(json["data"][1]["attributes"]["name"]).to eq(@item_3.name)
        end 

        it 'returns status code 200' do
            expect(response).to have_http_status(200)
        end
    end 

    context 'no valid search query is found' do
        before { get "/api/v1/items/find_all?name=asdgfasgasdgasdg" }

        it 'returns status code 200' do
            #expect(response.body).to match (/No Items Found/) # ok.
            expect(response).to have_http_status(200)
        end 
    end 
end 