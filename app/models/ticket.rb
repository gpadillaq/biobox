class Ticket < ActiveRecord::Base
  attr_accessor :image

  validates :nombre, presence: true
  validates :disponible, presence: true
  validates :file_path, presence: true

end
