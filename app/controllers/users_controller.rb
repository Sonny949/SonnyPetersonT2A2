class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def show
    @shipments = Shipment.where(selling_user_id: current_user.id)
    @receivals = Shipment.where(buying_user_id: current_user.id)
  end
end
