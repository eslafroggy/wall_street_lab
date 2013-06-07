require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'
require 'pry'


ActiveRecord::Base.establish_connection(
  :adapter => 'postgresql',
  :host => 'localhost',
  :username => 'clairepierce',
  :password => '',
  :database => 'stocks',
  :encoding => 'utf8'
)

require_relative "client"
require_relative "portfolio"
require_relative "stock"

%w(BUD
WOOF
BOOM
FIZ
LVB
ZEUS
CHUX
TAP
BID
LENS).each do |symbol|
  Stock.find_or_create_by_symbol(symbol)
end




get "/" do
  @clients = Client.all
  @portfolios = Portfolio.all
  erb :index
end

get "/clients/new" do #using REST syntax
  erb :new_client
end

post "/clients" do
  @client = Client.new(:name => params[:client_name])

  if @client.save
    redirect "/"
  else
    erb :new_client
  end
end

get "/clients/:client_id/portfolios" do
  @portfolios = Portfolio.all
  erb :new_portfolio
end

get "/clients/:client_id/portfolios/new" do
  erb :new_portfolio
end

post "/clients/:client_id/portfolios" do
  @portfolio = Portfolio.new(:name => params[:portfolio_name], :client_id => params[:client_id])
  if @portfolio.save
    redirect "/"
  else
    erb :new_portfolio
  end
end

get "/clients/:client_id/portfolios/:id/edit" do
  @portfolio = Portfolio.find(params[:id])
  erb :edit_portfolio
end

patch "/clients/:client_id/portfolios/:id" do 
  @portfolio = Portfolio.find(params[:id])
  if @portfolio.update_attributes(:name => params[:portfolio_name], :stock_ids => params[:stock_ids])
    redirect "/"
  else
    erb :edit_portfolio
  end
end













