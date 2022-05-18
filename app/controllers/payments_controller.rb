class PaymentsController < ApplicationController
skip_before_action :verify_authenticity_token, only: [:webhook]

  def success
  end

  def webhook
    payment_id = params[:data][:object][:payment_intent]
    payment = Stripe::PaymentIntent.retrieve(payment_id)
    listing_id = payment.metadata.listing_id
    user_id = payment.metadata.user_id
    seller_id = payment.metadata.seller_id
    listing_shipment = payment.metadata.listing_shipment
    if listing_shipment == "true"
      @shipment = Shipment.create(listing_id: listing_id, selling_user_id: seller_id, buying_user_id: user_id)
    end
    render plain: "Success"
  end
end