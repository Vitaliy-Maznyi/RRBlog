class BudgetController < ApplicationController
  def index
      @budgets = Budget.all
      @budget_sum = Budget.last_per_day
      @budget = Budget.new
  end

  def create
    @budget = Budget.new(budget_params)
    @budget.amount_per_day = Budget.summ(amounts_today) + @budget.amount
    @budget.save ? (redirect_to action: "index") : (render 'index')
  end

  def destroy
    @budget = Budget.find(params[:id])
    @budget.destroy
    redirect_to budget_path
  end

  private
  def budget_params
    params.require(:budget).permit(:amount, :source)
  end

  def amounts_today
    Budget.today.pluck(:amount)
  end
end
