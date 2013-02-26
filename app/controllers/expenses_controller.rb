class ExpensesController < ApplicationController
  def new
    @expense = Expense.new
  end

  def create
    @expense = Expense.new(params[:expense])
    if @expense.save
      flash[:success] = "Expense '#{@expense.name}' has been added!"
      redirect_to new_expense_path
    else
      render 'new'
    end
  end

  def index
    @expeses = Expense.all
  end


end
