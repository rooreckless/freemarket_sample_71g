class AddressesController < ApplicationController
  def new
    @address = Address.new
  end

  def index
  end

  def create
    binding.pry
    @address = Address.create(address_params)
    redirect_to products_path
  end

  private

  def address_params
    params.require(:address).permit(:shipping_name_last_name, :shipping_name_first_name, :shipping_last_name_kana, :shipping_first_name_kana, :postcode, :state, :city, :address_line, :building_name, :room_number, :phone_number)
  end

end
