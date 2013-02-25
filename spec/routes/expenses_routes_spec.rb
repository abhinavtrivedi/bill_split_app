require 'spec_helper'

describe 'Routes for Expenses' do
  pending "should route 'new_expense_path' to expenses#new" do
    {get: '/expenses/new' }.should route_to controller: 'expenses', action: 'new'
  end
end