class ProductsController < ApplicationController
  before_action :move_purchase, only: [:purchase]
  before_action :move_edit_destroy, only: [:edit, :destroy]
  before_action :set_product, only: [:edit, :show,:destroy,:purchase]

  def index
    @product_new = Product.where(buyer_id: nil).order("created_at DESC").limit(3)
    @product_random = Product.where(buyer_id: nil).order("RAND()").limit(3)
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
  end

  def edit
  end

  def update
  end

  def destroy
    if @product.destroy
      redirect_to root_path, notice: '消去に成功しました。'
    else
      render :show, alert: '消去に失敗しました。'
    end
  end

  def get_category_children
    @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
 end

 def get_category_grandchildren
    @category_grandchildren = Category.find("#{params[:child_id]}").children
 end

 def purchase
 end

  private
  def product_params 
    params.require(:product).permit(:status, :name, :explanation, :price, :place, :shipping_date,:brand,:category_id,images_attributes: [:image]).merge(saler_id: current_user.id)
  end
  
  def move_index
    redirect_to root_path unless current_user.id != Product.find(params[:id]).saler.id
    end
    
  def set_product
    @product = Product.find(params[:id])
  end

  def move_edit_destroy
    redirect_to root_path unless current_user.id == Product.find(params[:id]).saler.id
    end
  end
end