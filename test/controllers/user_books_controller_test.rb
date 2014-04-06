require 'test_helper'

class UserBooksControllerTest < ActionController::TestCase
  setup do
    @user_book = user_books(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_books)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_book" do
    assert_difference('UserBook.count') do
      post :create, user_book: { book_id: @user_book.book_id, user_id: @user_book.user_id }
    end

    assert_redirected_to user_book_path(assigns(:user_book))
  end

  test "should show user_book" do
    get :show, id: @user_book
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user_book
    assert_response :success
  end

  test "should update user_book" do
    patch :update, id: @user_book, user_book: { book_id: @user_book.book_id, user_id: @user_book.user_id }
    assert_redirected_to user_book_path(assigns(:user_book))
  end

  test "should destroy user_book" do
    assert_difference('UserBook.count', -1) do
      delete :destroy, id: @user_book
    end

    assert_redirected_to user_books_path
  end
end
