class DashboardsController < ApplicationController
  def index
  end

  def input_biobox
    pdf = Prawn::Document.new
    pdf.text "Help! I am trapped in a PDF factory!"
    pdf.autoprint
    render json: params
  end
end
