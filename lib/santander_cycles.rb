puts "File is Loaded..."

class DockingStation
    attr_reader :list_of_bikes, :DEFAULT_CAPACITY

    def initialize(capacity=20)
        @list_of_bikes = []
        @working_bikes = []
        @DEFAULT_CAPACITY = capacity
    end
    

    def release_bike
        update_working_bikes
        raise "Can't release broken bikes!!!" if empty?
        removed_bike = @working_bikes.sample
        @list_of_bikes.delete(removed_bike)
        removed_bike
    end

    def dock(bike, status=bike.status)
        raise "Too many bikes!!!!!" if full?
        if status == true
            bike.status = status
        end

        @list_of_bikes << bike
    end
    

    private 
    def full?
        @list_of_bikes.size >= @DEFAULT_CAPACITY
    end

    def empty?
        @working_bikes.empty?
    end

    def update_working_bikes
        @working_bikes = @list_of_bikes.select { |bike| bike.status == true } 
    end
end

class Bike
    attr_accessor :status

    def initialize
    @status = true
    end

    def working?
        @status 
    end
end


docking_station = DockingStation.new

# puts docking_station.respond_to? :release_bike