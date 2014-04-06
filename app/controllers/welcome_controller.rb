class WelcomeController < ApplicationController
  def index
    @book = current_book
    @devise = Devise
    if user_signed_in?
      @user = current_user
    end

  end
end
