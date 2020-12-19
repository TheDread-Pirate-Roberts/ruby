require 'spec_helper'
require 'musical_alphabet'

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
    expect(ma.musical_pi[30]).to eq('c#')
    expect(ma.musical_pi[60]).to eq('d')
    expect(ma.musical_pi[360]).to eq('c')
    expect(ma.musical_pi[690]).to eq('b')
  end

  it 'should have microtonal measurements' do
    #should it?
  end
end
