require 'spec_helper'

describe 'routes for Expenses' do
  it "should route 'new_expense_path' to Expenses#New" do
    expect(get: new_expense_path).to route_to(controller: 'expenses', action: 'new')
  end

  it "should route 'POST /expenses' to Expenses#create" do
    expect(post: '/expenses').to route_to(controller: 'expenses', action: 'create')
  end

  it "routes 'expenses_path' to Expenses#Index" do
    expect(get: expenses_path).to route_to(controller: 'expenses', action: 'index')
  end

  pending "should route 'expense_path(1)' to Expenses#show" do
    expect(post: expense_path(1)).to route_to(controller: 'expenses', action: 'show', id: 1)
  end

  it "should route 'edit_expense_path(1)' to Expenses#edit"

  it "should route 'PUT /expenses/1' to Expenses#update"

  it "should route 'DELETE /expenses/1' to Expenses#delete"

end