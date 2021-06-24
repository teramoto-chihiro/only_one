class PhotosController < ApplicationController
  before_action :authenticate_user!, only: %i[new create]

  def show
    @photo = Photo.find(params[:id])
    @comment = Comment.new
    @like = @photo.likes.find_by(user_id: current_user.id)
  end

  def new
    @photo = current_user.photos.new
  end

  def create
    @photo = current_user.photos.new(photo_params)

    if @photo.save
      redirect_to :root
    else
      render :new
    end
  end

  def destroy
    current_user.photos.find(params[:id]).destroy

    redirect_to [current_user]
  end


  private

  def photo_params
    params.require(:photo).permit(:caption, :image)
  end
end
