class AddressesController < ApplicationController

  def new
    @address = Address.new
  end

  def index
  end

  def create
    @address = Address.new(address_params)
    if @address.save
      redirect_to new_card_path and return
    else
      redirect_to new_address_path, notice: '必須項目で入力されていないものがあります。すべての必須項目を入力してください' and return
    end
    
  end

  private

  def address_params
    params.require(:address).permit(:shipping_name_last_name, :shipping_name_first_name, :shipping_last_name_kana, :shipping_first_name_kana, :postcode, :state, :city, :address_line, :building_name, :room_number, :phone_number).merge(user_id: current_user.id)
  end

end