class FixingFiledsToAllTables < ActiveRecord::Migration[6.0]
  def change
  	change_table :hotel_surveys do |t|

		t.remove 	:animal_acceptance_score
		t.remove 	:children_cup_score
		t.remove 	:coworking_score
		t.remove 	:parking_score
		t.remove 	:payed_parking_score
		t.remove 	:facilities_people_special_needs_score
		t.remove 	:wi_fi_free_score
		t.remove 	:wi_fi_payed_score
		t.remove 	:gym_score
		t.remove 	:archery_score
		t.remove 	:tree_climbing_score
		t.remove 	:boat_score
		t.remove 	:bike_score
		t.remove 	:bocce_ball_score
		t.remove 	:bowling_score
		t.remove 	:waterfall_score
		t.remove 	:kayak_score
		t.remove 	:horse_score
		t.remove 	:chariot_score
		t.remove 	:corral_score
		t.remove 	:day_use_score
		t.remove 	:soccer_score
		t.remove 	:official_football_score
		t.remove 	:golf_score
		t.remove 	:whirlpool_score
		t.remove 	:vegetable_garden_score
		t.remove 	:kids_club_score
		t.remove 	:massage_score
		t.remove 	:diving_score
		t.remove 	:climbing_mini_golf_score
		t.remove 	:pool_score
		t.remove 	:children_pool_score
		t.remove 	:natural_swimming_pool_score
		t.remove 	:thermic_pool_score
		t.remove 	:thermal_pool_score
		t.remove 	:playground_score
		t.remove 	:orchard_score
		t.remove 	:multisport_court_score
		t.remove 	:recreation_score
		t.remove 	:playroom_score
		t.remove 	:dry_sauna_score
		t.remove 	:steam_sauna_score
		t.remove 	:spa_score
		t.remove 	:stand_up_padle_score
		t.remove 	:sneakers_score
		t.remove 	:zip_line_score
		t.remove 	:volleyball_score
		t.remove 	:wine_house_score
		t.remove 	:pub_score
		t.remove 	:restaurant_score
		t.remove 	:auto_Rental_score
		t.remove 	:concierge_score
		t.remove 	:laundry_score
		t.remove 	:valet_parking_score
		t.remove 	:messenger_score
		t.remove 	:room_service_score
		t.remove 	:all_time_room_service_score #(24 horas de serviços)
		t.remove 	:beach_service_score			
		t.remove 	:air_conditioning_score
		t.remove 	:split_air_conditioning_score
		t.remove 	:heating_score
		t.remove 	:boxing_bed_score
		t.remove 	:conventional_bed_score
		t.remove 	:equipped_kitchen_score
		t.remove 	:minibar_score	
		t.remove 	:iPad_score
		t.remove 	:noise_window_score
		t.remove 	:fireplace_score
		t.remove 	:work_table_score
		t.remove 	:TV_score
		t.remove 	:lcd_tv_score
		t.remove 	:smart_tv_score
		t.remove 	:cable_tv_score
		t.remove 	:bathroom_electric_shower_score
		t.remove 	:bathroom_chiveiro_gas_solar_score
		t.remove 	:bathroom_sink_mixer_tap_score
		t.remove 	:bathroom_hair_dryer_score


		t.decimal	:structure_score
		t.decimal	:recreation_score
		t.decimal	:social_score		
		t.decimal	:services_score		
		t.decimal	:accomodation_score			
		t.decimal	:acomodation_score	
		t.decimal	:final_score		
		t.text		:final_comment	

		t.string 	:recreation_items,  array:true, default: []
		t.string 	:social_items,  array:true, default: []
		t.string 	:structure_items,  array:true, default: []
		t.string 	:services_items,  array:true, default: []
		t.string 	:accommodation_items,  array:true, default: []
		
	end


  end
end
