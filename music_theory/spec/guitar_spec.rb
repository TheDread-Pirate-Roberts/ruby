require 'spec_helper'
require 'guitar'

describe 'Guitar' do

  let(:subject) { Guitar.new(['e', 'a', 'd', 'g', 'b', 'e']) }

  let(:standard_musical_pi) {
    {
      0=>"e", 30=>"f", 60=>"f#", 90=>"g", 120=>"g#", 150=>"a", 180=>"a#", 210=>"b", 240=>"c", 270=>"c#", 300=>"d", 330=>"d#", 360=>"e", 390=>"f", 420=>"f#", 450=>"g", 480=>"g#", 510=>"a", 540=>"a#", 570=>"b", 600=>"c", 630=>"c#", 660=>"d", 690=>"d#"
    }
  }

  let(:standard_guitar) {
    {
      1 => {0=>"e", 30=>"f", 60=>"f#", 90=>"g", 120=>"g#", 150=>"a", 180=>"a#", 210=>"b", 240=>"c", 270=>"c#", 300=>"d", 330=>"d#", 360=>"e", 390=>"f", 420=>"f#", 450=>"g", 480=>"g#", 510=>"a", 540=>"a#", 570=>"b", 600=>"c", 630=>"c#", 660=>"d", 690=>"d#"},
      2 => {150=>"a", 180=>"a#", 210=>"b", 240=>"c", 270=>"c#", 300=>"d", 330=>"d#", 360=>"e", 390=>"f", 420=>"f#", 450=>"g", 480=>"g#", 510=>"a", 540=>"a#", 570=>"b", 600=>"c", 630=>"c#", 660=>"d", 690=>"d#", 720=>"e", 750=>"f", 780=>"f#", 810=>"g", 840=>"g#"},
      3 => {300=>"d", 330=>"d#", 360=>"e", 390=>"f", 420=>"f#", 450=>"g", 480=>"g#", 510=>"a", 540=>"a#", 570=>"b", 600=>"c", 630=>"c#", 660=>"d", 690=>"d#", 720=>"e", 750=>"f", 780=>"f#", 810=>"g", 840=>"g#", 870=>"a", 900=>"a#", 930=>"b", 960=>"c", 990=>"c#"},
      4 => {450=>"g", 480=>"g#", 510=>"a", 540=>"a#", 570=>"b", 600=>"c", 630=>"c#", 660=>"d", 690=>"d#", 720=>"e", 750=>"f", 780=>"f#", 810=>"g", 840=>"g#", 870=>"a", 900=>"a#", 930=>"b", 960=>"c", 990=>"c#", 1020=>"d", 1050=>"d#", 1080=>"e", 1110=>"f", 1140=>"f#"},
      5 => {570=>"b", 600=>"c", 630=>"c#", 660=>"d", 690=>"d#", 720=>"e", 750=>"f", 780=>"f#", 810=>"g", 840=>"g#", 870=>"a", 900=>"a#", 930=>"b", 960=>"c", 990=>"c#", 1020=>"d", 1050=>"d#", 1080=>"e", 1110=>"f", 1140=>"f#", 1170=>"g", 1200=>"g#", 1230=>"a", 1260=>"a#"},
      6 => {720=>"e", 750=>"f", 780=>"f#", 810=>"g", 840=>"g#", 870=>"a", 900=>"a#", 930=>"b", 960=>"c", 990=>"c#", 1020=>"d", 1050=>"d#", 1080=>"e", 1110=>"f", 1140=>"f#", 1170=>"g", 1200=>"g#", 1230=>"a", 1260=>"a#", 1290=>"b", 1320=>"c", 1350=>"c#", 1380=>"d", 1410=>"d#"}
    }
  }

  let(:alternate_tuning_guitar) {
    {
      1 => {0=>"f", 30=>"f#", 60=>"g", 90=>"g#", 120=>"a", 150=>"a#", 180=>"b", 210=>"c", 240=>"c#", 270=>"d", 300=>"d#", 330=>"e", 360=>"f", 390=>"f#", 420=>"g", 450=>"g#", 480=>"a", 510=>"a#", 540=>"b", 570=>"c", 600=>"c#", 630=>"d", 660=>"d#", 690=>"e"},
      2 => {120=>"a", 150=>"a#", 180=>"b", 210=>"c", 240=>"c#", 270=>"d", 300=>"d#", 330=>"e", 360=>"f", 390=>"f#", 420=>"g", 450=>"g#", 480=>"a", 510=>"a#", 540=>"b", 570=>"c", 600=>"c#", 630=>"d", 660=>"d#", 690=>"e", 720=>"f", 750=>"f#", 780=>"g", 810=>"g#"},
      3 => {210=>"c", 240=>"c#", 270=>"d", 300=>"d#", 330=>"e", 360=>"f", 390=>"f#", 420=>"g", 450=>"g#", 480=>"a", 510=>"a#", 540=>"b", 570=>"c", 600=>"c#", 630=>"d", 660=>"d#", 690=>"e", 720=>"f", 750=>"f#", 780=>"g", 810=>"g#", 840=>"a", 870=>"a#", 900=>"b"},
      4 => {330=>"e", 360=>"f", 390=>"f#", 420=>"g", 450=>"g#", 480=>"a", 510=>"a#", 540=>"b", 570=>"c", 600=>"c#", 630=>"d", 660=>"d#", 690=>"e", 720=>"f", 750=>"f#", 780=>"g", 810=>"g#", 840=>"a", 870=>"a#", 900=>"b", 930=>"c", 960=>"c#", 990=>"d", 1020=>"d#"},
      5 => {420=>"g", 450=>"g#", 480=>"a", 510=>"a#", 540=>"b", 570=>"c", 600=>"c#", 630=>"d", 660=>"d#", 690=>"e", 720=>"f", 750=>"f#", 780=>"g", 810=>"g#", 840=>"a", 870=>"a#", 900=>"b", 930=>"c", 960=>"c#", 990=>"d", 1020=>"d#", 1050=>"e", 1080=>"f", 1110=>"f#"},
      6 => {540=>"b", 570=>"c", 600=>"c#", 630=>"d", 660=>"d#", 690=>"e", 720=>"f", 750=>"f#", 780=>"g", 810=>"g#", 840=>"a", 870=>"a#", 900=>"b", 930=>"c", 960=>"c#", 990=>"d", 1020=>"d#", 1050=>"e", 1080=>"f", 1110=>"f#", 1140=>"g", 1170=>"g#", 1200=>"a", 1230=>"a#"}
    }
  }

  let(:extended_range_guitar) {
    {
      1 => {0=>"f", 30=>"f#", 60=>"g", 90=>"g#", 120=>"a", 150=>"a#", 180=>"b", 210=>"c", 240=>"c#", 270=>"d", 300=>"d#", 330=>"e", 360=>"f", 390=>"f#", 420=>"g", 450=>"g#", 480=>"a", 510=>"a#", 540=>"b", 570=>"c", 600=>"c#", 630=>"d", 660=>"d#", 690=>"e"},
      2 => {120=>"a", 150=>"a#", 180=>"b", 210=>"c", 240=>"c#", 270=>"d", 300=>"d#", 330=>"e", 360=>"f", 390=>"f#", 420=>"g", 450=>"g#", 480=>"a", 510=>"a#", 540=>"b", 570=>"c", 600=>"c#", 630=>"d", 660=>"d#", 690=>"e", 720=>"f", 750=>"f#", 780=>"g", 810=>"g#"},
      3 => {210=>"c", 240=>"c#", 270=>"d", 300=>"d#", 330=>"e", 360=>"f", 390=>"f#", 420=>"g", 450=>"g#", 480=>"a", 510=>"a#", 540=>"b", 570=>"c", 600=>"c#", 630=>"d", 660=>"d#", 690=>"e", 720=>"f", 750=>"f#", 780=>"g", 810=>"g#", 840=>"a", 870=>"a#", 900=>"b"},
      4 => {330=>"e", 360=>"f", 390=>"f#", 420=>"g", 450=>"g#", 480=>"a", 510=>"a#", 540=>"b", 570=>"c", 600=>"c#", 630=>"d", 660=>"d#", 690=>"e", 720=>"f", 750=>"f#", 780=>"g", 810=>"g#", 840=>"a", 870=>"a#", 900=>"b", 930=>"c", 960=>"c#", 990=>"d", 1020=>"d#"},
      5 => {420=>"g", 450=>"g#", 480=>"a", 510=>"a#", 540=>"b", 570=>"c", 600=>"c#", 630=>"d", 660=>"d#", 690=>"e", 720=>"f", 750=>"f#", 780=>"g", 810=>"g#", 840=>"a", 870=>"a#", 900=>"b", 930=>"c", 960=>"c#", 990=>"d", 1020=>"d#", 1050=>"e", 1080=>"f", 1110=>"f#"},
      6 => {540=>"b", 570=>"c", 600=>"c#", 630=>"d", 660=>"d#", 690=>"e", 720=>"f", 750=>"f#", 780=>"g", 810=>"g#", 840=>"a", 870=>"a#", 900=>"b", 930=>"c", 960=>"c#", 990=>"d", 1020=>"d#", 1050=>"e", 1080=>"f", 1110=>"f#", 1140=>"g", 1170=>"g#", 1200=>"a", 1230=>"a#"},
      7 => {720=>"f", 750=>"f#", 780=>"g", 810=>"g#", 840=>"a", 870=>"a#", 900=>"b", 930=>"c", 960=>"c#", 990=>"d", 1020=>"d#", 1050=>"e", 1080=>"f", 1110=>"f#", 1140=>"g", 1170=>"g#", 1200=>"a", 1230=>"a#", 1260=>"b", 1290=>"c", 1320=>"c#", 1350=>"d", 1380=>"d#", 1410=>"e"}
    }
  }

  it 'should be a guitar' do
    expect(subject.class).to eq(Guitar)
  end

  it 'should accept a tuning' do
    expect(subject.tuning.class).to eq(Array)
    expect(subject.tuning).to eq(['e', 'a', 'd', 'g', 'b', 'e'])
  end

  it 'should inhert from the MusicalAlphabet class' do
    expect(subject.inital_ma).to eq(['a','a#','b', 'c', 'c#', 'd', 'd#', 'e', 'f', 'f#', 'g', 'g#'])
  end

  it 'should build the guitar tuning from the musical_alphabet' do
    subject.index_ma(subject.tuning[0])
    subject.musical_alphabet
    subject.translate

    expect(subject.musical_pi).to eq(standard_musical_pi)
  end

  it 'should build the musical alphabet on all the guitars strings' do
    expect(subject.build_strings).to eq(standard_guitar)
  end

  it 'should be able to handle alternate tuning' do
    subject = Guitar.new(['f', 'a', 'c', 'e', 'g', 'b'])
    expect(subject.build_strings).to eq(alternate_tuning_guitar)
  end

  it 'should be able to handle extended range guitars in random tuning' do
    subject = Guitar.new(['f', 'a', 'c', 'e', 'g', 'b', 'f'])
    expect(subject.build_strings).to eq(extended_range_guitar)
  end
end
