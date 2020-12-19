require 'json' #used in server.rb'servlet
require_relative 'musical_alphabet'

class Guitar < MusicalAlphabet

  attr_reader :tuning, :strings

  def initialize(tuning)
    @tuning = tuning
    @strings = Hash.new
    super()
  end

  # return [Hash]
  def build_strings
    count = 0
    tuning.each do |string|
      count += 1
      index_ma(string)
      musical_alphabet(offset(string))
      translate
      @strings.store(count, musical_pi)
    end
    @strings
  end

  # Because of where this gets executed it has access
  # to the current string and string before it. From that
  # we can determine an offset.
  def offset(string)
    return if musical_pi.nil?
    musical_pi.key(string) / 30
  end
end
