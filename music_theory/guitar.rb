require 'rspec'
require 'json'
require_relative 'musical_alphabet'

class Guitar < MusicalAlphabet

  attr_reader :tuning, :strings

  def initialize(tuning)
    @tuning = tuning
    @strings = Hash.new
    super()
  end

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
  def offset string
    return if musical_pi.nil?
    musical_pi.key(string) / 30
  end
end

describe 'Guitar' do

  let(:g) { Guitar.new(['e', 'a', 'd', 'g', 'b', 'e']) }

  it 'should be a guitar' do
    expect(g.class).to eq(Guitar)
  end

  it 'should accept a tuning' do
    expect(g.tuning.class).to eq(Array)
    expect(g.tuning).to eq(['e', 'a', 'd', 'g', 'b', 'e'])
  end

  it 'should inhert from the MusicalAlphabet class' do
    expect(g.inital_ma).to eq(['a','a#','b', 'c', 'c#', 'd', 'd#', 'e', 'f', 'f#', 'g', 'g#'])
  end

  it 'should build the guitar tuning from the musical_alphabet' do
    expect(g.tuning[0]).to eq('e')

    g.index_ma(g.tuning[0])
    g.musical_alphabet
    g.translate

    expect(g.musical_pi[0]).to eq('e')
    expect(g.musical_pi[360]).to eq('e')
    expect(g.musical_pi[690]).to eq('d#')
  end

  it 'should build the musical alphabet on all the guitars strings' do
    expect(g.build_strings).to eq({
      1 => {0=>"e", 30=>"f", 60=>"f#", 90=>"g", 120=>"g#", 150=>"a", 180=>"a#", 210=>"b", 240=>"c", 270=>"c#", 300=>"d", 330=>"d#", 360=>"e", 390=>"f", 420=>"f#", 450=>"g", 480=>"g#", 510=>"a", 540=>"a#", 570=>"b", 600=>"c", 630=>"c#", 660=>"d", 690=>"d#"},
      2 => {150=>"a", 180=>"a#", 210=>"b", 240=>"c", 270=>"c#", 300=>"d", 330=>"d#", 360=>"e", 390=>"f", 420=>"f#", 450=>"g", 480=>"g#", 510=>"a", 540=>"a#", 570=>"b", 600=>"c", 630=>"c#", 660=>"d", 690=>"d#", 720=>"e", 750=>"f", 780=>"f#", 810=>"g", 840=>"g#"},
      3 => {300=>"d", 330=>"d#", 360=>"e", 390=>"f", 420=>"f#", 450=>"g", 480=>"g#", 510=>"a", 540=>"a#", 570=>"b", 600=>"c", 630=>"c#", 660=>"d", 690=>"d#", 720=>"e", 750=>"f", 780=>"f#", 810=>"g", 840=>"g#", 870=>"a", 900=>"a#", 930=>"b", 960=>"c", 990=>"c#"},
      4 => {450=>"g", 480=>"g#", 510=>"a", 540=>"a#", 570=>"b", 600=>"c", 630=>"c#", 660=>"d", 690=>"d#", 720=>"e", 750=>"f", 780=>"f#", 810=>"g", 840=>"g#", 870=>"a", 900=>"a#", 930=>"b", 960=>"c", 990=>"c#", 1020=>"d", 1050=>"d#", 1080=>"e", 1110=>"f", 1140=>"f#"},
      5 => {570=>"b", 600=>"c", 630=>"c#", 660=>"d", 690=>"d#", 720=>"e", 750=>"f", 780=>"f#", 810=>"g", 840=>"g#", 870=>"a", 900=>"a#", 930=>"b", 960=>"c", 990=>"c#", 1020=>"d", 1050=>"d#", 1080=>"e", 1110=>"f", 1140=>"f#", 1170=>"g", 1200=>"g#", 1230=>"a", 1260=>"a#"},
      6 => {720=>"e", 750=>"f", 780=>"f#", 810=>"g", 840=>"g#", 870=>"a", 900=>"a#", 930=>"b", 960=>"c", 990=>"c#", 1020=>"d", 1050=>"d#", 1080=>"e", 1110=>"f", 1140=>"f#", 1170=>"g", 1200=>"g#", 1230=>"a", 1260=>"a#", 1290=>"b", 1320=>"c", 1350=>"c#", 1380=>"d", 1410=>"d#"}
    })
  end

  it 'should be able to handle alternate tuning' do
    g = Guitar.new(['f', 'a', 'c', 'e', 'g', 'b'])
    expect(g.build_strings).to eq({
      1=>{0=>"f", 30=>"f#", 60=>"g", 90=>"g#", 120=>"a", 150=>"a#", 180=>"b", 210=>"c", 240=>"c#", 270=>"d", 300=>"d#", 330=>"e", 360=>"f", 390=>"f#", 420=>"g", 450=>"g#", 480=>"a", 510=>"a#", 540=>"b", 570=>"c", 600=>"c#", 630=>"d", 660=>"d#", 690=>"e"},
      2 => {120=>"a", 150=>"a#", 180=>"b", 210=>"c", 240=>"c#", 270=>"d", 300=>"d#", 330=>"e", 360=>"f", 390=>"f#", 420=>"g", 450=>"g#", 480=>"a", 510=>"a#", 540=>"b", 570=>"c", 600=>"c#", 630=>"d", 660=>"d#", 690=>"e", 720=>"f", 750=>"f#", 780=>"g", 810=>"g#"},
      3 => {210=>"c", 240=>"c#", 270=>"d", 300=>"d#", 330=>"e", 360=>"f", 390=>"f#", 420=>"g", 450=>"g#", 480=>"a", 510=>"a#", 540=>"b", 570=>"c", 600=>"c#", 630=>"d", 660=>"d#", 690=>"e", 720=>"f", 750=>"f#", 780=>"g", 810=>"g#", 840=>"a", 870=>"a#", 900=>"b"},
      4 => {330=>"e", 360=>"f", 390=>"f#", 420=>"g", 450=>"g#", 480=>"a", 510=>"a#", 540=>"b", 570=>"c", 600=>"c#", 630=>"d", 660=>"d#", 690=>"e", 720=>"f", 750=>"f#", 780=>"g", 810=>"g#", 840=>"a", 870=>"a#", 900=>"b", 930=>"c", 960=>"c#", 990=>"d", 1020=>"d#"},
      5 => {420=>"g", 450=>"g#", 480=>"a", 510=>"a#", 540=>"b", 570=>"c", 600=>"c#", 630=>"d", 660=>"d#", 690=>"e", 720=>"f", 750=>"f#", 780=>"g", 810=>"g#", 840=>"a", 870=>"a#", 900=>"b", 930=>"c", 960=>"c#", 990=>"d", 1020=>"d#", 1050=>"e", 1080=>"f", 1110=>"f#"},
      6 => {540=>"b", 570=>"c", 600=>"c#", 630=>"d", 660=>"d#", 690=>"e", 720=>"f", 750=>"f#", 780=>"g", 810=>"g#", 840=>"a", 870=>"a#", 900=>"b", 930=>"c", 960=>"c#", 990=>"d", 1020=>"d#", 1050=>"e", 1080=>"f", 1110=>"f#", 1140=>"g", 1170=>"g#", 1200=>"a", 1230=>"a#"}
    })
  end

  it 'should be able to handle extended range petrucci guitars in random tuning' do
    g = Guitar.new(['f', 'a', 'c', 'e', 'g', 'b', 'f'])
    expect(g.build_strings).to eq({
      1=>{0=>"f", 30=>"f#", 60=>"g", 90=>"g#", 120=>"a", 150=>"a#", 180=>"b", 210=>"c", 240=>"c#", 270=>"d", 300=>"d#", 330=>"e", 360=>"f", 390=>"f#", 420=>"g", 450=>"g#", 480=>"a", 510=>"a#", 540=>"b", 570=>"c", 600=>"c#", 630=>"d", 660=>"d#", 690=>"e"},
      2 => {120=>"a", 150=>"a#", 180=>"b", 210=>"c", 240=>"c#", 270=>"d", 300=>"d#", 330=>"e", 360=>"f", 390=>"f#", 420=>"g", 450=>"g#", 480=>"a", 510=>"a#", 540=>"b", 570=>"c", 600=>"c#", 630=>"d", 660=>"d#", 690=>"e", 720=>"f", 750=>"f#", 780=>"g", 810=>"g#"},
      3 => {210=>"c", 240=>"c#", 270=>"d", 300=>"d#", 330=>"e", 360=>"f", 390=>"f#", 420=>"g", 450=>"g#", 480=>"a", 510=>"a#", 540=>"b", 570=>"c", 600=>"c#", 630=>"d", 660=>"d#", 690=>"e", 720=>"f", 750=>"f#", 780=>"g", 810=>"g#", 840=>"a", 870=>"a#", 900=>"b"},
      4 => {330=>"e", 360=>"f", 390=>"f#", 420=>"g", 450=>"g#", 480=>"a", 510=>"a#", 540=>"b", 570=>"c", 600=>"c#", 630=>"d", 660=>"d#", 690=>"e", 720=>"f", 750=>"f#", 780=>"g", 810=>"g#", 840=>"a", 870=>"a#", 900=>"b", 930=>"c", 960=>"c#", 990=>"d", 1020=>"d#"},
      5 => {420=>"g", 450=>"g#", 480=>"a", 510=>"a#", 540=>"b", 570=>"c", 600=>"c#", 630=>"d", 660=>"d#", 690=>"e", 720=>"f", 750=>"f#", 780=>"g", 810=>"g#", 840=>"a", 870=>"a#", 900=>"b", 930=>"c", 960=>"c#", 990=>"d", 1020=>"d#", 1050=>"e", 1080=>"f", 1110=>"f#"},
      6 => {540=>"b", 570=>"c", 600=>"c#", 630=>"d", 660=>"d#", 690=>"e", 720=>"f", 750=>"f#", 780=>"g", 810=>"g#", 840=>"a", 870=>"a#", 900=>"b", 930=>"c", 960=>"c#", 990=>"d", 1020=>"d#", 1050=>"e", 1080=>"f", 1110=>"f#", 1140=>"g", 1170=>"g#", 1200=>"a", 1230=>"a#"},
      7 => {720=>"f", 750=>"f#", 780=>"g", 810=>"g#", 840=>"a", 870=>"a#", 900=>"b", 930=>"c", 960=>"c#", 990=>"d", 1020=>"d#", 1050=>"e", 1080=>"f", 1110=>"f#", 1140=>"g", 1170=>"g#", 1200=>"a", 1230=>"a#", 1260=>"b", 1290=>"c", 1320=>"c#", 1350=>"d", 1380=>"d#", 1410=>"e"}
    })
  end
end
