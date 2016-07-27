require 'httparty'

module Service
  class Webmotors
    include HTTParty

    base_uri  "http://www.webmotors.com.br"

    def makers(options = {})
      response = self.class.post('/carro/marcas', options)
      JSON.parse(response.body)
    end

    def models_from(maker_id)
      response = self.class.post('/carro/modelos', { marca: maker_id })
      JSON.parse(response.body)
    end
  end
end
