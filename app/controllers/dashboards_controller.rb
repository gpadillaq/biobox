class DashboardsController < ApplicationController
  def index
  end

  def input_biobox
    logger.info {"**********************Señal del sensor recibida**********************"}
    render json: params
  end
end
