class ProductsController < ApplicationController

  def index
    @products = Product.all.order(created_at: :desc)
  end

  def show
    @product = Product.find params[:id]

    sum = 0
    @product.reviews.each do |review|
      if @product.reviews.count > 0
        sum += review.rating
        @average_rating = sum / @product.reviews.count
      else
        @average_rating = 0
      end
    end
  end
end
