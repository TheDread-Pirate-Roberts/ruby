require 'spec_helper'
require 'chords'

describe 'Chords' do
  let(:subject) { Chords.new('c') }

  it 'should initialize a Chords class' do
    expect(subject.class).to eq(Chords)
  end

  it 'should inherit from Modes' do
    expect(subject.key.class).to eq(Hash)
  end

  it 'should default to ionian mode' do
    expect(subject.ionian).to eq(%w(c d e f g a b c))
  end

  it 'should generate the one chord' do
    expect(subject.i).to eq(%w(c e g))
  end

  it 'should generate the two chord' do
    expect(subject.ii).to eq(%w(d f a))
  end

  it 'should generate the three chord' do
    expect(subject.iii).to eq(%w(e g b))
  end

  it 'should generate the four chord' do
    expect(subject.iv).to eq(%w(f a c))
  end

  it 'should generate the five chord' do
    expect(subject.v).to eq(%w(g b d))
  end

  it 'should generate the six chord' do
    expect(subject.vi).to eq(%w(a c e))
  end

  it 'should generate the seven chord' do
    expect(subject.vii).to eq(%w(b d f))
  end

  context 'Switching modes to be able to generate chords in different modes' do
    let(:subject) { Chords.new('c', 'dorian') }
    it 'should be able to switch modes' do
      expect(subject.dorian).to eq(%w(c d d# f g a a# c))
    end

    it 'should generate the one chord' do
      expect(subject.i).to eq(%w(c d# g))
    end

    it 'should generate the two chord' do
      expect(subject.ii).to eq(%w(d f a))
    end

    it 'should generate the three chord' do
      expect(subject.iii).to eq(%w(d# g a#))
    end

    it 'should generate the four chord' do
      expect(subject.iv).to eq(%w(f a c))
    end

    it 'should generate the five chord' do
      expect(subject.v).to eq(%w(g a# d))
    end

    it 'should generate the six chord' do
      expect(subject.vi).to eq(%w(a c d#))
    end

    it 'should generate the seven chord' do
      expect(subject.vii).to eq(%w(a# d f))
    end
  end
end