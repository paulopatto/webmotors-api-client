class ModelsController < ApplicationController
  include Concerns::Webmotors

  def index
    @maker = Make.where(webmotors_id: params[:webmotors_make_id]).take
    @models = @maker.models.empty? ? update_models_for(@maker.id) : @maker.models
  end
end
