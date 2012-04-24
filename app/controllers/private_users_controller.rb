class PrivateUsersController < ApplicationController
  layout 'admin'

  before_filter :confirm_logged_in
  
  def index
    list
    render('list')
  end
  
  def list
    @private_user = PrivateUser.find_by_username(session[:username])
    @private_pictures = PrivatePicture.where(:private_user_id => @private_user.id)
  end

  def delete
    @private_picture = PrivatePicture.find(params[:id])
  end

  def destroy
    PrivatePicture.find(params[:id]).destroy
    flash[:notice] = "Private picture destroyed."
    redirect_to(:action => 'list')
  end

end
