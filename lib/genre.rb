class Genre 
  
extend Concerns::Findable   
  
attr_accessor :name, :songs 


@@all= []

def initialize(name)
  @name = name
  @songs = []
  save
end


def self.all
  @@all
end

def save
  @@all << self
end


def self.destroy_all
  @@all.clear
end


def self.create(name)
  genre = Genre.new(name)
  genre.save
  genre
end


def artists
  @songs.collect{|artists| artists.artist}.uniq 
end
  



end