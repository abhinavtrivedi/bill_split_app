require 'spec_helper'

describe ExpensesController do

  describe "GET 'new'" do
    it "returns 'new' view" do
      get 'new'
      expect(response).to be_success
      expect(response).to render_template 'new'
    end
  end

end
