class BaseController < ApplicationController
	def authenticated_user
    current_customer
  end
end
