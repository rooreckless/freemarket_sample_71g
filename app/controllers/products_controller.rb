
class ProductsController < ApplicationController
  before_action :move_edit_destroy, only: [:edit, :destroy]
  before_action :set_product, only: [:edit, :show,:destroy,:purchase,:update]
  before_action :authenticate_user!, except: [:show,:index]
  
  def index
    
    @product_new = Product.where(buyer_id: nil).order("created_at DESC").limit(3)
    @product_random = Product.where(buyer_id: nil).order("RAND()").limit(3)
  end
  
  def search
    # search.html.hamlには「売り切れではなく、商品の更新日時の降順」で表示します。
    @products = Product.where(buyer_id: nil).order("updated_at DESC").page(params[:page]).per(9)
    # レスポンスを形式によってわけます
    
    
  end
  def result
    # search.html.hamlのフォームに入力された値をもとにproductsのnameを曖昧検索します。
    @products = Product.includes(:images).where("name LIKE ?","%#{params[:content]}%").order("updated_at DESC").page(params[:page]).per(9)
    # ajax通信後のjson.jbuilderに対応する配列(画像のファイル名と出品者名)を設定します。
    @images =[]
    @salerusers =[]
    # 検索された商品に対応するimageレコードと、出品者に当たるuserレコードを配列にpushします。
    @products.each do |product|
      image = Image.find_by(product_id: product.id)
      @images <<image
      user =User.find_by(id: product.saler_id)
      @salerusers << user  
    end
    # formatごとにリダイレクト先を変えたりできますが、今回はあまり意味がないと考え設定していません。
    respond_to do |format|
      # 例えば format.html redirect_to result_pathとか。
      format.html
      format.json
    end
    # result.json.jbuilderではこの@products(ActiveRecord::Relation)と@images(Array)と@salerusers(Array)を使用し、doneのdataになるようにします。
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
    # new.html.hamlにて入力された商品の値段はparams.require(:product)[:price]でとれます。(ただし、string型)この値段を税込み価格に変更してもらうProductクラスのメソッドを呼び出します。
    params.require(:product)[:price]=Product.taxingPrice(params.require(:product)[:price])
    
    @product = Product.new(product_params)

    if @product.save
      redirect_to products_path, notice: '商品を出品成功しました。'
    else
      redirect_to new_product_path, notice: '空の値があります'
    end
  end

  def show
  end

  def edit
    # show.html.hamlにて表示している価格を、edit.html.hamlでは「消費税抜き」に表示するため、Productクラスのメソッドを呼び出します。
    @product.price = Product.detaxingPrice(@product.price)
    grandchild_category = @product.category
    child_category = grandchild_category.parent

    @category_parent_array = Category.where(ancestry: nil).pluck(:name)

    @category_children_array = Category.where(ancestry: child_category.ancestry)

    @category_grandchildren_array = Category.where(ancestry: grandchild_category.ancestry)

  end

  def update
    # edit.html.hamlにて入力された商品の値段はparams.require(:product)[:price]でとれます。(ただし、string型)この値段を税込み価格に変更してもらうProductクラスのメソッドを呼び出します。
    params.require(:product)[:price]=Product.taxingPrice(params.require(:product)[:price])
    
    if @product.update(update_params)
      redirect_to root_path, notice: '更新にに成功しました。'
    else
      render :edit, alert: '更新に失敗しました。'
    end
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
    

  def update_params
    params.require(:product).permit(:status, :name, :explanation, :price, :place, :shipping_date,:brand,:category_id,images_attributes: [:image,:id,:_destroy]).merge(saler_id: current_user.id)
  end

  def set_product
    @product = Product.find(params[:id])
  end

  def move_edit_destroy
    redirect_to root_path unless current_user.id == Product.find(params[:id]).saler.id
    end
  end
