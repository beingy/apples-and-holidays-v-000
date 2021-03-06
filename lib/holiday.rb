require 'pry'

def second_supply_for_fourth_of_july(holiday_hash)
  # binding.pry
  holiday_hash[:summer][:fourth_of_july][1]
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  # holiday_hash is identical to the one above
  # add the second argument, which is a supply, to BOTH the
  # Christmas AND the New Year's arrays
  holiday_hash[:winter].each { |holidays, supplies| supplies << supply }
end

def add_supply_to_memorial_day(holiday_hash, supply)
  # again, holiday_hash is the same as the ones above
  # add the second argument to the memorial day array
  holiday_hash[:spring][:memorial_day] << supply
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  # code here
  # remember to return the updated hash
  holiday_hash[season][holiday_name] = supply_array
  holiday_hash
end

def all_winter_holiday_supplies(holiday_hash)
  # return an array of all of the supplies that are used in the winter season
  holiday_hash[:winter].values.flatten
end

def all_supplies_in_holidays(holiday_hash)
  # iterate through holiday_hash and print items such that your readout resembles:
  # Winter:
  #   Christmas: Lights, Wreath
  #   New Years: Party Hats
  # Summer:
  #   Fourth Of July: Fireworks, BBQ
  # etc.
  holiday_hash.each do |season, holiday_data_hash|
    puts "#{season.to_s.capitalize}:"
    holiday_data_hash.each do |holiday_value, supplies_array|
      format_holiday_value = holiday_value.to_s.split("_")
      format_holiday_value.each {|word| word.capitalize!}
      puts "  #{format_holiday_value.join(" ")}: #{supplies_array.join(", ")}"
    end
  end
end

def all_holidays_with_bbq(holiday_hash)
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"
  bbq_holidays = []
  holiday_hash.each do |season, holiday_data_hash|
    holiday_data_hash.each do |holiday, supplies_array|
      if supplies_array.include?("BBQ")
        bbq_holidays << holiday
      end
    end
  end
  bbq_holidays
end

# holiday_hash = {
#   :winter => {
#     :christmas => ["Lights", "Wreath"],
#     :new_years => ["Party Hats"]
#   },
#   :summer => {
#     :fourth_of_july => ["Fireworks", "BBQ"]
#   },
#   :fall => {
#     :thanksgiving => ["Turkey"]
#   },
#   :spring => {
#     :memorial_day => ["BBQ"]
#   }
# }

# p second_supply_for_fourth_of_july(holiday_hash)
# supply = "Boxes"
# p add_supply_to_winter_holidays(holiday_hash, supply)
# p add_supply_to_memorial_day(holiday_hash, supply)
# season = :winter
# holiday_name = :christmas
# supply_array = ["boxes", "kazoos"]
# p add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
# p all_winter_holiday_supplies(holiday_hash)
# all_supplies_in_holidays(holiday_hash)
# all_holidays_with_bbq(holiday_hash)
