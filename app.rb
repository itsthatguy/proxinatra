require 'sinatra'
require 'sinatra/cross_origin'
require 'rest-client'

configure do
  set :port, 4000

  enable :cross_origin
  set :allow_origin, :any
  set :allow_methods, [:get, :post, :options]
  set :allow_credentials, true
end


base_url = "http://some-url.com"

before '/*' do
end

get "/hotels/:id/rates" do
  RestClient.get "#{base_url}/path?some=THING&other=THINGS", :content_type => :json
end

get "/hotels/:id" do
  RestClient.get "#{base_url}/path/to?some=THING&other=THINGS", :content_type => :json
end
