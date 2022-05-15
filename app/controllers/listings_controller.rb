class ListingsController < ApplicationController
  before_action :set_listings, only: [:show]
  def index
    @listings = Listing.order(:created_at).reverse_order
  end

  def show
  end

  def new
    @listing = Listing.new
  end

  def create
    @listing = current_user.listings.create(listings_params)
    if @listing.valid?
      redirect_to @listing
    else
      flash.now[:alert] = @listing.errors.full_messages.join('<br>')
      # so any entered form data stays on page
      render 'new'
    end
  end

  private 

  def set_listings
    @listings = Listing.find(params[:id])
  end
end
