require 'sinatra'
require 'sqlite3'


get '/' do
  # "This is the home page."
  # connect to the database
  db = SQLite3::Database.open('store.db')

  # configure results to be returned as as an array of hashes instead of nested arrays
  db.results_as_hash = true

  # query the products table and print the result
  #puts "Database query results:"
  @fortunes = db.execute("SELECT id, fortune, impact FROM oracle;")

  # close database connection
  db.close
  erb :home
end

get '/success' do
  "Your payment has processed successfully."
end

post '/pay' do
  puts "The data sent to the /pay POST route is:"
  p params
  redirect '/success'
end
