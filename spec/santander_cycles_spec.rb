require 'santander_cycles'

describe DockingStation do
    # it { is_expected.to respond_to :release_bike }

    # it 'expects release_bike to instantiate new Bike class' do
    #     bike = Bike.new
    #     expect(bike.working?).to eq true
    # end

    
    # it { is_expected.to respond_to(:dock).with(1).argument }

    # it 'expects user to check if bikes are docked' do
    #     bike = Bike.new
    #     expect(subject.dock(bike)).to eq bike
    # end

    # it 'returns us all of the docked bikes at station' do
    #     bike = Bike.new
    #     subject.dock(bike)
    #     expect(subject.bike).to eq bike
    # end

    #it 'raises an error when user removes bike when there is no bikes' do
        # curly braces kinda yields out/doesn't run right away until runs all of line
    #    expect { subject.release_bike }.to raise_error "No bikes!!!!!"
    #end
    let(:bike) { double :bike }

    it "only allows ten bikes to be docked" do
        allow(bike).to receive(:status)
        #subject.list_of_bikes > 10 and try to dock bike, return error
        subject.DEFAULT_CAPACITY.times { |n| subject.dock(bike) }
        expect { subject.dock(bike) }.to raise_error "Too many bikes!!!!!"
    end 

    it "when a dockingstation is created it accepts a default capacity parameter" do
        station_23 = DockingStation.new(23)
        expect(station_23.DEFAULT_CAPACITY).to eq 23
    end 

    it "updates bike working status when docked" do
        allow(bike).to receive(:status).and_return(false)
        subject.dock(bike, false)
        docked_bike = subject.list_of_bikes[0]

        expect(docked_bike.status).to eq false
    end

    it "doesn't release broken bikes" do
    allow(bike).to receive(:status).and_return(false)
      subject.dock(bike, false)
      expect{ subject.release_bike }.to raise_error "Can't release broken bikes!!!" # when that bike is broken
    end 
end