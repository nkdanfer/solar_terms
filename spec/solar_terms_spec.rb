# encoding:utf-8
require "solar_terms"
require "rspec"

describe "SolarTerms" do
  before :each do
    @current_time = Time.new(2012,11,22,5,50,07,"+08:00") 
  end

  context 'solar_term' do
    it 'should return the index of current solar term' do 
      @current_time.solar_term.should == 21
      (@current_time - 1).solar_term.should == 20
    end
  end

  context 'solar_term_name' do
    it 'should return the name of current solar term' do 
      @current_time.solar_term_name.should == "小雪"
      (@current_time - 1).solar_term_name.should == "立冬"
    end
  end

  context 'solar_term_time' do
    it 'should return a UTC time' do 
      @current_time.solar_term_time.utc?.should be_true
    end
  end
end