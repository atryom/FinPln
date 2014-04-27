#!/bin/env ruby
# encoding: utf-8
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  layout "application"
  public

  def current_book
    Book.find(session[:book_id])
  rescue ActiveRecord::RecordNotFound
    nil
  end

  def set_current_book (book)
    session[:book_id] = book.id
  end

  def get_today
    Date.today.to_s(:ru_datetime)
  end

  def full_summ
    sprintf("%0.02f р.", current_book.accounts.sum("amount"))
  end

  def need_4_good
    if user_signed_in? and current_user.property != nil
      sprintf("%0.02f р.",current_user.property.need_4_good)
    else
      sprintf("%0.02f р.", 0)
    end
  end
end
