class UserBooksController < ApplicationController
  before_action :set_user_book, only: [:show, :edit, :update, :destroy]

  # GET /user_books
  # GET /user_books.json
  def index
    @user_books = UserBook.all
  end

  # GET /user_books/1
  # GET /user_books/1.json
  def show
  end

  # GET /user_books/new
  def new
    @user_book = UserBook.new
  end

  # GET /user_books/1/edit
  def edit
  end

  # POST /user_books
  # POST /user_books.json
  def create
    @user_book = UserBook.new(user_book_params)

    respond_to do |format|
      if @user_book.save
        format.html { redirect_to @user_book, notice: 'User book was successfully created.' }
        format.json { render action: 'show', status: :created, location: @user_book }
      else
        format.html { render action: 'new' }
        format.json { render json: @user_book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_books/1
  # PATCH/PUT /user_books/1.json
  def update
    respond_to do |format|
      if @user_book.update(user_book_params)
        format.html { redirect_to @user_book, notice: 'User book was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user_book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_books/1
  # DELETE /user_books/1.json
  def destroy
    @user_book.destroy
    respond_to do |format|
      format.html { redirect_to user_books_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_book
      @user_book = UserBook.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_book_params
      params.require(:user_book).permit(:user_id, :book_id)
    end
end
