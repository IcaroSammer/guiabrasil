class Customer::BaseController < ApplicationController
	before_action :authenticate_customer! 
	def authenticated_user
    current_customer 
  end
end
