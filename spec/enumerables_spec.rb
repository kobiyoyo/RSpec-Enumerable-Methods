# frozen_string_literal: true

require './main'
describe Enumerable do
  describe '#my_each' do
    let(:actual) { [2, 5, 7] }
    let(:new_array) { [] }
    it "this loops through an array's elements" do
      actual.my_each { |x| new_array << x }
      expect(new_array).to eq(actual)
    end
  end

  describe '#my_each_with_index' do
    let(:actual) { [2, 5, 7] }
    let(:new_array) { [] }
    let(:new_index_array) { [] }

    it 'returns the looped array element with index' do
      actual.my_each_with_index { |x, _y| new_array << x }
      expect(new_array).to eql(actual)
    end

    it 'this returns the index of an array' do
      actual.my_each_with_index { |_x, y| new_index_array << y }
      expect(new_index_array).to eql([0, 1, 2])
    end
  end

  describe '#my_map' do
    let(:actual) { [2, 5, 7, 3, 4] }
    let(:multi) { proc { |x| x * 2 } }

    it 'returns looped elements of an array' do
      expect(actual.map(&multi)).to eql([4, 10, 14, 6, 8])
    end
  end
    
  describe '#my_inject' do
    let(:actual) { [2, 5, 7, 3, 4] }
    let(:add){ 0 }
    let(:multiple){ 0 }
    let(:division){ 0 }
    let(:subtract){ 0 }
      
    it 'Sums elements in an array' do
      multiple = actual.inject(3){|x,y|  x + y }
      expect(multiple).to eql(24)
    end
      
    it 'Sums elements in an array' do
      multiple = actual.inject(3){|x,y|  x + y }
      expect(multiple).to eql(24)
    end
    it 'Sums elements in an array' do
      multiple = actual.inject(3){|x,y|  x + y }
      expect(multiple).to eql(24)
    end
  end
end # end of Enumerable Module
