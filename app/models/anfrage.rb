class Anfrage < ActiveRecord::Base
  validates :name, :presence => true

end
