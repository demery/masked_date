require 'spec_helper'

describe MaskedDate do
  it 'has a version number' do
    expect(MaskedDate::VERSION).not_to be nil
  end

  context MaskedDate::Date do
    it "creates a y-m-d date" do
      expect(MaskedDate::Date.new(y: 1971, m: 3, d: 31).to_a).to eq([1971, 3, 31])
    end

    it "creates a y-m date" do
      expect(MaskedDate::Date.new(y: 1971, m: 3).to_a).to eq([1971, 3, nil])
    end

    it "creates a y date" do
      expect(MaskedDate::Date.new(y: 1971).to_a).to eq([1971, nil, nil])
    end

    it "creates a m-d date" do
      expect(MaskedDate::Date.new(m: 3, d: 31).to_a).to eq([nil, 3, 31])
    end

    it "creates a y-m-d with m-d override mask" do
      expect(MaskedDate::Date.new({y: 1971, m: 3, d: 31}, 6).to_a).to eq([nil, 3, 31])
    end

    it "creates a m-d with y-m-d override mask" do
      expect(MaskedDate::Date.new({m: 3, d: 31}, 6).to_a).to eq([nil, 3, 31])
    end

  end
end
