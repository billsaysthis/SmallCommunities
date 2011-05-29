class LookupsPhoto < ActiveRecord::Base
  belongs_to :lookup
  belongs_to :photo
end
