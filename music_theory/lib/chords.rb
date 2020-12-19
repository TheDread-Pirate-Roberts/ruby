require_relative 'modes'

class Chords < Modes
  attr_reader :mode

  def initialize(key, mode = 'ionian')
    super(key)
    @mode = send mode
  end

  def i
    # 1 3 5
    mode.values_at(0, 2, 4)
  end

  def ii
    # 2 4 6
    mode.values_at(1, 3, 5)
  end

  def iii
    # 3 5 7
    mode.values_at(2,4,6)
  end

  def iv
    # 4 6 8
    mode.values_at(3,5,7)
  end

  def v
    # 5 7 9
    (mode[0..-2] * 2).values_at(4,6,8)
  end

  def vi
    # 6 8 10
    (mode[0..-2] * 2).values_at(5,7,9)
  end

  def vii
    # 7 9 11
    (mode[0..-2] * 2).values_at(6,8,10)
  end
end
