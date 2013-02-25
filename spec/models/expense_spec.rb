require 'spec_helper'

describe Expense do

  let(:expense) {FactoryGirl.create(:expense)}

  subject {expense}

  it {should respond_to :name}
  it {should respond_to :amount}
  it {should be_valid}

  context 'when' do

    context 'name' do
      context 'is nil' do
        before {expense.name = nil}
        it {should_not be_valid}
      end
      context 'is blank' do
        before {expense.name = " "}
        it {should_not be_valid}
      end
    end

    context 'amount' do
      context 'is nil' do
        before {expense.amount = nil}
        it {should_not be_valid}
      end
      context 'is blank' do
        before {expense.amount = " "}
        it {should_not be_valid}
      end
      context 'is not numeric' do
        before {expense.amount = "foo"}
        it {should_not be_valid}
      end
    end

  end
end
