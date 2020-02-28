require 'rspec'

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

describe 'The musical Alphabet' do
  let(:ma) { MusicalAlphabet.new }
  it 'should be a musical alphabet' do
    expect(ma.class).to eq(MusicalAlphabet)
    expect(ma.inital_ma).to eq( ["a", "a#", "b", "c", "c#", "d", "d#", "e", "f", "f#", "g", "g#"])
  end

  it 'should behave like a circle' do
    ma.musical_alphabet
    expect(ma.musical_pi).to eq([0, 30, 60, 90, 120, 150, 180, 210, 240, 270, 300, 330, 360, 390, 420, 450, 480, 510, 540, 570, 600, 630, 660, 690])
  end

  it 'should behave as a circle and an alphabet' do
    ma.musical_alphabet
    expect(ma.translate.class).to eq(Hash)
    expect(ma.musical_pi[0]).to eq('a')
    expect(ma.musical_pi[690]).to eq('g#')
  end

  it 'should have an offset' do
    ma.index_ma('c')
    expect(ma.inital_ma[0]).to eq('c')
    ma.index_ma('a#')
    expect(ma.inital_ma[0]).to eq('a#')
  end

  it 'should rotate the alph and build a cricle' do
    ma.index_ma('c')
    ma.musical_alphabet
    ma.translate
    expect(ma.musical_pi[0]).to eq('c')
    expect(ma.musical_pi[360]).to eq('c')
    expect(ma.musical_pi[690]).to eq('b')
  end

  it 'should have microtonal measurements' do

  end

  ####### This needs to take a key early on. Like now :)
  ####### And it needs to rotate the arrays to the key so
  ####### all of the downstream caclulations are correct.

end
