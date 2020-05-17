class AddressesController < ApplicationController

  def index
  end

  def new
    @address = Address.new
  end

  def show
  end
  
  def create
    @address = Address.new(address_params)
    if @address.valid?
      @address.save
      redirect_to root_path
    else
      redirect_to new_addresw_path
    end
  end


  def destroy
  end

  def edit
  end

  def update
  end

  private
  def address_params
    params.require(:address).permit(:post_code, :prefectures, :city, :block, :building, :phone_number).merge(user_id:current_user.id)
  end 
end
