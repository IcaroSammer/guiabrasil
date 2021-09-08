class AddFieldCommentOpenClose < ActiveRecord::Migration[6.0]
	def change
		add_column :restaurants,:comment_hour, :text
	end
end

