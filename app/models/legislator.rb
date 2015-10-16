require_relative '../../db/config.rb'

class Legislator < ActiveRecord::Base

	def self.find_senators_by_state(state)
		puts "Senators"
		senators =  self.where("state = ? AND title = ?" , state , "Sen")
		senators.each do |senator|
			puts "#{senator.firstname} #{senator.lastname} (#{senator.party})"
		end
	end

	def self.find_reps_by_state(state)
		puts "Representatives"
		reps = self.where("state = ? AND title = ?", state, "Rep")
		reps.each do |rep|
			puts "#{rep.firstname} #{rep.lastname} (#{rep.party})"
		end
	end

	def self.find_by_state(state)	
		self.find_senators_by_state(state)
		self.find_reps_by_state(state)
	end

	def self.find_senators_by_party(party)
		puts "Senators"
		senators =  self.where("party = ? AND title = ?" , party , "Sen")
		senators.each do |senator|
			puts "#{senator.firstname} #{senator.lastname} (#{senator.party})"
		end
	end

	def self.find_representatives_by_party(party)
		puts "Representatives"
		reps =  self.where("party = ? AND title = ?" , party , "Rep")
		reps.each do |rep|
			puts "#{rep.firstname} #{rep.lastname} (#{rep.party})"
		end
	end

	def self.find_info_by_firstname(first_name)
		puts "Information:"
		person = self.find_by firstname: first_name
		
			puts "name: #{person.title}. #{person.firstname} #{person.lastname}"
			puts "phone: #{person.phone}"
			puts "fax: #{person.fax}"
			puts "website: #{person.website}"
			puts "email: #{person.webform}"
			puts "party: #{person.party}"
			puts "gender: #{person.gender}"
			puts "birthdate: #{person.birthdate}"
			puts "twitter id: #{person.twitter_id}"

	end

	def self.find_active_status_by_firstname(first_name)
		person = self.find_by firstname: first_name
		puts "#{person.title}. #{person.firstname} #{person.lastname} in-office status"
		puts "--------------------------------"
		if person.in_office			
			puts "ACTIVE"
		else
			puts "INACTIVE"
		end
	end


	def self.find_numbers_by_gender(gender)
		senators = self.where("gender = ? AND title = ?", gender, "Sen")
		all_senators = self.where("title = ?", "Sen")
		reps = self.where("gender = ? AND title = ?", gender, "Rep")
		all_reps = self.where("title = ?", "Rep")
		if gender == "M"
			puts "Senators"
			puts "Male Senators: #{senators.count} (#{((senators.count/all_senators.count.to_f).round(2)*100).round}%)"
			puts "Representatives"
			reps  = self.where("gender = ? AND title = ?", gender, "Rep")
			puts "Male Representatives: #{reps.count} (#{((reps.count/all_reps.count.to_f).round(2)*100).round}%)"
		elsif gender == "F"
			puts "Senators"
			puts "Female Senators: #{senators.count} (#{((senators.count/all_senators.count.to_f).round(2)*100).round}%)"
			puts "Representatives"
			reps  = self.where("gender = ? AND title = ?", gender, "Rep")
			puts "Female Representatives: #{reps.count} (#{((reps.count/all_reps.count.to_f).round(2)*100).round}%)"
		end		
	end

	def self.states_arranged_by_activeness_of_congress_people
		#return array of legislator objects order by amount of 

	end

	def self.numbers_of_congress_people
		senators = self.where("title = ?", "Sen")
		puts "Senators: #{senators.count}"
		reps = self.where("title = ?", "Rep")
		puts "Representatives: #{reps.count}"
	end

	def self.delete_inactive
		self.delete_all(in_office: false)
		Legislator.numbers_of_congress_people
	end

	
end
