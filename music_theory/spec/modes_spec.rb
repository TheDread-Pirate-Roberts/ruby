require 'spec_helper'
require 'modes'

describe 'Modes' do
  let(:subject) { Modes.new('c') }
  let(:c) { {0=>"c", 30=>"c#", 60=>"d", 90=>"d#", 120=>"e", 150=>"f", 180=>"f#", 210=>"g", 240=>"g#", 270=>"a", 300=>"a#", 330=>"b", 360=>"c", 390=>"c#", 420=>"d", 450=>"d#", 480=>"e", 510=>"f", 540=>"f#", 570=>"g", 600=>"g#", 630=>"a", 660=>"a#", 690=>"b"} }

  it 'should initialize a Modes class' do
    expect(subject.class).to eq(Modes)
  end

  it 'should have a key' do
    expect(subject.key.class).to eq(Hash)
  end

  it 'should have a key with degrees and note values' do
    expect(subject.key).to eq(c)
  end

  it 'should know about the ionian mode' do
    expect(subject.ionian).to eq(%w(c d e f g a b c))
  end

  it 'should know about the dorian mode' do
    expect(subject.dorian).to eq(%w(c d d# f g a a# c))
  end

  it 'should know about the phrygian mode' do
    expect(subject.phrygian).to eq(%w(c c# d# f g g# a# c))
  end

  it 'should calucate the lydian mode' do
    expect(subject.lydian).to eq(%w(c d e f# g a b c))
  end

  it 'should calculate the mixolydian mode' do
    expect(subject.mixolydian).to eq(%w(c d e f g a a# c))
  end

  it 'should calculate the aolian mode' do
    expect(subject.aolian).to eq(%w(c d d# f g g# a# c))
  end

  it 'should calculate the locrian mode' do
    expect(subject.locrian).to eq(%w(c c# d# f f# g# a# c))
  end
end