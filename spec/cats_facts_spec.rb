require_relative '../lib/cats_facts.rb'

RSpec.describe Cats do
  describe '#make_request_to_api_endpoint' do
    let(:cats) { Cats.new }
    let(:make_json_request) { cats.make_request_to_api_endpoint }

    it 'when the request is sucessful should return Json response' do
      expect(make_json_request.class).to eql(Array)
    end

    it 'the array should not be empty' do
      expect(make_json_request.length).not_to eql(0)
    end
  end

  describe '#random_fact_about_cats' do
    let(:cats) { Cats.new }
    let(:call_method) { cats.random_fact_about_cats }

    it 'return a Hash' do
      expect(call_method.class).to eql(Hash)
    end

    it 'return six items in a hash' do
      expect(call_method.length).to eql(6)
    end
  end
end
