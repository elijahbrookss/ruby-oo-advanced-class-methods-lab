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
    song = self.new
    song.save

    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song.save

    song
  end

  def self.create_by_name(name)
    if self.all.include?(name) then
      return self.all[name]
    else
      return self.new_by_name(name)
    end
  end

  def self.find_by_name(name)
    self.all.each{|song| if song.name == name then return song end}
    return nil
  end

  def self.find_or_create_by_name(name)
    song = self.find_by_name(name)

    if !song then
      song = self.create_by_name(name)
    end

    return song
  end

  def self.alphabetical
    self.all.sort_by {|word| word.name.downcase}
  end

  def self.new_from_filename(name)

    name = name.split(".mp3")[0].split(" - ");
    new_song = self.create_by_name(name[1]);
    new_song.artist_name = name[0];

    new_song
  end

  def self.create_from_filename(name)
    self.new_from_filename(name)
  end

  def self.destroy_all
    self.all.clear
  end


end
