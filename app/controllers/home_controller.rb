class HomeController < ApplicationController
  include Concerns::Webmotors

  def index
    @makers = (Make.count > 0) ? Make.all : update_makers
  end
end
