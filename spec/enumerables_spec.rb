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
      expect(actual.my_map(&multi)).to eql([4, 10, 14, 6, 8])
    end
  end
    
  describe '#my_inject' do
    let(:actual) { [2, 5, 7, 3, 4] }
    let(:accum){ 0 }
      
    it 'Sums elements in an array' do
      accum = actual.my_inject(365){|x,y|  x + y }
      expect(accum).to eql(386)
    end
      
    it 'Multiply elements in an array' do
      accum = actual.my_inject(934){|x,y|  x * y }
      expect(accum).to eql(784560)
    end
      
    it 'Divdes elements in an array' do
      accum = actual.my_inject(10){|x,y|  x / y }
      expect(accum).to eql(0)
    end
  end
    
  describe '#my_count' do
    let(:actual) { [2, 5, 7, 3, 4, 3] }
      
    it 'counts the length of the array' do
      length = actual.my_count
      expect(length).to eql(6)   
    end
      
    it 'counts the length of the array' do
      length = actual.my_count
      expect(length).to eql(6)   
    end
      
    it 'counts odd values in array' do
      length = actual.my_count(&:odd?)
      expect(length).to eql(4)   
    end
      
    it 'counts values in array' do
      length = actual.my_count(3)
      expect(length).to eql(2)   
    end
      
    it 'counts values without remainders' do
      length = actual.my_count{|x| x % 2 == 0}
      expect(length).to eql(2)   
    end
  end
    
end # end of Enumerable Module
