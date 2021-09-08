class AddFieldAllAdminTables < ActiveRecord::Migration[6.0]
  def change
  	add_column :accommodation_items, :order, :Integer
  	add_column :accommodation_types, :order, :Integer
  	add_column :commforts, :order, :Integer
  	add_column :environments, :order, :Integer
  	add_column :form_payments, :order, :Integer
  	add_column :icons, :order, :Integer
  	add_column :lodgings, :order, :Integer
  	add_column :payment_types, :order, :Integer
  	add_column :price_ranges, :order, :Integer
  	add_column :recreation_areas, :order, :Integer
  	add_column :rules, :order, :Integer
  	add_column :services, :order, :Integer
  	add_column :social_items, :order, :Integer
  	add_column :structures, :order, :Integer
  end
end
