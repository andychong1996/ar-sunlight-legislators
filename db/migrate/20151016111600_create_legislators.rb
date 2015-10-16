require_relative '../config'

class CreateLegislators < ActiveRecord::Migration
	def change
		create_table(:legislators) do |t|
			t.string :title, null: false
			t.string :firstname, null: false
			t.string :middlename
			t.string :lastname, null: false
			t.string  :name_suffix
			t.string :nickname
			t.string :party, null: false
			t.string :state, null: false
			t.string :district, null: false
			t.boolean :in_office
			t.string :gender
			t.string :phone
			t.string :fax
			t.string :website
			t.string :webform
			t.string :congress_office
			t.string :bioguide_id
			t.string :votesmart_id
			t.string :fec_id
			t.string :govtrack_id
			t.string :crp_id
			t.string :twitter_id
			t.string :congresspedia_url
			t.string :youtube_url
			t.string :facebook_id
			t.string :official_rss
			t.string :senate_class
			t.string :birthdate
		end	
	end
end