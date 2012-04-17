class PublicPicturesController < ApplicationController
  layout 'admin'

  before_filter :confirm_logged_in
  
  def index
    list
    render('list')
  end
  
  def list
   @public_pictures = PublicPicture.all
  end
   
  def new
   @public_picture = PublicPicture.new
  end
  
  def delete
   @public_picture = PublicPicture.find(params[:id])
  end
  def edit
   @public_picture = PublicPicture.find(params[:id])
  end
  
  def create
   @public_picture = PublicPicture.new(params[:public_picture])
   
   if @public_picture.save
     flash[:notice] = 'New public picture created'
     redirect_to(:action => 'list')
   else
     render("new")
   end
  end
  
  def destroy
    PublicPicture.find(params[:id]).destroy
    flash[:notice] = "Public Picture Deleted."
    redirect_to(:action => 'list')
  end
  
  def update
    @public_picture = PublicPicture.find(params[:id])
    if @public_picture.update_attributes(params[:public_picture])
      flash[:notice] = 'Public picture updated.'
      redirect_to(:action => 'list')
    else
      render("edit")
    end
  end
end
