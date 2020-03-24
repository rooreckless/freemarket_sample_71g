class ProductsController < ApplicationController

  def index
    @product_new = Product.all.order("created_at DESC").limit(3).where('buyer_id = null')
    @product_random = Product.all.order("RANDOM()").limit(3).where('buyer_id = null')
  end

  def new
    @product = Product.new
    @product.images.new
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

  def edit
    @product = Product.find(params[:id])
  end

  def update
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
    params.require(:product).permit(:status, :name, :explanation, :price, :place, :shipping_date,:brand,:category_id,images_attributes: [:image])
    #カレントユーザーが出来次第追加
    # .merge(saler_id: current_user.id)
  end
end
