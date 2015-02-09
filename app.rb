require("bundler/setup")
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }


get('/') do
  @bands = Band.all()
  erb(:index)
end


post('/bands') do
  band_name= params.fetch('band_name')
  Band.create({:name=> band_name })
  redirect('/')
end


get('/bands/:id') do
  @band_id = params.fetch('id').to_i()
  band = Band.find(@band_id)
  @venues = Venue.all()
  erb(:band)
end

patch('/bands/:id') do
  @band_id = params.fetch('id').to_i()
  band = Band.find(@band_id)
  band.update({ :name => params.fetch('new_name') })
  redirect('/')
end

delete('/bands/:id') do
  @band_id = params.fetch('id').to_i()
  band = Band.find(@band_id)
  band.delete()
  redirect('/')
end

post('/venues') do
  @venue_name = params.fetch('venue_name')
  @venue_location = params.fetch('venue_location')
  Venue.create({ :name => @venue_name, :location => @venue_location })
  @band_id = params.fetch('band_id').to_i()
  url = "/bands/" + @band_id.to_s()
  redirect(url)
end


post('/band_venues') do
  @venues = Venue.all()
  venue_ids = params.fetch('venue_ids')
  venue_ids.each() do |venue_id|
    venue = Venue.find(venue_id)
    @band_id = params.fetch('band_id').to_i()
    @band = Band.find(@band_id)
    @band.venues.push(venue)
  end
  url = "/bands/" + @band_id.to_s()
  redirect(url)
end
