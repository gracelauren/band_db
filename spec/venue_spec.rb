require("spec_helper")

describe(Venue) do
  it{ should have_and_belong_to_many(:bands) }
  it{ should validate_presence_of(:name)}
  it{ should validate_presence_of(:location)}


  it("will capitalize the name of a venue") do
    venue1= Venue.create({ :name => "blue velvet", :location => "pokhara, nepal" })
    expect(venue1.name()).to eq("Blue Velvet")
  end

  it("will titlecase the location of a venue") do
    venue1= Venue.create({ :name => "blue velvet", :location => "pokhara, nepal" })
    expect(venue1.location()).to eq("Pokhara, Nepal")
  end

  it("will order the venues alphabetically") do
    venue1= Venue.create({ :name => "Dark Horse", :location => "Manchester, Endland" })
    venue2= Venue.create({ :name => "Blue Velvet", :location => "Pokhara, Nepal" })
    expect(Venue.all()).to eq([venue2, venue1])
  end

end
