class Api::V1::ItemsController < ApplicationController
    def index
        render json: ItemSerializer.new(Item.all)
    end 

    def show
        render json: ItemSerializer.new(Item.find(params[:id]))
    end 

    def create
        merchant = Merchant.find(params["merchant_id"])
        render json: ItemSerializer.new(merchant.items.create!(item_params)), status: :created
    end

    def update
        Item.find(params[:id]).update(item_params)
        head :no_content
    end 

    def destroy
        Item.find(params[:id]).destroy
        head :no_content
    end

    private

    def item_params
        params.permit(:name, :description, :unit_price)
    end 
end
