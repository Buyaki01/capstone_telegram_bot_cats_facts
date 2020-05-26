require 'telegram/bot'
require 'net/http'
require 'json'
require_relative 'telegram_bot.rb'

class Cats
  @values = nil

  def initialize
    @values = make_request_to_api_endpoint
  end

  def make_request_to_api_endpoint
    url = 'https://cat-fact.herokuapp.com/facts'
    uri = URI(url)
    response = Net::HTTP.get(uri)
    response = JSON.parse(response)
    response['all']
  end

  def select_random
    @values = @values.sample
    @values
  end
end
