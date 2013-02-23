# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  first_name :string(255)
#  last_name  :string(255)
#  email      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe User do

  subject {user}

  let(:user) {FactoryGirl.create :user}

  it {should respond_to :first_name}
  it {should respond_to :last_name}
  it {should respond_to :email}

  it {should be_valid}

  context 'when' do
    context 'first_name' do
      context "is nil" do
        before {user.first_name = nil}
        it {should_not be_valid}
      end
      context 'is blank' do
        before {user.first_name = " "}
        it {should_not be_valid}
      end
    end

    context 'last_name' do
      context 'is nil' do
        before {user.last_name = nil}
        it {should_not be_valid}
      end
      context 'is blank' do
        before {user.last_name = " "}
        it {should_not be_valid}
      end
    end

    context 'email' do
      context 'is nil' do
        before {user.email = nil}
        it {should_not be_valid}
      end
      context 'is blank' do
        before {user.email = " "}
        it {should_not be_valid}
      end
      pending 'is invalid' do
        it "should not be valid" do
          invalid_emails = %w[user@foo,com user_at_foo.org example.user@foo.
                     foo@bar_baz.com foo@bar+baz.com]
          invalid_emails.each do |invalid_email|
            user.email = invalid_email
            user.should_not be_valid
          end
        end
      end
    end


  end
end
