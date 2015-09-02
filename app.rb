require 'sinatra'
require 'sinatra/reloader' if development?
require 'pry'
get '/' do
	@title = 'Home'
	erb :home
end

post '/navigate' do
	case params[:destination].downcase
	when 'simple' then redirect to '/simple'
	when 'advanced' then redirect to '/advanced'
	when 'bmi' then redirect to '/bmi'
	when 'mortgage' then redirect to '/mortgage'
	when 'trip' then redirect to '/trip'
	else 
		@error = 'Invalid calculator selected'
		erb :home
	end
end

get '/simple' do
	@title = 'Simple'
	erb :simple
end

get '/advanced' do
	@title = 'Advanced'
	erb :advanced
end

get '/bmi' do
	@title = 'Bmi'
	erb :bmi
end

get '/trip' do
	@title = 'Trip'
	erb :trip
end

get '/mortgage' do
	@title = 'Mortgage'
	erb :mortgage
end


