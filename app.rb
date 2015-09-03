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

post '/bmi' do
		# binding.pry

	answer = ((params[:weight].to_i / params[:height].to_f)/params[:height].to_f)
	puts answer
	@bmi = answer.round
	erb :bmi
end

post '/mortgage' do
		# binding.pry
		interest = ((params[:interest].to_f / 100)/12)
		principal = params[:principal].to_f
		months = params[:months].to_i

	answer = principal * (interest*(1+interest)/(1 + interest))
	puts answer
	@mortgage = answer.round
	erb :mortgage
end

post '/trip' do
		
		mpg = params[:mpg].to_i
		speed = params[:speed].to_i
		distance = params[:distance].to_i
		fuel = params[:fuel].to_i

		time = distance / speed.to_f
binding.pry
		actual_time = (time*100).round/100.to_f
		# actual_mpg = (speed > 60) ? (mpg-speed)*2.to_f | mpg
		
		cost = (distance / actual_mpg * fuel).to_f
		actual_cost = (cost * 100) / 100.round

	@tripTime = actual_time
	@tripCost = actual_cost
	erb :trip
end

