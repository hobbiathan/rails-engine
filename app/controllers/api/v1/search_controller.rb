class Api::V1::SearchController < ApplicationController
    def find
        merchant = Merchant.where('name ILIKE ?', "%#{params[:name]}%").first # I hate RegEx (also why is ILIKE a thing)

        if merchant.nil?
            render json: { data: { message: "No Merchants Found"} }, status: 200
        else
            render json: MerchantSerializer.new(merchant)
        end
    end 

    def find_all
        items = Item.where('name ILIKE ?', "%#{params[:name]}%")

        if items.nil?
            render json: { data: { message: "No Items Found" } }, status: 200
        else
            render json: ItemSerializer.new(items)
        end 
    end 
end 