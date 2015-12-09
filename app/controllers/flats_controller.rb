class FlatsController < ApplicationController
 before_action :set_flat, only: [:show, :edit]


  def index
    @flats = Flat.all
  end

  def show
    @photos = @flat.photos
  end

  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(flat_params)

    if @flat.save
      if params[:image]
        params[:image].each do |image|
          @flat.photos.create(image: image)
        end
      end
      flash[:notice] = "Your flat was created."
      redirect_to flat_path(@flat.id)
    else
      flash[:notice] = "Oops something went wrong"
      render "new"
    end
  end

  def edit
  end

  def update
    if @flat.update(flat_params)
      flash[:notice] = "Your flat info was updated."
      redirect_to flat_path(@flat)
    else
      flash[:notice] = "Oops something went wrong."
      render :show
    end
  end


  def destroy
  end




private

  def flat_params
    # (:todo) is the class, (:title) is the attribute
    params.require(:flat).permit(:title, :description, :address, :city, :furnished, :picture)
  end

  def set_flat
    @flat = Flat.find(params[:id])
  end

  end
