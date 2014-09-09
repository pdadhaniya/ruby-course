require_relative '../spec_helper.rb'

describe Songify::Repositories::SongsRepo do 


  before(:each) do
    Songify.songs_repo.drop_tables
    Songify.songs_repo.create_tables
  end









  
end