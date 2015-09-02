require 'sinatra'
require 'sinatra/reloader' if development?
require 'pry'



post '/calculate' do

	case params[:operation]
		binding.pry
		when '+' then num_one.to_i + num_two.to_i
		when '-' then num_one.to_i - num_two.to_i
		when '*' then num_one.to_i * num_two.to_i
		when '/' then num_one.to_i / num_two.to_i
	else 
		@error = 'Invalid calculator selected'
	end
	puts answer
	@answer = answer
	erb :simple
end



	