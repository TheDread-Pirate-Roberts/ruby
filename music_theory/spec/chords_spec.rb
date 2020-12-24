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

  context 'Major Chords' do
    it 'should generate the major chord' do
      expect(subject.chords[:major][:notes]).to eq(%w(c e g))
    end

    it 'should generate the major sixth chord' do
      expect(subject.chords[:major_sixth][:notes]).to eq(%w(c e g a))
    end

    it 'should generate the major six over nine chord' do
      expect(subject.chords[:major_six_nine][:notes]).to eq(%w(c e g a d))
    end

    it 'should generate the major seventh chord' do
      expect(subject.chords[:major_seventh][:notes]).to eq(%w(c e g b))
    end

    it 'should generate the major nineth chord' do
      expect(subject.chords[:major_nineth][:notes]).to eq(%w(c e g b d))
    end

    it 'should generate the major eleventh chord' do
      expect(subject.chords[:major_eleventh][:notes]).to eq(%w(c e g b d f))
    end

    it 'should generate the major thirteenth chord' do
      expect(subject.chords[:major_thirteenth][:notes]).to eq(%w(c e g b d f a))
    end
  end

  context 'Minor chords' do
    it 'should generate the minor chord' do
      expect(subject.chords[:minor][:notes]).to eq(%w(c d# g))
    end

    it 'should generate the minor sixth chord' do
      expect(subject.chords[:minor_sixth][:notes]).to eq(%w(c d# g a))
    end

    it 'should generate the minor seventh chord' do
      expect(subject.chords[:minor_seventh][:notes]).to eq(%w(c d# g a#))
    end

    it 'should generate the minor major seventh chord' do
      expect(subject.chords[:minor_major_seventh][:notes]).to eq(%w(c d# g b))
    end

    it 'should generate the minor nineth chord' do
      expect(subject.chords[:minor_nineth][:notes]).to eq(%w(c d# g a# d))
    end

    it 'should generate the minor eleventh chord' do
      expect(subject.chords[:minor_eleventh][:notes]).to eq(%w(c d# g a# d f))
    end

    it 'should generate the minor thirteenth chord' do
      expect(subject.chords[:minor_thirteenth][:notes]).to eq(%w(c d# g a# d f a))
    end
  end

  context 'Dominant chords' do
    it 'should generate the dominant seventh chord' do
      expect(subject.chords[:dominant_seventh][:notes]).to eq(%w(c e g a#))
    end

    it 'should generate the dominant nineth chord' do
      expect(subject.chords[:dominant_nineth][:notes]).to eq(%w(c e g a# d))
    end

    it 'should generate the dominant eleventh chord' do
      expect(subject.chords[:dominant_eleventh][:notes]).to eq(%w(c e g a# d f))
    end

    it 'should generate the dominant thirteenth chord' do
      expect(subject.chords[:dominant_thirteenth][:notes]).to eq(%w(c e g a# d f a))
    end
  end

  context 'Diminished chords' do
    it 'should generate the diminished chord' do
      expect(subject.chords[:diminished][:notes]).to eq(%w(c d# f#))
    end

    it 'should generate the diminished seventh chord' do
      expect(subject.chords[:diminished_seventh][:notes]).to eq(%w(c d# f# a))
    end

    it 'should generate the half diminished chord' do
      expect(subject.chords[:half_diminished][:notes]).to eq(%w(c d# f# a#))
    end
  end

  context 'Augmented chords' do
    it 'should generate the augmented chord' do
      expect(subject.chords[:augmented][:notes]).to eq(%w(c e g#))
    end

    it 'should generate the augmented seventh chord' do
      expect(subject.chords[:augmented_seventh][:notes]).to eq(%w(c e g# a#))
    end
  end

  context 'Suspeneded chords' do
    it 'should generate the sus2 chord' do
      expect(subject.chords[:sus_2][:notes]).to eq(%w(c d g))
    end

    it 'should generate the sus4 chord' do
      expect(subject.chords[:sus_4][:notes]).to eq(%w(c f g))
    end

    it 'should generate the seven sus4 chord' do
      expect(subject.chords[:seven_sus_4][:notes]).to eq(%w(c f g a#))
    end

    it 'should generate the sus add 9 chord' do
      expect(subject.chords[:sus_add9][:notes]).to eq(%w(c e g d))
    end

    it 'should generate the sus add 11 chord' do
      expect(subject.chords[:sus_add11][:notes]).to eq(%w(c e g f))
    end
  end

  # context 'Triads' do
    #todo
  # end

  context 'Switching modes to be able to generate chords in different modes' do
    let(:subject) { Chords.new('c', 'dorian') }
    it 'should be able to switch modes' do
      expect(subject.dorian).to eq(%w(c d d# f g a a# c))
    end

    it 'should generate the major chord' do
      expect(subject.chords[:major][:notes]).to eq(%w(c d# g))
    end

    it 'should generate the minor chord' do
      expect(subject.chords[:minor][:notes]).to eq(%w(c d g))
    end

    it 'should generate the dominant seventh chord' do
      expect(subject.chords[:dominant_seventh][:notes]).to eq(%w(c d# g a))
    end

    it 'should generate the diminished chord' do
      expect(subject.chords[:diminished][:notes]).to eq(%w(c d f#))
    end

    it 'should generate the augmented chord' do
      expect(subject.chords[:augmented][:notes]).to eq(%w(c d# g#))
    end

    it 'should generate the sus2 chord' do
      expect(subject.chords[:sus_2][:notes]).to eq(%w(c d g))
    end
  end
end
