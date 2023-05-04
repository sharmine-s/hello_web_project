require 'spec_helper'
require 'rack/test'
require_relative '../../app'

describe Application do
  include Rack::Test::Methods

  let(:app) { Application.new }

  # GET /

  # context 'GET /hello' do
  #   it 'should return "Hello Leo"' do
  #     response = get('/hello?name=Leo')

  #     expect(response.status).to be(200)
  #     expect(response.body).to eq("Hello Leo!")
  #   end

  #   it 'should return "Hello Sharmine"' do
  #     response = get('/hello?name=Sharmine')

  #     expect(response.status).to be(200)
  #     expect(response.body).to eq("Hello Sharmine!")
  #   end
  # end

  context "GET /names" do
    it 'returns Julia, Mary, Karim' do
      # Assuming the post with id 1 exists.
      response = get('/names')

      expect(response.status).to eq(200)
      expect(response.body).to eq("Julia, Mary, Karim")
    end
  end

  context "POST /sort-names" do
    it "returns sorted list of names" do
      # Assuming the post with id 1 exists.
      response = post('/sort-names', names: 'Joe,Alice,Zoe,Julia,Kieran')

      expect(response.status).to eq(200)
      expect(response.body).to eq("Alice,Joe,Julia,Kieran,Zoe")
    end
  end

  context "GET /hello" do
    it "returns greeting message as an html template" do
      response = get("/hello")

      expect(response.status).to eq(200)
      expect(response.body).to include("<h1>Hello!</h1>")
    end
  end

  context "GET /tasks/new" do
    it "should return the html form to create a new task" do
      response = get("/tasks/new")

      expect(response.status).to eq(200)
      expect(response.body).to include('<form method="POST" action="/tasks">')
      expect(response.body).to include('<input type="text" name="task_name" />')
    end
  end
end