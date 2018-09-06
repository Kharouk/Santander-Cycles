puts "File is Loaded..."

class DockingStation
    attr_reader :list_of_bikes, :DEFAULT_CAPACITY

    def initialize
        @list_of_bikes = []
        @DEFAULT_CAPACITY = 20
    end
    

    def release_bike

        raise "No bikes!!!!!" if empty?
        removed_bike = @list_of_bikes.sample
        @list_of_bikes.delete(removed_bike)
        removed_bike

    end

    def dock(bike)
       raise "Too many bikes!!!!!" if full?
       @list_of_bikes << bike
    end
    

    private 
    def full?
        @list_of_bikes.size >= @DEFAULT_CAPACITY
    end

    def empty?
        @list_of_bikes.empty?
    end

end

class Bike
    def working?
        true 
    end
end


docking_station = DockingStation.new

# puts docking_station.respond_to? :release_bike