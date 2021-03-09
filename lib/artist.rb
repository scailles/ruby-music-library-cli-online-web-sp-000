class Artist 
  
attr_accessor :name, :songs
extend Concerns::Findable


@@all = []


def initialize(name)
  @name = name
  @songs=[]
  save
end

def songs
  @songs
end


def add_song(song)
  song.artist = self unless song.artist
  songs << song unless songs.include?(song)
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
  artist = Artist.new(name)
  artist.save
  artist
end


def genres
  songs.collect { |song| song.genre}.uniq
end
  

end

