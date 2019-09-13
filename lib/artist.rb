# The Artist class will be responsible for either creating the artist (if the artist doesn't 
# exist in our program yet) or finding the instance of that artist (if the artist does exist).

# Artist class
# An Artist be initialized with a name and should have an attribute accessor for this name. The class should have an @@all class variable and store all Artist instances in this variable.

# Artist.all
# This class method should return all Artist instances.

# Artist#add_song
# This instance method exists to tell a pased in Song instance it belongs to this Artist instance.

# Artist#songs
# This instance method returns an Array of all songs that belong to this Artist instance. This method should get all existing Song instances from Song and select only the ones that are associated with this Artist instance.

# Artist.find_or_create_by_name
# This class method should take the name that is passed in (remember, it will be a string), and do one of two things. Find the artist instance that has that name or create one if it doesn't exist. Either way, the return value of the method will be an instance of an artist with the name attribute filled out.

# Artist#print_songs
# This instance methods outputs the names of all songs associated with this Artist instance.

class Artist

    attr_accessor :name

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def add_song(song)
        song.artist = self
        song
    end

    def songs
        Song.all.select {|song| song.artist == self}
    end

    def print_songs
        self.songs.each {|song| puts song.name}
    end

    def self.find(name)
        self.all.find {|artist| artist.name == name}
    end

    def self.find_or_create_by_name(name)
        if self.find(name) 
            self.find(name)
        else
            self.new(name)
        end
    end 
end

