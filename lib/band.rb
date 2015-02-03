class Band < ActiveRecord::Base
  has_and_belongs_to_many(:venues { :uniq => true })
  validates(:name, {:presence => true})
  before_save(:capitalize_name)
  validates_uniqueness_of :name


  default_scope { order('name') }

  private

  define_method(:capitalize_name) do
    self.name = self.name().titlecase()
  end

end
