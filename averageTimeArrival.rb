require "time" 
class AverageTimeArrival
		One_day = 24*60*60 #seconds
	def self.average_time_of_day(time_array)
		puts "INPUT:\t#{time_array}"
		times_in_seconds=[]

		if !self.is_cyclic(time_array)
			time_array.each{ |time_string|
				tempTime = Time.parse(time_string)
				times_in_seconds.push(convert_to_seconds(tempTime))
			}
		else
			time_array.each{ |time_string|
				tempTime = Time.parse(time_string)
				if time_string.include?"am"
					times_in_seconds.push(convert_to_seconds(tempTime, One_day))
				else
					times_in_seconds.push(convert_to_seconds(tempTime))
				end
			}
		end
		#puts times_in_seconds
		puts "OUTPUT:\t" + self.convert_to_time(average_time(times_in_seconds))

=begin
		time_array.each{ |time_string|
			tempTime = Time.parse(time_string)
			times_in_seconds.push(convert_to_seconds(tempTime))
		}
		puts "Time Objects(in seconds): #{times_in_seconds} "
		if self.is_cyclic(time_array)
			puts "Cycle"
		else
			puts self.convert_to_time(average_time(times_in_seconds))
		end
=end
		#puts "Average Time(in seconds): #{average_time(times_in_seconds)}"
		#puts "Average Time: #{Time.parse("12:00am") +average_time(times_in_seconds)}"
		#puts "Average: #{times.average}"
	end

	def self.average_time(times_in_seconds) #in seconds
		sum = 0
		times_in_seconds.each { |time| #in seconds
			sum +=time
		}
		sum/times_in_seconds.length
	end

	def self.convert_to_seconds(time_object, extra_day=0)
		#puts "EXTRA : #{extra_day}"
		time_object.sec + (time_object.min + time_object.hour*60)*60 + extra_day
	end

	def self.convert_to_time(seconds)
		days = seconds / (24*60*60)
		seconds = seconds % (24*60*60)

		hours = seconds / (60*60)
		seconds = seconds % (60*60)

		minutes = seconds / (60)
		seconds = seconds %  (60)

		"#{Time.strptime("#{hours}:#{minutes}:#{seconds}" , "%H:%M:%S").strftime("%I:%M%P")}"
	end

	def self.is_cyclic(time_array)
		for i in 1..time_array.length-1
			#puts "#{time_array[i-1]}      #{time_array[i]}"
			if(time_array[i].include?("am") && time_array[i-1].include?("pm"))
				return true
				break;
			end
		end
		return false
	end
end


puts"\n---------------------------------------------------------------------\n"
AverageTimeArrival.average_time_of_day(["11:51pm", "11:56pm", "12:01am", "12:06am", "12:11am"])
puts"\n---------------------------------------------------------------------\n"
AverageTimeArrival.average_time_of_day(["6:41am", "6:51am", "7:01am"])
puts"\n---------------------------------------------------------------------\n"
AverageTimeArrival.average_time_of_day(["11:51pm","11:53pm", "11:56pm", "12:01am", "12:06am", "12:11am"])
puts"\n---------------------------------------------------------------------\n"
AverageTimeArrival.average_time_of_day(["11:15pm","11.23pm","11:30pm","11:48pm","12:03am"])
puts"\n---------------------------------------------------------------------\n"
#AverageTimeArrival.convert_to_time(1593541260)
#AverageTimeArrival.convert_to_seconds(Time.parse("1:00pm"))

#puts AverageTimeArrival.is_cyclic ["11:51pm", "11:56pm", "12:01am", "12:06am", "12:11am"]

#puts AverageTimeArrival.is_cyclic ["6:41am", "6:51am", "7:01am"]


