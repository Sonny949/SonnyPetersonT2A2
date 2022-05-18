class ListingsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_listings, only: [:show, :update, :destroy, :edit]


  def index
    @listings = Listing.order(:created_at).reverse_order
  end

  def show
    if user_signed_in?
      session = Stripe::Checkout::Session.create(
        payment_method_types: ['card'],
        customer_email: current_user.email,
        line_items: [{
          name: @listing.title,
          description: @listing.description,
          amount: (@listing.price * 100).to_i,
          currency: 'aud',
          quantity: 1,
        }],
        payment_intent_data: {
          metadata: {
            listing_shipment: @listing.shipment,
            listing_id: @listing.id,
            user_id: current_user.id,
            seller_id: @listing.user_id
          }
        },
        success_url: "#{root_url}payments/success?listingId=#{@listing.id}",
        cancel_url: "#{root_url}listings"
      )
      @session_id = session.id
    end
  end

  def new
    @listing = Listing.new
  end

  def create
    @listing = current_user.listings.create(listing_params)
    if @listing.valid?
      redirect_to @listing
    else
      flash.now[:alert] = @listing.errors.full_messages.join('<br>')
      # so any entered form data stays on page
      render 'new'
    end
  end

  def edit
  end

  def update    
    if @listing.update(listing_params)
      flash.now[:success] = 'Updated!'
      redirect_to @listing
    else
      flash.now[:alert] = @listing.errors.full_messages.join('<br>')
      render 'edit'
    end
  end

  def destroy
    @listing.destroy
    redirect_to listings_path
  end

  private

  def set_listings
    @listing = Listing.find(params[:id])
  end

  def listing_params
    return params.require(:listing).permit(:title, :price, :description, :user_id, :category_id, :shipment, images: [])
  end
end