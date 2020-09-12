# frozen_string_literal: true

########################################################
# Step 1: Establish the layers

# In this section of the file, as a series of comments,
# create a list of the layers you identify.
# Layer 1: Drivers
# Layer 2: Trips
# Layer 3: Trip details

# Which layers are nested in each other?
# Layer 3 (Trip details) is nested inside layer 2 (Trips), which is nested
# inside layer 1 (Drivers).

# Which layers of data "have" within it a different layer?
# Layer 1 (Drivers) and Layer 2 (Trips)

# Which layers are "next" to each other?
# Layer 3 has the date representing each trip details, which are resulting
# to be placed next to each other.

########################################################
# Step 2: Assign a data structure to each layer
# Layer 1: Drivers => Array of Hashes
# Layer 2: Trips => Array
# Layer 3: Trip details => Hash

# Copy your list from above, and in this section
# determine what data structure each layer should have

########################################################
# Step 3: Make the data structure!

# Setup the entire data structure:
# based off of the notes you have above, create the
# and manually write in data presented in rides.csv
# You should be copying and pasting the literal data
# into this data structure, such as "DR0004"
# and "3rd Feb 2016" and "RD0022"



drivers = [
  {
    id: 'DR0004',
    trips: [
      {
        date: '3rd Feb 2016',
        cost: 5,
        rider_id: 'RD0022',
        rating: 5
      },
      {
        date: "4th Feb 2016",
        cost: 10,
        rider_id: "RD0022",
        rating: 4
      },
      {
        date: "5th Feb 2016",
        cost: 20,
        rider_id: "RD0073",
        rating: 5
      }
    ]
  },
  {
    id: 'DR0001',
    trips: [
      {
        date: "3rd Feb 2016",
        cost: 10,
        rider_id: "RD0003",
        rating: 3
      },
      {
        date: "3rd Feb 2016",
        cost: 30,
        rider_id: "RD0015",
        rating: 4
      },
      {
        date: "5th Feb 2016",
        cost: 45,
        rider_id: "RD0003",
        rating: 2
      }
    ]
  }
]

########################################################
def driver_income(driver)
  return driver[:trips].sum{ |trip| trip[:cost] }
end

def driver_average_rating(driver)
  driver_rating_sum = driver[:trips].sum{ |trip| trip[:rating] }
  return driver_rating_sum.to_f / driver[:trips].length
end
# Step 4: Total Driver's Earnings and Number of Rides


# Use an iteration blocks to print the following answers:

# - the number of rides each driver has given
puts "Total number of rides each driver has given"

puts
drivers.each do |driver|
  total_rides = driver[:trips].length
  puts "#{driver[:id]} has given #{total_rides} rides."
end


# - the total amount of money each driver has made
puts
puts 'Total amount of money each driver has made.'

puts
drivers.each do |driver|
  ride_cost = driver_income(driver)
  puts "#{driver[:id]} has made $#{ride_cost}."
end


# - the average rating for each driver #

puts
drivers.each do |driver|
  driver_rating_average = driver_average_rating(driver)
  puts "#{driver[:id]}'s average trip rating is #{driver_rating_average.round(1)}."
end

# - Which driver made the most money?
puts
richest_driver = drivers.max_by do |driver|
  driver_income(driver)
end
income_sum = driver_income(richest_driver)

puts "#{richest_driver[:id]} made the most money, their total income is $#{income_sum}."

# - Which driver has the highest average rating?
puts
highest_rated_driver = drivers.max_by do |driver|
  driver_average_rating(driver)
end

rating_avg = driver_average_rating(highest_rated_driver)
puts "#{highest_rated_driver[:id]} has the highest rating of #{rating_avg.round(1)}."

