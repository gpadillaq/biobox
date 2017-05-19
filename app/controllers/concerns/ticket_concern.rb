module TicketConcern
  extend ActiveSupport::Concern

  included do
    before_action :ticket_disponible, only: :input_biobox
  end

  private

  def ticket_disponible
    id_tickets = Ticket.where('disponible > 0').pluck(:id)

    posicion_aleatoria = rand(id_tickets.length)

    @ticket = Ticket.find_by_id(id_tickets[posicion_aleatoria])

    if @ticket.present?
      @ticket.ticket_utilizado
    else
      @ticket = Ticket.new
    end
  end
end
