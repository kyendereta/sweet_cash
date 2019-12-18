ENV['APP_ENV'] = 'test'

require_relative '../sweetcash'
require 'rspec'
require 'rack/test'

RSpec.describe 'Sweet Cash App' do 
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  it "shows the menu list" do
    get '/'
    expect(last_response.body).to match(/Menu/)
    expect(last_response.body).to match(/Deposit Cash/)
    expect(last_response.body).to match(/Withdraw Cash/)
    expect(last_response.body).to match(/Send Cash/)
    expect(last_response.body).to match(/Check Balance/)
    expect(last_response.body).to match(/Save with Sweet Cash/)
    expect(last_response.body).to match(/Previous Page/)
    expect(last_response.body).to match(/Feedback/)
    expect(last_response.body).to match(/Log Out/)
  end
end
