require 'httparty'

module Services
  class Webmotors
    include HTTParty

    base_uri  "http://www.webmotors.com.br"

    METHODS = {
      makers: '/carro/marcas',
      models: '/carro/modelos'
    }

    def makers(options = {})
      response = self.class.post(METHODS[:makers], options)
      return [] unless response.success?
      JSON.parse(response.body)
    end

    def models_from(maker_id)
      response = self.class.post(METHODS[:models], query: { marca: maker_id })
      return [] unless response.success?
      JSON.parse(response.body)
    end
  end
end
