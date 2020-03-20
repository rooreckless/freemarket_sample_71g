class ProductsController < ApplicationController

  def index
  end

  def new
    @product = Product.new
    @product.build_image
  end

  def create
    Product.create(product_params)
    redirect_to products_path
  end

  def show
    @product = Product.find(params[:id])
  end

  private
  def product_params 
    params.require(:product).permit(:status, :name, :explanation, :price, :place, :shipping_date,:brand,image_attributes:[:id, :image,:product_id])
  end
end