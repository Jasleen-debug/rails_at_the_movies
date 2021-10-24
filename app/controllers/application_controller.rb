class ApplicationController < ActionController::Base
  helper_method :cms_pages
  def cms_pages
    Page.all
  end
end
