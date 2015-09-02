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

post '/calculate' do
		# binding.pry

	case params[:operation]
		when "+" then answer = params[:num_one].to_i + params[:num_two].to_i 
		when "-" then answer = params[:num_one].to_i - params[:num_two].to_i 
		when "*" then answer = params[:num_one].to_i * params[:num_two].to_i 
		when "/" then answer = params[:num_one].to_i / params[:num_two].to_i 
	else 
		@error = 'Invalid calculator selected'
	end
	puts answer
	@answer = answer
	erb :simple
end

post '/calculateadvanced' do
		# binding.pry

	case params[:operation]
		when "square root" then answer = Math.sqrt(params[:num_one].to_i)
		when "power" then answer = params[:num_one].to_i ** params[:num_two].to_i 
	else 
		@error = 'Invalid calculator selected'
	end
	puts answer
	@advanced = answer
	erb :advanced
end

