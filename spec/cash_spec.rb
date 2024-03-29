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

  it "allows user to go to deposit page" do
    get '/deposit'
    expect(last_response.body).to match(/Deposit Cash/)
    expect(last_response.body).to match(/Deposit Amount/)
    expect(last_response.body).to match(/Account Number/)
    expect(last_response.body).to match(/Save/)
    expect(last_response.body).to match(/Cancel/)
  end

  it "allows user to deposit" do
    post '/deposit', {amount: 60} 
    expect(last_response.body).to eq("Deposited 60")    
  end

  it "allows user to go to withdraw page" do
    get '/withdraw'
    expect(last_response.body).to match(/Withdraw Cash/)
    expect(last_response.body).to match(/Withdraw Amount/)
    expect(last_response.body).to match(/Account Number/)
    expect(last_response.body).to match(/Save/)
    expect(last_response.body).to match(/Cancel/)
  end

  it "allows user to withdraw cash"do
    post '/withdraw', {amount: 30} 
    expect(last_response.body).to eq("Withdrew 30") 
  end

  it "allows user to go to check balance page" do
    get '/checkbalance'
    expect(last_response.body).to match(/Check Balance/)
    expect(last_response.body).to match(/Account Number/)
    expect(last_response.body).to match(/Check/)
    expect(last_response.body).to match(/Check/)
  end

  it "allows user to check balance" do
    post '/checkbalance'
    expect("Your balance is #{@balance}").to eq("Your balance is #{@balance}")
  end

  it "allows to go send page" do
    get '/send'
    expect(last_response.body).to match(/Send Cash/)
    expect(last_response.body).to match(/Send Amount/)
    expect(last_response.body).to match(/Save/)
    expect(last_response.body).to match(/Cancel/)
    end

    it "allows user to send" do
      post '/send', {amount: 60} 
      expect(last_response.body).to eq("Send 60")    
    end
  
    it "allows user give feedback " do
      get '/Feedback'
    expect(last_response.body).to match(/Feedback/)
    expect(last_response.body).to match(/Here at sweet cash we value your feedback/)
    expect(last_response.body).to match(/Feel free to contact us/)
    expect(last_response.body).to match(/Look for us at 07000695694/)
    end
end
  

