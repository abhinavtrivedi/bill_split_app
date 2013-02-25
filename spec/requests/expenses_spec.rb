require 'spec_helper'

describe "Expenses" do

  subject {page}

  describe "New Expense" do
    before {visit '/expenses/new'}

    it {should have_selector 'title', text: page_title('New Expense')}
    it {should have_selector 'h1', text: 'New Expense'}
  end
end
