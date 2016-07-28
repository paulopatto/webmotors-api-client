module Concerns
  module Webmotors
    extend ActiveSupport::Concern

    def update_makers
      wm_service = Services::Webmotors.new
      makers = wm_service.makers

      makers.each do |make_params|
        Make.find_or_create_by(name: make_params['Nome']) do |make|
          make.webmotors_id =  make_params['Id']
        end
      end
    end

    def update_models_for(maker_id)
      maker = Make.find(maker_id)
      wm_service = Services::Webmotors.new
      models = wm_service.models_from(maker.webmotors_id)

      models.each do |model_params|
        Model.find_or_create_by(name: model_params['Nome'], make_id: maker.id) do |model|
          model.make_id = maker.id
          model.webmotors_id = model_params['Id']
        end
      end
    end
  end
end
