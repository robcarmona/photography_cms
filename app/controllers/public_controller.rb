class PublicController < ApplicationController
  
  layout 'public'
  before_filter :setup_navigation
  def index
    #intro text
  end

  def show
    @page = Page.where(:permalink =>params[:id],:visible => true).first
    redirect_to(:action => 'index') unless @page
  end

  def setup_navigation
    @subjects = Subject.visible.sorted
  end
  
  def gallery
    @public_pictures = PublicPicture.where(:visible => true).all
  end
  
  def about
    
  end
end
