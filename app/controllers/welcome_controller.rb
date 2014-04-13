class WelcomeController < ApplicationController
  def index
    session[:book_id] = nil
    @devise = Devise
    if user_signed_in?
      @user = current_user
      @ubooks = @user.user_books

    end

  end
end
