class Task < ActiveRecord::Base
  validates_presence_of :name, :routine
  belongs_to :routine
end
