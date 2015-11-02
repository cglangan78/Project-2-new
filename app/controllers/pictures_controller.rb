class PicturesController < ApplicationController
  def index
    @pictures = Picture.all
  end

  def show
    @picture = Picture.find(params[:id])
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.new(picture_params)

    if @picture.save
      redirect_to('/')
    else
      render 'new'
    end
  end

  def destroy
    @picture = Picture.find(params[:id])

    if @picture.destroy
        redirect_to('/')
    else
      render 'show'
    end
  end


  def edit
    @picture = Picture.find(params[:id])
  end

  def update
    @picture = Picture.find(params[:id])

    if @picture.update(picture_params)
      redirect_to('/')
    else
      render 'show'
    end
  end



  private
  def picture_params
    params.require(:picture).permit([:url, :summary, :location])
  end
end
