class CreditcardController < ApplicationController

  require "payjp"

  def new
    card = Credeit_card.where(user_id: current_user.id)
    redirect_to action: "show" if card.exists?
  end

  def pay
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    if params['payjp-token'].blank?
      redirect_to action: "new"
    else
      customer = Payjp::Customer.create(
        card: params['payjp-token'],
        metadata: {user_id: current_user.id}
      )
      @card = Credeit_card.new(user_id: current_user.id, customer_id: customer.id, card_id:)
end
