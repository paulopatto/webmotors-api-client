class ModelsController < ApplicationController
  include Concerns::Webmotors

  def index
    @maker = Make.where(webmotors_id: params[:webmotors_make_id]).take

    update_models_for(@maker.id)
    @models = @maker.models
  end
end
