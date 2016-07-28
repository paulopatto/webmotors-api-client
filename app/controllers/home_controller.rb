class HomeController < ApplicationController
  include Concerns::Webmotors

  def index
    update_makers

    @makers = Make.all
  end
end
