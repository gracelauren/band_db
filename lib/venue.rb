class Venue < ActiveRecord::Base
  has_and_belongs_to_many(:bands, { :uniq => true })
  validates(:name, {:presence => true})
  validates(:location, {:presence => true})
  before_save(:capitalize_name, :capitalize_location)
  validates_uniqueness_of :name, :scope => :location


  default_scope { order('name') }



  private

  define_method(:capitalize_name) do
    self.name = self.name().titlecase()
  end

  define_method(:capitalize_location) do
    unless location.blank?
      self.location = self.location().titlecase()
    end
  end

end
