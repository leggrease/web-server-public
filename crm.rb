<<<<<<< HEAD
require_relative 'contact'
require_relative 'rolodex'
require 'sinatra'

$rolodex= Rolodex.new 

#routes
get '/' do 
	@crm_app_name = "My CRM"
	erb :index
end

get '/contacts' do
	erb :contacts
end

get '/contacts/new' do
	erb :new_contact
end
=======
require 'sinatra'

get '/' do 
	"Main Menu"
end
>>>>>>> 004c5b68b1c1a759a6ae5f6cf7eb9c975904932a
