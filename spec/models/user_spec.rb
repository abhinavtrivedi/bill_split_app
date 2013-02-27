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
  it {should respond_to :password_digest}
  it {should respond_to :password}
  it {should respond_to :password_confirmation}
  it {should respond_to :authenticate}

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
      context 'is already taken' do
        let(:dup_user) {FactoryGirl.build(:user, email: user.email)}
        subject {dup_user}
        it {should_not be_valid}
      end

      context 'is already taken with different case' do
        let(:user_with_email) {FactoryGirl.build :user}
        before do
          dup_user = user_with_email.dup
          dup_user.email = user_with_email.email.upcase
          dup_user.save
        end
        subject {user_with_email}
        it {should_not be_valid}
      end
    end

    context 'password' do
      context "is nil" do
        before {user.password = nil}
        it {should_not be_valid}
      end
      context 'is blank' do
        before {user.password = " "}
        it {should_not be_valid}
      end
      context 'is shorter than 8 characters' do
        before {user.password = "123456"}
        it {should_not be_valid}
      end
    end

    context 'password_confirmation' do
      context "is nil" do
        before {user.password_confirmation = nil}
        it {should_not be_valid}
      end
      context 'is blank' do
        before {user.password_confirmation = " "}
        it {should_not be_valid}
      end
    end

    context 'password and password_confirmation do not match' do
      before {user.password_confirmation = user.password.upcase}
      it {should_not be_valid}
    end

    context 'user signs in' do
      let(:valid_user) {User.find_by_email user.email}
      context 'with valid password' do
        it {should == valid_user.authenticate(user.password)}
      end

      context 'with invalid password' do
        let(:invalid_user){valid_user.authenticate("invalid_password")}
        it {should_not == invalid_user}
        specify {invalid_user.should be_false}
      end
    end

  end
end
