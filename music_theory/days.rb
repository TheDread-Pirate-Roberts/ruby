require 'rspec'
require 'date'

def foo
  Date.new.jd - Date.new(1991, 4, 23).jd   
end

describe '' do
  it '' do
    expect(foo).to eq(10415)
  end
end
