require_relative '../matching_algorithm'
require_relative '../matching_subject'
require 'rspec/expectations'

RSpec::Matchers.define :be_totally_unmatchable do
  match do |actual|
    actual == -1
  end
  failure_message do |actual|
    "expected #{actual} to be totally unmatchable"
  end
end

RSpec::Matchers.define :be_totally_matchable do
  match do |actual|
    actual >= 0 && actual <= 100
  end
  failure_message do |actual|
    "expected #{actual} to be totally matchable"
  end
end

RSpec::Matchers.define :be_absolutely_matchable do
  match do |actual|
    actual == 100
  end
  failure_message do |actual|
    "expected #{actual} to be absolutely matchable"
  end
end


describe MatchingAlgorithm do
  context 'when it is any other human being on the planet' do
    let(:regular_subject) { MatchingSubject.new('Some', 'Guy') }
    it 'should be totally matchable' do
      expect(described_class.new(regular_subject).match).to be_totally_matchable
    end
  end

  context 'when it is Ted Mosby' do
    let(:schmosby) { MatchingSubject.new('Ted', 'Mosby') }
    it 'is totally unmatchable' do
      expect(described_class.new(schmosby).match).to be_totally_unmatchable
    end

    it 'is not totally matchable' do
      expect(described_class.new(schmosby).match).to_not be_totally_matchable
    end
  end

  context 'when it is Barney Stinon' do
    let(:the_barnacle) { MatchingSubject.new('Barney', 'Stinson') }
    it 'is totally absolutely matchable' do
      expect(described_class.new(the_barnacle).match).to be_absolutely_matchable
    end

    it 'is not totally_unmatchable' do
      expect(described_class.new(the_barnacle).match).to_not be_totally_unmatchable
    end
  end
end
