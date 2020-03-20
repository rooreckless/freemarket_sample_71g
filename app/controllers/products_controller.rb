class ProductsController < ApplicationController

  def index
  end

  def new
    @product = Product.new
  end

  def create
    Product.create(product_params)
  end

  def show
    @product = Product.find(params[:id])
  end

  private
  def product_params 
    params.require(:product).permit(:status, :name, :explanation, :price, :place, :shipping_date)
  end
end
