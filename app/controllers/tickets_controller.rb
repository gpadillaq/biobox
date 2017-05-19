class TicketsController < ApplicationController
  include TicketConcern

  def index
    @tickets = Ticket.all
  end

  def new
    @ticket = Ticket.new
  end

  def create
    begin
      @ticket = Ticket.new(ticket_params)
      @ticket.file_path = route_image if image.present?
      raise if flash.now[:error].present? || !@ticket.valid?
      if @ticket.save!
        flash[:notice] = 'La ticket ha sido almacenado'
        redirect_to tickets_path
      else
        flash.now[:error] = 'Ocurrió un error al guardar los cambios'
        render :new
      end
    rescue StandardError
      flash[:alert] = 'Verifique los campos a insertar'
      render :new
    end
  end

  def edit
    @ticket = Ticket.find(params[:id])
  end

  def update
    begin
      @ticket = Ticket.find(params[:id])
      @ticket.attributes = ticket_params

      @ticket.file_path = route_image if image.present?
      @ticket.save!
      redirect_to tickets_path
    rescue StandardError
      flash[:alert] = 'Verifique los campos a insertar'
      render :edit
    end
  end

  def destroy
    begin
      @ticket = Ticket.find(params[:id])
      @ticket.destroy
    rescue StandardError => e
      flash[:alert] = e.message
    end
    redirect_to tickets_path
  end

  def input_biobox
    logger.info {"**********************Señal del sensor recibida**********************"}
    send_file @ticket.route, type: 'image/jpeg', disposition: 'inline'
  end


  private

  def image
    ticket_params[:image]
  end

  def route_image
    name = [Time.current.to_i, image.original_filename.tr(' ', '_')].join
    directory = Rails.root.to_s + '/app/views/images'
    path = File.join(directory, name)
    File.open(path, 'wb') { |f| f.write(image.read) }
    name
  end

  def ticket_params
    params.require(:ticket).permit(:nombre, :disponible, :utilizados, :image)
  end
end
