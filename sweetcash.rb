require 'sinatra'
require 'erb'

get '/' do
    
    erb :menu
end

get '/deposit' do
    erb :deposit
end

post '/deposit' do
  "Deposited #{params[:amount]}"
end

get '/withdraw' do
  erb :withdraw
end

post '/withdraw' do
  "Withdrew #{params[:amount]}"
end

get '/checkbalance' do
  erb :checkbalance
end

post '/checkbalance' do
 "Your balance is #{@balance}"
end

__END__
@@menu
<h1>Menu</h1>
<ul>
<li>Deposit Cash</li>
<li>Withdraw Cash</li>
<li>Send Cash</li>
<li>Check Balance</li>
<li>Save with Sweet Cash</li>
<li>Previous Page</li>
<li>Feedback</li>
<li>Log Out</li>
</ul>

@@deposit
<h1>Deposit Cash</h1>
<body>
<form  method="post" target="_blank">
  Deposit Amount: <input type="number"><br>
  Account Number: <input type="number"><br>
  <input type="submit" value="Save">
  <input type="submit" value="Cancel">
</form>
</body>

@@withdraw
<h1>Withdraw Cash</h1>
<form  method="post" target="_blank">
  Withdraw Amount: <input type="number"><br>
  Account Number: <input type="number"><br>
  <input type="submit" value="Save">
  <input type="submit" value="Cancel">
</form>
</body>

@@checkbalance
<h1>Check Balance</h1>
<form  method="post" target="_blank">
  Account Number: <input type="number"><br>
  <input type="submit" value="Check">
  <input type="submit" value="Cancel">
</form>
</body>
