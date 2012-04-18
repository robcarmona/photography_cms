class AdminUsersController < ApplicationController
  
  layout 'admin'

  before_filter :confirm_logged_in
  
  def index
    list
    render('list')
  end
  
  def list
    @admin_users = AdminUser.sorted
  end
  
  def list_private_users
    @private_users = PrivateUser.sorted
  end

  def new
    @admin_user = AdminUser.new
  end
  
  def new_private_user
    @private_user = PrivateUser.new
  end
  
  def create
    @admin_user = AdminUser.new(params[:admin_user])
    if @admin_user.save
      flash[:notice] = 'Admin user created.'
      redirect_to(:action => 'list')
    else
      render("new")
    end
  end
  
  def create_private_user
    @private_user = PrivateUser.new(params[:private_user])
    if @private_user.save
      flash[:notice] = 'Private user created.'
      redirect_to(:action => 'list_private_users')
    else
      render("new_private_user")
    end
  end

  def edit
    @admin_user = AdminUser.find(params[:id])
  end
  
  def edit_private_user
    @private_user = PrivateUser.find(params[:id])
  end
  
  def update
    @admin_user = AdminUser.find(params[:id])
    if @admin_user.update_attributes(params[:admin_user])
      flash[:notice] = 'Admin user updated.'
      redirect_to(:action => 'list')
    else
      render("edit")
    end
  end
  
  def update_private_user
    @private_user = PrivateUser.find(params[:id])
    if @private_user.update_attributes(params[:private_user])
      flash[:notice] = 'Private user updated.'
      redirect_to(:action => 'list_private_users')
    else
      render("edit_private_user")
    end
  end

  def delete
    @admin_user = AdminUser.find(params[:id])
  end
  
  def delete_private_user
    @private_user = PrivateUser.find(params[:id])
  end

  def destroy
    AdminUser.find(params[:id]).destroy
    flash[:notice] = "Admin user destroyed."
    redirect_to(:action => 'list')
  end
  
  def destroy_private_user
    PrivateUser.find(params[:id]).destroy
    flash[:notice] = "Private user destroyed."
    redirect_to(:action => 'list_private_users')
  end

end