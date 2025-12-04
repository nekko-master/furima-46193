class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  before_action :move_to_index
  before_action :sold_out_item, only: [:index, :create]

  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      
      @order_address.save
      # Address.create(address_params)
      return redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render :index, status: :unprocessable_entity
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def move_to_index
    if current_user.id == @item.user.id
      redirect_to root_path
    end
  end

  def sold_out_item
    if @item.order.present?
      redirect_to root_path
    end
  end

  def order_params
    params.require(:order_address).permit(:price, :postal_code, :prefecture_id, :municipalities, :street_address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  # def address_params
  #   params.require(:order).permit(:postal_code, :prefecture_id, :municipalities, :street_address, :building_name, :phone_number).merge(order_id: @order.id)
  # end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # PAY.JPテスト秘密鍵
      Payjp::Charge.create(
        amount: @item.price,  # 商品の値段
        card: order_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
  end
end
