class CreateHotelSurveys < ActiveRecord::Migration[6.0]
	def change
		create_table :hotel_surveys do |t|

			t.datetime 	:survey_date
			t.text 			:final_comments
			t.decimal 	:final_rate 
			t.decimal 	:location_score
			t.decimal 	:circulation_score
			t.decimal 	:conservation_score
			t.decimal 	:animal_acceptance_score
			t.decimal 	:children_cup_score
			t.decimal 	:coworking_score
			t.decimal 	:parking_score
			t.decimal 	:payed_parking_score
			t.decimal 	:facilities_people_special_needs_score
			t.decimal 	:wi_fi_free_score
			t.decimal 	:wi_fi_payed_score
			t.decimal 	:gym_score
			t.decimal 	:archery_score
			t.decimal 	:tree_climbing_score
			t.decimal 	:boat_score
			t.decimal 	:bike_score
			t.decimal 	:bocce_ball_score
			t.decimal 	:bowling_score
			t.decimal 	:waterfall_score
			t.decimal 	:kayak_score
			t.decimal 	:horse_score
			t.decimal 	:chariot_score
			t.decimal 	:corral_score
			t.decimal 	:day_use_score
			t.decimal 	:soccer_score
			t.decimal 	:official_football_score
			t.decimal 	:golf_score
			t.decimal 	:whirlpool_score
			t.decimal 	:vegetable_garden_score
			t.decimal 	:kids_club_score
			t.decimal 	:massage_score
			t.decimal 	:diving_score
			t.decimal 	:climbing_mini_golf_score
			t.decimal 	:pool_score
			t.decimal 	:children_pool_score
			t.decimal 	:natural_swimming_pool_score
			t.decimal 	:thermic_pool_score
			t.decimal 	:thermal_pool_score
			t.decimal 	:playground_score
			t.decimal 	:orchard_score
			t.decimal 	:multisport_court_score
			t.decimal 	:recreation_score
			t.decimal 	:playroom_score
			t.decimal 	:dry_sauna_score
			t.decimal 	:steam_sauna_score
			t.decimal 	:spa_score
			t.decimal 	:stand_up_padle_score
			t.decimal 	:sneakers_score
			t.decimal 	:zip_line_score
			t.decimal 	:volleyball_score
			t.decimal 	:wine_house_score
			t.decimal 	:pub_score
			t.decimal 	:restaurant_score
			t.decimal 	:auto_Rental_score
			t.decimal 	:concierge_score
			t.decimal 	:laundry_score
			t.decimal 	:valet_parking_score
			t.decimal 	:messenger_score
			t.decimal 	:room_service_score
			t.decimal 	:all_time_room_service_score #(24 horas de serviços)
			t.decimal 	:beach_service_score			
			t.decimal 	:air_conditioning_score
			t.decimal 	:split_air_conditioning_score
			t.decimal 	:heating_score
			t.decimal 	:boxing_bed_score
			t.decimal 	:conventional_bed_score
			t.decimal 	:equipped_kitchen_score
			t.decimal 	:minibar_score	
			t.decimal 	:iPad_score
			t.decimal 	:noise_window_score
			t.decimal 	:fireplace_score
			t.decimal 	:work_table_score
			t.decimal 	:TV_score
			t.decimal 	:lcd_tv_score
			t.decimal 	:smart_tv_score
			t.decimal 	:cable_tv_score
			t.decimal 	:bathroom_electric_shower_score
			t.decimal 	:bathroom_chiveiro_gas_solar_score
			t.decimal 	:bathroom_sink_mixer_tap_score
			t.decimal 	:bathroom_hair_dryer_score


			t.timestamps
		end
	end
end
