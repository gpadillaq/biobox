class Ticket < ActiveRecord::Base
  attr_accessor :image

  validates :nombre, presence: true
  validates :disponible, presence: true
  validates :file_path, presence: true

  DEFAULT = 'Imagen-no-disponible.jpg'

  def ticket_utilizado
    self.disponible -= 1
    self.utilizados += 1
    self.save
  end

  def image
    self.file_path || Ticket::DEFAULT
  end

  def route
    [Rails.root.to_s, '/app/views/images/', self.image].join
  end

  def destroy
    begin
      self.transaction do
        ruta_de_imagen = self.route
        if super()
          FileUtils.rm(ruta_de_imagen)
        end
      end
    rescue StandardError => e
      logger.error e
      raise e
    end
  end
end
