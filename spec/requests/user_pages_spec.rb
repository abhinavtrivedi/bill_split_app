require 'spec_helper'

describe 'UserPages' do
  subject {page}

  describe 'New User' do
    before {visit '/register'}

    it {should have_selector 'title', text: page_title('New User')}
    it {should have_selector 'h1', text: 'User Registration'}

    context 'registration form' do
      it {should have_field 'user_first_name'}
      it {should have_field 'user_last_name'}
      it {should have_field 'user_email'}
      it {should have_field 'user_password'}
      it {should have_field 'user_password_confirmation'}
      it {should have_button 'Register'}
    end
  end
end
