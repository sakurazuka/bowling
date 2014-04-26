require 'rubygems'
require 'rspec'

require_relative 'bowling'

describe Bowling do
  let(:do_calc){ Bowling.new.calc(@data) }

  it 'スコアを返す' do
    @data = [[5,3],[7,2],[8,'/'],['X'],[7,1],[9,'-'],[6,2],['X'],[6,'/'],[8,'-']]
    do_calc.should eq 126
  end
  it 'スコアを返す' do
    @data = [['-','-'], ['X'], [8,'/'],['X'],['X'],['X'],[5,3],[8,'/'],['X'],['X','X','X']]
    do_calc.should eq 201
  end
  it 'スコアを返す' do
    @data = [[7,'/'],[9,'-'],[8,1],['X'],[5,'/'],[3,3],['X'],['X'],[5,3],[4,'/',9]]
    do_calc.should eq 146
  end
  it 'スコアを返す' do
    @data = [[6,3],[9,'-'],['-',3],[8,'/'],[7,'/'],['X'],[9,'/'],[8,'-'],['X'],['X',6,'/']]
    do_calc.should eq 150
  end
end
