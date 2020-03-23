class ProductsController < ApplicationController

  def index
  end

  def new
    @product = Product.new
    @product.build_image
    @category_parent_array = ["---"]
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.name
    end
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to products_path
    else
      redirect_to new_product_path, notice: '空の値があります'
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def get_category_children
    @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
 end

 def get_category_grandchildren
    @category_grandchildren = Category.find("#{params[:child_id]}").children
 end

  private
  def product_params 
    params.require(:product).permit(:status, :name, :explanation, :price, :place, :shipping_date,:brand,:category_id,image_attributes:[:id, :image,:product_id]).merge(saler_id: current_user.id)
  end
end
