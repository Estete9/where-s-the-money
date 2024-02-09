class PagesController < ApplicationController
  skip_before_action :authenticate_user!
  def splash
    redirect_to categories_path if user_signed_in?
  end
end
