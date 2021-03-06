require 'spec_helper'

describe ExpensesController do

  describe "GET #new" do
    it "responds successfully with an HTTP 200 status code" do
      get :new
      expect(response).to be_success
      expect(response.code).to eq("200")
    end

    it "renders the new template" do
      get :new
      expect(response).to render_template("new")
    end
  end

  describe "POST #create" do
    it "responds successfully with an HTTP 200 status code" do
      post :create
      expect(response).to be_success
      expect(response.code).to eq("200")
    end
  end

  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response.code).to eq("200")
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end

  end

end
