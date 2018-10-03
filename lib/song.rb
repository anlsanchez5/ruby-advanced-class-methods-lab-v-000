require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    @@all << self.new
    @@all.last
  end

  def self.new_by_name(name)
    song = self.new
    @name = name
    song.name = @name
    song
  end

  def self.create_by_name(name)
    song = self.new
    @name = name
    song.name = @name
    @@all << song
    song
  end

  def self.find_by_name(name)
    @@all.find{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if !self.find_by_name(name)
      self.create_by_name(name)
    else
      return @@all.last
    end
  end

  def self.alphabetical
    @@all.sort_by {|song| song.name}
  end

  def self.new_from_filename(artist_name_filetype)
    artist_name_filetype.split(/[-.]/)
    song = self.new
    @artist_name = artist_name_filetype[0]
    @name = artist_name_filetype[1]
    song.name = @name
    song.artist = @artist_name
  end
end
