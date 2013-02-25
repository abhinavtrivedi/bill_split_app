require 'spec_helper'

describe "Expenses" do

  subject {page}

  describe "New Expense" do
    before {visit '/expenses/new'}

    it {should have_selector 'title', text: page_title('New Expense')}
    it {should have_selector 'h1', text: 'New Expense'}

    context "form" do
      it {should have_xpath "//input[@placeholder='Expense Name' and @id='expense_name']"}

      it {should have_xpath "//input[@placeholder='Expense Amount' and @id='expense_amount']"}

      it {should have_button 'Add Expense'}
    end
  end
end
