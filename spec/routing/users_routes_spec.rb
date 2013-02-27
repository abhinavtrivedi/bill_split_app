require 'spec_helper'

describe 'Routes for User' do
  it "should route '/register' to User#new" do
    expect(get: '/register').to route_to controller: 'users', action: 'new'
  end

  it "should route 'POST /users' to User#create" do
    expect(post: '/users').to route_to(controller: 'users', action: 'create')
  end
end