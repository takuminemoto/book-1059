class ImagesController < ApplicationController
  
  def new
    @image = Image.new
  end

  def create
    @image = PostImage.new(image_params)
    @image.user_id = current_user.id
    @image.save
    redirect_to images_path
  end

  def index
  end

  def show
  end

  def destroy
  end
  
  private

  def image_params
    params.require(:image).permit(:shop_name, :image, :caption)
  end
  
end
