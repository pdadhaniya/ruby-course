require 'server_spec_helper'

describe Songify::Server do

  before(:each) do
    Songify.songs_repo.drop_tables
    Songify.songs_repo.create_tables
  end

  def app
    Songify::Server.new
  end

  describe "GET /" do
    it "loads the homepage" do
      Songify.songs_repo.save_song(Songify::Song.new("Happy Birthday"))
      Songify.songs_repo.save_song(Songify::Song.new("Hotel California"))

      get '/'
      expect(last_response).to be_ok
      expect(last_response.body).to include "Happy Birthday", "Hotel California"
    end
  end


  describe 'GET /show' do



  end


  describe 'GET /new' do



  end


  describe 'POST /create' do




  end













end