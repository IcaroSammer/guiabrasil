# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_06_09_025945) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accommodation_items", force: :cascade do |t|
    t.string "name"
    t.boolean "active"
    t.string "business_establishment", default: [], array: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "order"
  end

  create_table "accommodation_sizes", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "number_of_guest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "active"
  end

  create_table "accommodation_types", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.boolean "active"
    t.string "business_establishment", default: [], array: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "special"
    t.integer "order"
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.string "phone_number"
    t.index ["confirmation_token"], name: "index_admins_on_confirmation_token", unique: true
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_admins_on_unlock_token", unique: true
  end

  create_table "booking_policies", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.boolean "active"
    t.string "business_establishment", default: [], array: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "business_establishments", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.boolean "active"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "chefs", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.boolean "active"
    t.string "business_establishment", default: [], array: true
    t.string "service_time"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "restaurant_id"
    t.string "main_courses", default: [], array: true
    t.index ["restaurant_id"], name: "index_chefs_on_restaurant_id"
  end

  create_table "cities", force: :cascade do |t|
    t.text "text_apresantation"
    t.text "best_experiences", default: "{}"
    t.string "best_time"
    t.string "how_find"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "establishment_id"
    t.string "city"
    t.string "state"
    t.string "country"
    t.string "category"
    t.string "differentials", default: [], array: true
    t.string "biome"
    t.string "region"
    t.boolean "special"
    t.text "perfect_day_remarks"
    t.boolean "perfect_day"
    t.index ["establishment_id"], name: "index_cities_on_establishment_id"
  end

  create_table "commfort_classifications", force: :cascade do |t|
    t.string "name", default: ""
    t.integer "number_of_star"
    t.boolean "active", default: false
    t.string "business_establishment", default: [], array: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "commforts", force: :cascade do |t|
    t.string "name", default: ""
    t.boolean "active", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "business_establishment", default: [], array: true
    t.integer "order"
  end

  create_table "customers", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["confirmation_token"], name: "index_customers_on_confirmation_token", unique: true
    t.index ["email"], name: "index_customers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_customers_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_customers_on_unlock_token", unique: true
  end

  create_table "enterprises", force: :cascade do |t|
    t.string "name"
    t.string "nick_name"
    t.string "cnpj"
    t.date "foundation_date"
    t.string "economic_activity_code"
    t.string "economic_activity_description"
    t.string "company_size"
    t.string "secondary_economic_activities_code"
    t.string "secondary_economic_activities_description"
    t.string "legal_nature_code"
    t.string "legal_nature_description"
    t.string "address"
    t.string "address_complement"
    t.string "address_number"
    t.string "neighbohood"
    t.string "zip_code"
    t.string "city"
    t.string "state"
    t.string "country_code"
    t.string "country"
    t.string "phone_number"
    t.string "mobile_phone_number"
    t.boolean "active"
    t.string "email"
    t.string "enterprise_type"
    t.boolean "group_company"
    t.boolean "business_partner"
    t.string "user_updater", default: [], array: true
    t.string "dates_updater", default: [], array: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cnpj"], name: "index_enterprises_on_cnpj", unique: true
  end

  create_table "environments", force: :cascade do |t|
    t.string "name"
    t.boolean "active"
    t.string "business_establishment", default: [], array: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "order"
  end

  create_table "establishment_opening_hours", force: :cascade do |t|
    t.string "day_of_week"
    t.string "hour_opening"
    t.string "hour_close"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "restaurant_id"
    t.index ["restaurant_id"], name: "index_establishment_opening_hours_on_restaurant_id"
  end

  create_table "establishment_terms", force: :cascade do |t|
    t.string "name"
    t.boolean "active"
    t.text "description"
    t.string "type_term"
    t.datetime "publication_date"
    t.datetime "inactivated_date"
    t.string "publicated_by"
    t.string "link_term"
    t.string "user_updater", default: [], array: true
    t.string "dates_updater", default: [], array: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "establishments", force: :cascade do |t|
    t.integer "environment"
    t.integer "comfort_classification"
    t.text "final_comment"
    t.string "contact"
    t.string "email"
    t.string "address"
    t.string "name"
    t.integer "final_note"
    t.string "geolocalization"
    t.string "reference_point"
    t.string "owner"
    t.string "telephone"
    t.string "reservation_phone"
    t.text "comments"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "active"
    t.string "business_establishment"
    t.string "cep"
    t.string "street"
    t.string "complement"
    t.string "number_address"
    t.string "city"
    t.string "state"
    t.string "nationality"
    t.string "cnpj"
    t.string "facebook"
    t.string "linkedin"
    t.string "twitter"
    t.string "instagram"
    t.string "website"
    t.string "neighborhood"
    t.string "establishment_open_and_close"
  end

  create_table "form_payments", force: :cascade do |t|
    t.string "name"
    t.boolean "active"
    t.string "business_establishment", default: [], array: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "order"
  end

  create_table "furnitures", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "dimension"
    t.string "rooms", default: [], array: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "hotel_surveys", force: :cascade do |t|
    t.datetime "survey_date"
    t.text "final_comments"
    t.integer "final_rate"
    t.integer "location_score"
    t.integer "circulation_score"
    t.integer "conservation_score"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "active"
    t.bigint "hotel_id"
    t.integer "structure_score"
    t.integer "recreation_score"
    t.integer "social_score"
    t.integer "services_score"
    t.integer "accomodation_score"
    t.integer "acomodation_score"
    t.integer "final_score"
    t.text "final_comment"
    t.string "recreation_items", default: [], array: true
    t.string "social_items", default: [], array: true
    t.string "structure_items", default: [], array: true
    t.string "services_items", default: [], array: true
    t.string "accommodation_items", default: [], array: true
    t.text "structure_score_comments"
    t.text "recreation_score_comments"
    t.text "social_score_comments"
    t.text "services_score_comments"
    t.text "accomodation_score_comments"
    t.text "acomodation_score_comments"
    t.text "circulation_score_comments"
    t.text "conservation_score_comments"
    t.text "location_score_comments"
    t.index ["hotel_id"], name: "index_hotel_surveys_on_hotel_id"
  end

  create_table "hotels", force: :cascade do |t|
    t.datetime "opening_date"
    t.datetime "major_renovation_date"
    t.integer "number_of_employees"
    t.decimal "confort_rating"
    t.text "classification_order"
    t.string "price_range"
    t.string "environment"
    t.string "special_accommodation_type"
    t.boolean "has_convention_rooms"
    t.integer "number_of_convetion_rooms"
    t.integer "total_capacity_convention_romms"
    t.boolean "has_bars"
    t.integer "number_of_bars"
    t.boolean "has_restaurants"
    t.integer "number_of_restaurants"
    t.integer "number_of_accommodations"
    t.string "type_of_accomodation", default: [], array: true
    t.string "rules", default: [], array: true
    t.text "sustainable_actions"
    t.text "thecnological_innivations"
    t.decimal "final_score_evaluation"
    t.boolean "active"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "establishment_id"
    t.string "accommodation_item", default: [], array: true
    t.string "enviroment", default: [], array: true
    t.string "recreation_area", default: [], array: true
    t.string "structure", default: [], array: true
    t.string "service", default: [], array: true
    t.string "social_item", default: [], array: true
    t.string "rule", default: [], array: true
    t.string "comfort", default: [], array: true
    t.string "lodging", default: [], array: true
    t.string "category"
    t.string "differentials", default: [], array: true
    t.string "payments_form", default: [], array: true
    t.string "meal_included_price", default: [], array: true
    t.string "booking_policies", default: [], array: true
    t.index ["establishment_id"], name: "index_hotels_on_establishment_id"
  end

  create_table "icons", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.boolean "active"
    t.string "business_establishment", default: [], array: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "order"
  end

  create_table "lodgings", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.boolean "active"
    t.string "business_establishment", default: [], array: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "order"
  end

  create_table "main_courses", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "ingredients", default: [], array: true
    t.string "business_establishment", default: [], array: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "active"
    t.bigint "restaurant_id"
    t.index ["restaurant_id"], name: "index_main_courses_on_restaurant_id"
  end

  create_table "occupations", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.boolean "active"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "payment_types", force: :cascade do |t|
    t.string "name"
    t.string "brand"
    t.string "business_establishment", default: [], array: true
    t.boolean "active"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "order"
  end

  create_table "price_ranges", force: :cascade do |t|
    t.decimal "range_init"
    t.decimal "range_end"
    t.string "description"
    t.string "business_establishment", default: [], array: true
    t.boolean "active"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "order"
  end

  create_table "profiles", force: :cascade do |t|
    t.string "name"
    t.string "mobile_phone_number"
    t.boolean "contact_by_whats_app"
    t.boolean "active"
    t.string "instagram"
    t.string "facebook"
    t.string "twitter"
    t.string "linkedin"
    t.string "user_type"
    t.string "cpf"
    t.string "rg_rne"
    t.string "nacionality"
    t.string "zip_code"
    t.string "address"
    t.string "neighbohood"
    t.string "address_complement"
    t.string "address_number"
    t.string "city"
    t.string "state"
    t.string "country"
    t.date "birthday"
    t.string "gender"
    t.bigint "customer_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cpf"], name: "index_profiles_on_cpf", unique: true
    t.index ["customer_id"], name: "index_profiles_on_customer_id"
  end

  create_table "publications", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.boolean "active"
    t.string "tag", default: [], array: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "hotel_id"
    t.bigint "establishment_id"
    t.index ["establishment_id"], name: "index_publications_on_establishment_id"
    t.index ["hotel_id"], name: "index_publications_on_hotel_id"
  end

  create_table "recreation_areas", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.boolean "active"
    t.string "business_establishment", default: [], array: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "order"
  end

  create_table "restaurant_surveys", force: :cascade do |t|
    t.integer "couvert"
    t.integer "starter_course"
    t.integer "presentation_course"
    t.integer "temperature"
    t.integer "quality"
    t.integer "baking"
    t.integer "harmony_ingredients"
    t.integer "seasoning"
    t.integer "final_sensation"
    t.integer "dessert"
    t.integer "final_sensation_meal"
    t.boolean "active"
    t.string "business_establishment", default: [], array: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "restaurant_id"
    t.text "couvert_comments"
    t.text "starter_course_comments"
    t.text "presentation_course_comments"
    t.text "temperature_comments"
    t.text "quality_comments"
    t.text "baking_comments"
    t.text "harmony_ingredients_comments"
    t.text "seasoning_comments"
    t.text "final_sensation_comments"
    t.text "dessert_comments"
    t.text "final_sensation_meal_comments"
    t.index ["restaurant_id"], name: "index_restaurant_surveys_on_restaurant_id"
  end

  create_table "restaurants", force: :cascade do |t|
    t.string "comment"
    t.integer "quant_start"
    t.integer "classification_order"
    t.time "star_hour"
    t.time "end_hour"
    t.boolean "active"
    t.string "business_establishment", default: [], array: true
    t.bigint "establishment_id"
    t.string "classification_comfort", default: [], array: true
    t.string "icon", default: [], array: true
    t.string "payment_type", default: [], array: true
    t.string "category"
    t.string "differentials", default: [], array: true
    t.string "payments_form", default: [], array: true
    t.string "environment", default: [], array: true
    t.string "price_range"
    t.string "week_days", default: [], array: true
    t.string "start_1", default: [], array: true
    t.string "start_2", default: [], array: true
    t.string "end_1", default: [], array: true
    t.string "end_2", default: [], array: true
    t.string "speciality"
    t.text "comment_hour"
    t.index ["establishment_id"], name: "index_restaurants_on_establishment_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.boolean "active"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "rules", force: :cascade do |t|
    t.string "name"
    t.boolean "active"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "business_establishment", default: [], array: true
    t.integer "order"
  end

  create_table "services", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.boolean "active"
    t.string "business_establishment", default: [], array: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "order"
  end

  create_table "social_items", force: :cascade do |t|
    t.string "name"
    t.boolean "active"
    t.string "business_establishment", default: [], array: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "order"
  end

  create_table "specialities", force: :cascade do |t|
    t.string "name"
    t.boolean "active"
    t.string "business_establishment", default: [], array: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "structures", force: :cascade do |t|
    t.string "name"
    t.boolean "active"
    t.string "business_establishment", default: [], array: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "order"
  end

  create_table "terms", force: :cascade do |t|
    t.string "name"
    t.boolean "active"
    t.text "description"
    t.string "type_term"
    t.datetime "publication_date"
    t.datetime "inactivated_date"
    t.string "publicated_by"
    t.string "link_term"
    t.string "user_updater", default: [], array: true
    t.string "dates_updater", default: [], array: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "tourist_attraction_surveys", force: :cascade do |t|
    t.datetime "survey_date"
    t.text "final_comments"
    t.decimal "final_rate"
    t.boolean "active"
    t.decimal "interest_socore"
    t.decimal "Sort_order_by_destination_score"
    t.decimal "shopping_score"
    t.decimal "events_score"
    t.decimal "cultural_centers_score"
    t.decimal "historical_buildings_score"
    t.decimal "strong_score"
    t.decimal "churches_score"
    t.decimal "museums_score"
    t.decimal "parks_score"
    t.decimal "state_parks_score"
    t.decimal "national_parks_score"
    t.decimal "thematic_parks_score"
    t.decimal "tours_score"
    t.decimal "beaches_score"
    t.decimal "beach_tents_score"
    t.decimal "adventure_tourism_score"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "interest_socore_comments"
    t.text "sort_order_by_destination_score_comments"
    t.text "shopping_score_comments"
    t.text "events_score_comments"
    t.text "cultural_centers_score_comments"
    t.text "historical_buildings_score_comments"
    t.text "strong_score_comments"
    t.text "churches_score_comments"
    t.text "museums_score_comments"
    t.text "parks_score_comments"
    t.text "state_parks_score_comments"
    t.text "national_parks_score_comments"
    t.text "thematic_parks_score_comments"
    t.text "tours_score_comments"
    t.text "beaches_score_comments"
    t.text "beach_tents_score_comments"
    t.text "adventure_tourism_score_comments"
    t.decimal "signage_score"
    t.string "signage_score_comments"
    t.decimal "conservation_score"
    t.string "conservation_score_comments"
    t.decimal "accessibility_score"
    t.string "accessibility_score_comments"
    t.decimal "local_tour_guides_score"
    t.string "local_tour_guides_score_comments"
    t.decimal "kindness_score"
    t.string "kindness_score_comments"
    t.decimal "beauty_score"
    t.string "beauty_score_comments"
    t.decimal "infrastructure_score"
    t.string "infrastructure_score_comments"
    t.decimal "historical_importance_score"
    t.string "historical_importance_score_comments"
    t.decimal "artistic_importance_score"
    t.string "artistic_importance_score_comments"
    t.decimal "architectural_importance_score"
    t.string "architectural_importance_score_comments"
    t.decimal "natural_importance_score"
    t.string "natural_importance_score_comments"
    t.decimal "cultural_importance_score"
    t.string "cultural_importance_score_comments"
    t.decimal "economic_importance_score"
    t.string "economic_importance_score_comments"
    t.bigint "tourist_attraction_id"
    t.index ["tourist_attraction_id"], name: "index_tourist_attraction_surveys_on_tourist_attraction_id"
  end

  create_table "tourist_attractions", force: :cascade do |t|
    t.string "comment"
    t.string "classification_order"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "establishment_id"
    t.boolean "active"
    t.string "category"
    t.string "differentials", default: [], array: true
    t.string "payments_form", default: [], array: true
    t.string "type_attraction"
    t.string "interest_score"
    t.decimal "price"
    t.time "start_hour"
    t.time "end_hour"
    t.string "price_comments"
    t.string "week_days", default: [], array: true
    t.string "start_1", default: [], array: true
    t.string "start_2", default: [], array: true
    t.string "end_1", default: [], array: true
    t.string "end_2", default: [], array: true
    t.index ["establishment_id"], name: "index_tourist_attractions_on_establishment_id"
  end

  create_table "type_attractions", force: :cascade do |t|
    t.string "name"
    t.boolean "active"
    t.string "business_establishment", default: [], array: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "type_terms", force: :cascade do |t|
    t.string "name"
    t.boolean "active"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.string "phone_number"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
end
