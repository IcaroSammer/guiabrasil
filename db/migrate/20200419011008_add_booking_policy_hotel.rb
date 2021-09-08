class AddBookingPolicyHotel < ActiveRecord::Migration[6.0]
  def change

  	add_column :hotels, :booking_policies, :string , array:true, default: []

  end
end
