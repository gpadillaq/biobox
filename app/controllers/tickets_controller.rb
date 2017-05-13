class TicketsController < ApplicationController

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

      @ticket.save!
      redirect_to tickets_path
    rescue StandardError
      flash[:alert] = 'Verifique los campos a insertar'
      render :edit
    end
  end

  def destroy
  end

  private

  def image
    ticket_params[:image]
  end

  def route_image
    name = image.original_filename
    directory = Rails.root.to_s + '/app/assets/images'
    directory_db = '/assets'
    path = File.join(directory, name.tr(' ', '_'))
    File.open(path, 'wb') { |f| f.write(image.read) }
    File.join(directory_db, name.tr(' ', '_'))
  end

  def ticket_params
    params.require(:ticket).permit(:nombre, :disponible, :utilizados, :image)
  end
end
