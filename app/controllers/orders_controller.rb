class OrdersController < ApplicationController
  require 'payjp'


  def index
    card = Card.where(user_id: current_user.id).first
    if card.blank?
      redirect_to controller: "creditcard", action: "new"
    else
      Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
      customer =Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end

  def pay
    card = Card.where(user_id: current_user.id).first
    item = Item.find(params[:item_id])
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    Payjp::Charge.create(
      amount: item.price,
      customer: card.customer_id,
      currency: 'jpy',
    )
  redirect_to action: 'done'
  end

  def done
  end
  
end
