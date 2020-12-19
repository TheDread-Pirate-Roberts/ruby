require_relative 'musical_alphabet'

class Modes < MusicalAlphabet

  attr_reader :key, :w, :h, :ionian, :dorian, :lydian, :mixolydian, :aolian, :locrian
  attr_accessor :root

  def initialize(key)
    super()
    @root = 0
    @w = 60
    @h = 30
    setup(key)
  end

  def setup(key)
    index_ma(key)
    musical_alphabet
    @key = translate
  end

  def ionian
    @ionian ||= @key.values_at(root, _(w), _(w), _(h), _(w), _(w), _(w), _(h))
  end

  def dorian
    @dorian ||= @key.values_at(root, _(w), _(h), _(w), _(w), _(w), _(h), _(w))
  end
    
  def phrygian
    @dorian ||= @key.values_at(root, _(h), _(w), _(w), _(w), _(h), _(w), _(w))
  end

  def lydian
    @lydian ||= @key.values_at(root, _(w), _(w), _(w), _(h), _(w), _(w), _(h))
  end

  def mixolydian
    @mixolydian ||= @key.values_at(root, _(w), _(w), _(h), _(w), _(w), _(h), _(w))
  end

  def aolian
    @aolian ||= @key.values_at(root, _(w), _(h), _(w), _(w), _(h), _(w), _(w))
  end

  def locrian
    @locrian ||= @key.values_at(root, _(h), _(w), _(w), _(h), _(w), _(w), _(w))
  end

  private

  def _(degree)
    @root += degree
  end
end
