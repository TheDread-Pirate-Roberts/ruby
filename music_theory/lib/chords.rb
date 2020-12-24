require_relative 'modes'

class Chords < Modes
  attr_reader :mode, :chords

  def initialize(key, mode = 'ionian')
    super(key)
    @mode = send mode
    double_octave
  end

  def double_octave
    @mode = mode[0..-2] * 2 << mode[0]
  end

  def chords
    @chords ||=
    {
      major: major,
      major_sixth: major_sixth,
      major_six_nine: major_six_nine,
      major_seventh: major_seventh,
      major_nineth: major_nineth,
      major_eleventh: major_eleventh,
      major_thirteenth: major_thirteenth,
      minor: minor,
      minor_sixth: minor_sixth,
      minor_seventh: minor_seventh,
      minor_major_seventh: minor_major_seventh,
      minor_nineth: minor_nineth,
      minor_eleventh: minor_eleventh,
      minor_thirteenth: minor_thirteenth,
      dominant_seventh: dominant_seventh,
      dominant_nineth: dominant_nineth,
      dominant_eleventh: dominant_eleventh,
      dominant_thirteenth: dominant_thirteenth,
      diminished: diminished,
      diminished_seventh: diminished_seventh,
      half_diminished: half_diminished,
      augmented: augmented,
      augmented_seventh: augmented_seventh,
      sus_2: sus_2,
      sus_4: sus_4,
      seven_sus_4: seven_sus_4,
      sus_add9: sus_add9,
      sus_add11: sus_add11
    }
  end

  ########### Major ###########
  def major
    { notes: [mode[0], mode[2], mode[4]] }
  end

  def major_sixth
    { notes: [mode[0], mode[2], mode[4], mode[5]] }
  end

  def major_six_nine
    { notes: [mode[0], mode[2], mode[4], mode[5], mode[8]] }
  end

  def major_seventh
    { notes: [mode[0], mode[2], mode[4], mode[6]] }
  end

  def major_nineth
    { notes: [mode[0], mode[2], mode[4], mode[6], mode[8]] }
  end

  def major_eleventh
    { notes: [mode[0], mode[2], mode[4], mode[6], mode[8], mode[10]] }
  end

  def major_thirteenth
    { notes: [mode[0], mode[2], mode[4], mode[6], mode[8], mode[10], mode[12]] }
  end

  ########### Minor ###########

  def minor
    { notes: [mode[0], flat(2), mode[4]] }
  end

  def minor_sixth
    { notes: [mode[0], flat(2), mode[4], mode[5]] }
  end

  def minor_seventh
    { notes: [mode[0], flat(2), mode[4], flat(6)] }
  end

  def minor_major_seventh
    { notes: [mode[0], flat(2), mode[4], mode[6]] }
  end

  def minor_nineth
    { notes: [mode[0], flat(2), mode[4], flat(6), mode[8]] }
  end

  def minor_eleventh
    { notes: [mode[0], flat(2), mode[4], flat(6), mode[8], mode[10]] }
  end

  def minor_thirteenth
    { notes: [mode[0], flat(2), mode[4], flat(6), mode[8], mode[10], mode[12]] }
  end

  ########### Dominant ###########

  def dominant_seventh
    { notes: [mode[0], mode[2], mode[4], flat(6)] }
  end

  def dominant_nineth
    { notes: [mode[0], mode[2], mode[4], flat(6), mode[8]] }
  end

  def dominant_eleventh
    { notes: [mode[0], mode[2], mode[4], flat(6), mode[8], mode[10]] }
  end

  def dominant_thirteenth
    { notes: [mode[0], mode[2], mode[4], flat(6), mode[8], mode[10], mode[12]] }
  end

  ########### Diminished ###########

  def diminished
    { notes: [mode[0], flat(2), flat(4)] }
  end

  def diminished_seventh
    { notes: [mode[0], flat(2), flat(4), flat_flat(6)] }
  end

  def half_diminished
    { notes: [mode[0], flat(2), flat(4), flat(6)] }
  end

  ########### Augmented ###########

  def augmented
    { notes: [mode[0], mode[2], sharp(4)] }
  end

  def augmented_seventh
    { notes: [mode[0], mode[2], sharp(4), flat(6)] }
  end

  ########### Suspended ###########

  def sus_2
    { notes: [mode[0], mode[1], mode[4]] }
  end

  def sus_4
    { notes: [mode[0], mode[3], mode[4]] }
  end

  def seven_sus_4
    { notes: [mode[0], mode[3], mode[4], flat(6)] }
  end

  def sus_add9
    { notes: [mode[0], mode[2], mode[4], mode[8]] }
  end

  def sus_add11
    { notes: [mode[0], mode[2], mode[4], mode[10]] }
  end

  private

  def flat(index)
    note = mode.values_at(index)[0]
    @musical_pi.values_at((@musical_pi.key(note) - 30))[0]
  end

  def flat_flat(index)
    note = mode.values_at(index)[0]
    @musical_pi.values_at((@musical_pi.key(note) - 60))[0]
  end

  def sharp(index)
    note = mode.values_at(index)[0]
    @musical_pi.values_at((@musical_pi.key(note) + 30))[0]
  end
end
