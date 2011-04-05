class LookupsPhotos < ActiveRecord::Base
  belongs_to :lookup
  belongs_to :photo
end
