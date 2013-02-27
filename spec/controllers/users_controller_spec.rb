require 'spec_helper'

describe UsersController do

  subject {response}

  describe "GET 'new'" do
    before {get 'new'}
    it {should be_success}
    it {should render_template 'new'}

  end

  describe "POST 'create'" do
    before {post :create}
    it {should be_success}
  end


end
