# encoding:utf-8
require File.expand_path('../../lib/solar_terms', __FILE__)
require "rspec"

describe "SolarTerms" do
  before :each do
    @current_time = Time.new(2012,11,22,5,50,5,"+08:00")
  end

  context 'solar_term' do
    it 'should return the index of current solar term' do 
      @current_time.solar_term.should == 21
      (@current_time - 3).solar_term.should == 20
    end
  end

  context 'solar_term_name' do
    it 'should return the name of current solar term' do 
      @current_time.solar_term_name.should == "小雪"
      (@current_time - 3).solar_term_name.should == "立冬"
    end
  end

  context 'solar_term_time' do
    it 'should return a UTC time' do 
      @current_time.solar_term_time.utc?.should be_true
      @current_time.solar_term_time.should == @current_time - 2
    end
  end

  context "solar_term_seconds" do
    it "should return seconds from term-begin to current time" do
      @current_time.solar_term_seconds.should == 2
    end
  end
end