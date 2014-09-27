require 'spec_helper'

require_relative '../lib/ally/detector/street'

describe Ally::Detector::Street do

  context 'detect a street' do
    it 'when there is none' do
      subject.inquiry('nothing').detect.should.nil?
    end

    it 'in a simple case' do
      subject.inquiry('dupoint circle')
        .detect.should == ['dupoint circle']
    end

    it 'in a sentence' do
      subject.inquiry('how can i get to 285 old westport rd?')
        .detect.should == ['old westport road']
    end

    it 'when multiple exist' do
      subject.inquiry('yeah, its over on south street or kingston blvd, i can\'t remember')
        .detect.should == ['south street', 'kingston boulevard']
    end

    it 'when street is mentioned, but not an actual street' do
      subject.inquiry('yeah its over on another street')
        .detect.should.nil?
    end
  end

end
