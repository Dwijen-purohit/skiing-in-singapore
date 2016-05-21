class Hill
	include Helper

	@map_data	# Structured Map Details
	@size     	# Size of map in NxN
	@grid_size	# Size of inidividual grids in NxN ( A grid is a subset of map ) 
	grids = []	# Array of smaller Grids with their score

	attr_accessor :map_data, :size, :grid_size

	def initialize( data_source )
		self.map_data, self.size = Helper.get_data_and_size(data_source)
		self.grid_size = @size.map { |s| s/10 }
	end

	def get_best_ski_routes
		
	end

	## Private Methods
	#private
	def calculate_grid_scores	
		# Loop grids and calculate scores
		for g in 0..(self.size[0]/self.grid_size[0])
			grid = {
				score: 0,
				map: []
			}
			@map_data.each_with_index do |row, row_index|
				# Calculate score for correct Grid
				if row_index >= self.grid_size[0]*g && row_index <= self.grid_size[0]*(g+1)
					grid_row = @map_data[row_index][ self.grid_size[1]*g,  self.grid_size[1]*(g+1) ]
					grid.map.push = grid_row
					grid[:score] += grid_row.reduce(0, :+)
				end	
			
			end
			grids.push grid
		end
	end
end