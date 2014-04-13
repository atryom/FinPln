class TransactionsController < ApplicationController
  before_action :set_transaction, only: [:show, :edit, :update, :destroy]
  before_action :check_current_book


  # GET /transactions
  # GET /transactions.json
  def index
    @full_summ = full_summ
    @accounts = current_book.accounts
    @fact_transactions = current_book.transactions.where(completed: true).order("fact_date ASC")

    Transaction.set_null_summ(current_book.book_full_summ, current_user)
    @plan_transactions = current_book.transactions.where(completed: false).order("plan_date ASC")
    #@plan_transactions = @plan_transactions.add_def_amount(@plan_transactions)
  end

  # GET /transactions/1
  # GET /transactions/1.json
  def show
  end

  # GET /transactions/new
  def new
    @transaction = Transaction.new
  end

  # GET /transactions/1/edit
  def edit
  end

  # POST /transactions
  # POST /transactions.json
  def create
    @transaction = current_book.transactions.build(transaction_params)
    #@transaction = Transaction.new(transaction_params)

    respond_to do |format|
      if @transaction.save
        format.html { redirect_to transactions_path, notice: 'Transaction was successfully created.' }
        format.json { render action: 'show', status: :created, location: @transaction }
      else
        format.html { render action: 'new' }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /transactions/1
  # PATCH/PUT /transactions/1.json
  def update
    respond_to do |format|
      if @transaction.update(transaction_params)
        format.html { redirect_to transactions_path, notice: 'Transaction was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transactions/1
  # DELETE /transactions/1.json
  def destroy
    @transaction.destroy
    respond_to do |format|
      format.html { redirect_to transactions_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def check_current_book
      if (current_book == nil)
        redirect_to welcome_index_path
      end
    end

    def set_transaction
      @transaction = Transaction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def transaction_params
      puts (">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>")
      puts params
      params[:transaction][:amount] = params[:transaction][:amount].gsub(",",".")
      if params[:transaction][:completed].eql?("0")
        params[:transaction][:plan_amount] = params[:transaction][:amount]
        params[:transaction][:plan_date] = params[:transaction][:date]
      else
        params[:transaction][:fact_amount] = params[:transaction][:amount]
        params[:transaction][:fact_date] = params[:transaction][:date]
      end
      params[:transaction].delete("amount")
      params[:transaction].delete("date")
      puts params
      puts (">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>")
      params.require(:transaction).permit(:name, :note, :amount, :date, :plan_amount, :plan_date, :fact_amount, :fact_date, :completed, :group_id)
    end
end
