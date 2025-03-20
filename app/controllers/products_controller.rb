class ProductsController < ApplicationController
    def index
      last_seen = params[:last_seen] || 0
      @products = Product.where("id > ?", last_seen).limit(10)
    end

    private
    def product_params
      params.permit(:title, :category_id, :description, :price)
    end
  end
