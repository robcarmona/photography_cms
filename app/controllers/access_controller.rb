class AccessController < ApplicationController
  
  layout 'admin'
  before_filter :confirm_logged_in, :except => [:login, :login_private, :attempt_login, :logout,:logout_private,:attempt_login_private]
  def index
    menu
    render('menu')
  end
  def index_private
    menu
    render('menu_private')
  end
  def menu
    # display text & links
  end
  def menu_private
    # display text & links
  end

  def login
    # login form
  end
  
  def login_private

  end
  
  def attempt_login
    authorized_user = AdminUser.authenticate(params[:username], params[:password])
    if authorized_user
      session[:user_id] = authorized_user.id
      session[:username] = authorized_user.username
      session[:type] = "admin"
      flash[:notice] = "You are now logged in."
      redirect_to(:action => 'menu')
    else
      flash[:notice] = "Invalid username/password combination."
      redirect_to(:action => 'login')
    end
    
  end
  
   def attempt_login_private
    authorized_user = PrivateUser.authenticate(params[:username], params[:password])
    if authorized_user
      session[:user_id] = authorized_user.id
      session[:username] = authorized_user.username
      session[:type] = "private"
      flash[:notice] = "You are now logged in."
      redirect_to(:action => 'menu_private')
    else
      flash[:notice] = "Invalid username/password combination."
      redirect_to(:action => 'login_private')
    end
  end
  
  def logout_private
    session[:user_id] = nil
    session[:username] = nil
    session[:type] = nil
    flash[:notice] = "You have been logged out."
    redirect_to(:action => "login_private")
  end
  
  def logout
    session[:user_id] = nil
    session[:username] = nil
    session[:type] = nil
    flash[:notice] = "You have been logged out."
    redirect_to(:action => "login")
  end


end

