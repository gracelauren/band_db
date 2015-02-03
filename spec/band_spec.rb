require("spec_helper")

describe(Band) do
  it{ should have_and_belong_to_many(:venues)}
  it{ should validate_presence_of(:name)}
  it{ should validate_uniqueness_of(:name)}

  it("will capitalize the name of a band") do
    band1= Band.create({ :name => "james blake" })
    expect(band1.name()).to eq("James Blake")
  end

  it("will order the bands alphabetically") do
    band2= Band.create({:name => "Bob Dylan" })
    band1= Band.create({:name => "Z Z Top" })
    expect(Band.all()).to eq([band2, band1])
  end

  describe('#venues_not_played') do
    it("will order the bands alphabetically") do
      band1= Band.create({:name => "Bob Dylan" })
      venue1= Venue.create({ :name => "Dark Horse", :location => "New Mexico" })
      venue2= Venue.create({ :name => "Blue Velvet", :location => "Pokhara, Nepal" })
      band1.venues.push(venue1)
      expect(band1.venues_not_played()).to eq([venue2])
    end
  end
end
