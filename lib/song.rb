require 'pry'


## to run test: rspec ./spec/001_song_basics_spec.rb     or whatever file name

class Song 
  
extend Concerns::Findable 
  
attr_accessor :name, :artist
attr_reader :genre


@@all = []


def initialize(name, artist = nil, genre = nil)
  self.genre=(genre) if genre != nil
  @name = name
  self.artist=artist if artist
end

def save
  @@all << self
end


def self.all
  @@all
end


def self.destroy_all
  @@all.clear
end
  
  
def self.create(name)
  song = Song.new(name)
  song.save
  song
end


def artist=(artist)
  @artist = artist
  artist.add_song(self)
end


def genre=(genre)
  @genre = genre 
  genre.songs << self unless genre.songs.include?(self)
end



#def self.find_by_name(name)
 # @@all.detect{|song| song.name == name}
#end


def self.find_or_create_by_name(name)
  if find_by_name(name)
    find_by_name(name)
    
  else 
    create(name)
    
end
end


def self.new_from_filename(filename)
  array = filename.split(" - ")
  
  artist_a = array[0]
  name_a = array[1]
  genre_a = array[2].gsub(".mp3","")
  
  artist = Artist.find_or_create_by_name(artist_a)
  genre = Genre.find_or_create_by_name(genre_a)
  
  self.new(name_a, artist, genre)
  
end


def self.create_from_filename(filename)
  self.new_from_filename(filename).save
end


  
  
  
end