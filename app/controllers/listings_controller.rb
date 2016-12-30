class ListingsController < ApplicationController
    
before_action :find_listing, only: [:show, :edit, :update]
    
    def index
        @listing = Listing.all.paginate(:page => params[:page], per_page: 5)
    end
    
    def new
        @listing = Listing.new
    end
    
    def create
        @listing = current_user.listings.new(listing_params)
        if @listing.save
        redirect_to listings_path
        end
    end
    
    def show
        #  @booking = @listing.bookings.new
        @listing = Listing.find(params[:id])
    end
    
    def edit
    end
    
    


    def update
      if @listing.update(listing_params)
      flash[:success] = "Successfully updated the listing"
      redirect_to @listing
      else
      flash[:danger] = "Error updating listing"
      render :edit
      end
    end

    def find_listing
      @listing = Listing.find(params[:id])
    end
    
    
    
    def listing_params
        params.require(:listing).permit(:title, :description, :max_guests, :price, :address)
    end
    
    
end