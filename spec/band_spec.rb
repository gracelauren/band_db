require("spec_helper")

describe(Band) do
  it{ should have_and_belong_to_many(:venues) }
  it{ should validate_presence_of(:name)}

  it("will capitalize the name of a band") do
    band1= Band.create({ :name => "james blake" })
    expect(band1.name()).to eq("James Blake")
  end

  it("will order the recipes alphabetically") do
    band2= Band.create({:name => "Bob Dylan" })
    band1= Band.create({:name => "Z Z Top" })
    expect(Band.all()).to eq([band2, band1])
  end

end
