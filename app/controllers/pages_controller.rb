class PagesController < ApplicationController
  # def index
  #   if user_signed_in?
  #     redirect_to posts_path
  #   end
  # end
  def index
    p current_user
  end
end
