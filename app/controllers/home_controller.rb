class HomeController < ApplicationController

  def index
    update_makers
  end

  private

  def update_makers
    wm_service = Services::Webmotors.new
    makers = wm_service.makers


    # Itera no resultado e grava as marcas que ainda não estão persistidas
    makers.each do |make_params|
      if Make.where(name: make_params['Nome']).size == 0
        Make.create(name: make_params['Nome'], webmotors_id: make_params['Id'])
      end
    end
  end
end
