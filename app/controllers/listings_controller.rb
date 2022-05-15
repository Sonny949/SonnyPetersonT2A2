class ListingsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  # before_action :check_auth, only: [:update, :edit, :destroy]
  before_action :set_listings, only: [:show, :update, :destroy, :edit]


  def index
    @listings = Listing.order(:created_at).reverse_order
  end

  def show
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
      if params[:listing][:images].present?
        params[:listing][:images].each do |image|
          @listing.images.attach(image)
        end
      end
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

  # def check_auth
  #   return (current_user.has_role?(:admin) || current_user.id == @listing.user_id)
  # end

  def set_listings
    @listing = Listing.find(params[:id])
  end

  def listing_params
    return params.require(:listing).permit(:title, :price, :description, :user_id)
  end
end