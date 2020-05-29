require_relative '../lib/cats_facts.rb'

RSpec.describe Cats do
  let(:cats) { Cats.new }
  let(:make_json_request) { cats.send(:make_request_to_api_endpoint) }
  let(:call_method) { cats.send(:random_fact_about_cats) }

  describe '#make_request_to_api_endpoint' do
    it 'when the request is sucessful should return Json response' do
      expect(make_json_request.class).to eql(Array)
    end

    it 'the array should not be empty' do
      expect(make_json_request.length).not_to eql(0)
    end
  end

  describe '#random_fact_about_cats' do
    it 'return a Hash' do
      expect(call_method.class).to eql(Hash)
    end

    it 'return six items in a hash' do
      expect(call_method.length).to eql(6)
    end
  end
end
