require 'spec_helper'
require 'rack/test'
require_relative '../../app'

describe Application do
  include Rack::Test::Methods

  let(:app) { Application.new }

  # GET /

  context 'GET /hello' do
    it 'should return "Hello Leo"' do
      response = get('/hello?name=Leo')

      expect(response.status).to be(200)
      expect(response.body).to eq("Hello Leo!")
    end

    it 'should return "Hello Sharmine"' do
      response = get('/hello?name=Sharmine')

      expect(response.status).to be(200)
      expect(response.body).to eq("Hello Sharmine!")
    end
  end

  context "GET /names" do
    it 'returns Julia, Mary, Karim' do
      # Assuming the post with id 1 exists.
      response = get('/names')

      expect(response.status).to eq(200)
      expect(response.body).to eq("Julia, Mary, Karim")
    end
  end
end