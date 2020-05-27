require 'telegram/bot'
require 'net/http'
require 'json'
require_relative 'telegram_bot.rb'

class Cats
  @cat_facts = nil

  def initialize
    @cat_facts = make_request_to_api_endpoint
  end

  def make_request_to_api_endpoint
    endpoint_url = 'https://cat-fact.herokuapp.com/facts'
    uri = URI(endpoint_url)
    endpoint_response = Net::HTTP.get(uri)
    endpoint_response = JSON.parse(endpoint_response)
    endpoint_response['all']
  end

  def random_fact_about_cats
    @cat_facts = @cat_facts.sample
    @cat_facts
  end
end
