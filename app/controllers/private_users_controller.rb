class PrivateUsersController < ApplicationController
    layout 'admin'

  before_filter :confirm_logged_in
  
  def index
    list
    render('list')

  end
  
  def list

  end

  def new

  end
  
  def create

  end

  def edit

  end
  
  def update

  end

  def delete

  end

  def destroy

  end

end
