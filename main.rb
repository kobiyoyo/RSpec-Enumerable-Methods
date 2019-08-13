module Enumerable
  def my_each
    for i in 0...length
      yield(self[i])
    end
  end

  def my_each_with_index
    for i in 0...length
      yield(self[i], i)
    end
  end

  def my_select
    new_array = []
    my_each do |x|
      new_array << x if yield(x)
    end
    new_array
  end

  def my_all?
    return true unless block_given?
    my_each do |x|
      return false unless yield(x)
      return true
    end
  end

  def my_any?
    my_each do |x|
      if yield(x)
        return true
      else
        return false
      end
    end
  end

  def my_none?
    my_each do |x|
      if yield(x)
        return false
      else
        return true
      end
    end
  end

  def my_count(args = nil)
    if args
      count = 0
      each do |x|
        count += 1 if x == args
      end
      return count
    end
    counter = 0
    my_each do |x|
      if !block_given?
        return length
      elsif yield(x)
        counter += 1
      end
    end
    counter
  end

  def my_map
    new_arry = []
    my_each do |x|
      new_arry << yield(x)
    end
    new_arry
  end

  def my_inject(args = nil)
    accum = if args
              args
            else
              self[0]
            end
    each do |x|
      next if accum == x
      accum = yield(accum, x)
    end
    accum
  end
end
