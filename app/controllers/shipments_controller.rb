class ShipmentsController < ApplicationController
before_action :authenticate_user!
before_action :set_shipment
before_action :set_buyer
before_action :set_seller, only: [:edit, :show]

  def show
    @listing = Listing.find_by(id: @shipment.listing_id)
    @address = Address.find_by(user_id: @buyer.id)
  end

  def edit
  end

  def update
    @shipment.update!(shipment_params)
    redirect_to @shipment
    if @shipment.date_shipped?
      ShipmentMailer.with(user: User.find(@buyer.id), shipment: Shipment.find(@shipment.id)).shipment_initiated.deliver_later
    end
  end
  
  private

  def set_shipment
    @shipment = Shipment.find(params[:id])
  end

  def set_buyer
    @buyer = User.find_by(id: @shipment.buying_user_id)
  end

  def set_seller
    @seller = User.find_by(id: @shipment.selling_user_id)
  end

  def shipment_params
    return params.require(:shipment).permit(:date_shipped, :status)
  end

end
