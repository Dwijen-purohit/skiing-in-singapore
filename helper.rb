module Helper

	def self.get_data_and_size data_source
		size = []
		data = []
		IO.readlines(data_source).each_with_index { |line, index|
			size = line.split(' ').map(&:to_i) if index == 0
			data.push line.split(' ').map(&:to_i) if index > 0
		}	
		return data,size
	end

end