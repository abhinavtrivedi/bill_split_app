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

    describe "Creating new expense" do
      let(:expense){FactoryGirl.build(:expense)}
      before do
        fill_in "expense_name", with: expense.amount
        fill_in "expense_amount", with: expense.amount
      end
      describe "without name" do
        before {fill_in "expense_name", with: ""}
        it "should not save the expense" do
          expect{click_button 'Add Expense'}.not_to change(Expense, :count)
        end
      end
      describe "without amount" do
        before {fill_in "expense_amount", with: ""}
        it "should not save the expense" do
          expect{click_button 'Add Expense'}.not_to change(Expense, :count)
        end
      end
      describe "with non-numeric amount" do
        before {fill_in "expense_amount", with: "non-numeric"}
        it "should not save the expense" do
          expect{click_button 'Add Expense'}.not_to change(Expense, :count)
        end
      end
      describe "with valid entried" do
        it "should save the expense" do
          expect{click_button 'Add Expense'}.to change(Expense, :count).by(1)
        end
      end
    end
  end

  describe "Show Expenses" do
    before do
      @expenses = FactoryGirl.create_list(:expense, 5)
      visit expenses_path
    end

    it {should have_selector 'title', text: page_title('My Expenses')}
    it {should have_selector 'h1', text: 'My Expenses'}
    it
    it "should display all expenses in the database" do
      @expenses.each do |expense|
        page.should have_content(expense.name)
        page.should have_content(expense.amount)
      end
    end
  end
end
