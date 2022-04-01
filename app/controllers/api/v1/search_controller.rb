class Api::V1::SearchController < ApplicationController
    def find
        merchant = Merchant.where('name ILIKE ?', "%#{params[:name]}%").first # I hate RegEx (also why is ILIKE a thing)

        if merchant.nil?
            render json: { data: { message: "No Merchants Found"} }, status: 200
        else
            render json: MerchantSerializer.new(merchant)
        end
    end 
end 