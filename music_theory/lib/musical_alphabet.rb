require 'pry'

class MusicalAlphabet
  attr_reader :inital_ma, :musical_pi
  def initialize
    @inital_ma = ['a','a#','b', 'c', 'c#', 'd', 'd#', 'e', 'f', 'f#', 'g', 'g#']
    @musical_pi
  end

  # Represents the 2 octave musical alph as a circle with
  # 30 degrees of seperation between each note.
  def musical_alphabet(offset = nil)
    offset = 0 if offset.nil?
    @musical_pi = []
    (@inital_ma * 2).each_with_index { |x, i| @musical_pi << (i + offset) * 30 }
  end

  # We need to be able to rotate this imaginary circle
  # to our WHill
  def index_ma(note)
    desired_notes_index = 0
    @inital_ma.each_with_index {|x, i| desired_notes_index = i if x == note }
    @inital_ma = inital_ma.rotate(desired_notes_index)
  end

  def translate
    @musical_pi = [@musical_pi,(@inital_ma *  2)].transpose.to_h
  end
end
