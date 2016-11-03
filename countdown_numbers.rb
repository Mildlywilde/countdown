$count = 0

def countdown(num_array, target, algorithm = "")
  #does current array include target?

  if num_array.include?(target)
    #If it does return the algorithm string
    return algorithm

  # elsif num_array.length == 1
  #   return false
  else
    #create new array, 1 step from current

    # add two numbers, push product to array and delete used numbers
    num_array.each_with_index do |num1, index|
      num_array[(index + 1)..-1].each do |num2|
        $count += 1
        new_array = num_array.collect {|x| x }
        new_array << (num1 + num2)
        new_array.delete(num1)
        new_array.delete(num2)

        # add operation to algorithm string
        new_algorithm = algorithm + "#{num1} + #{num2} = #{num1 + num2}, "

        # puts num_array[(index + 1)..-1], '|', num_array, new_algorithm

        # if calling method on the new array does not equal false return the value of that method call (algorithm string)
        if countdown(new_array, target, new_algorithm) != false
          return countdown(new_array, target, new_algorithm)
        else
          next
        end
      end
    end

    #repeat addition step with multiplication
    num_array.each_with_index do |num1, index|
      num_array[(index + 1)..-1].each do |num2|
        $count += 1
        new_array = num_array.collect {|x| x }
        new_array << (num1 * num2)
        new_array.delete(num1)
        new_array.delete(num2)

        new_algorithm = algorithm + "#{num1} * #{num2} = #{num1 * num2}, "

        # puts num_array[(index + 1)..-1], '|', num_array, new_algorithm

        if countdown(new_array, target, new_algorithm) != false
          return countdown(new_array, target, new_algorithm)
        else
          next
        end
      end
    end

    # subtraction step
    num_array.each do |num1|
      new_array = num_array.collect {|x| x}
      new_array.delete(num1)
      new_array.each do |num2|
        $count += 1
        new_new_array = new_array.collect {|x| x}
        if num1 - num2 > 0
          new_new_array << (num1 - num2)
          new_new_array.delete(num2)

          new_algorithm = algorithm + "#{num1} - #{num2} = #{num1 - num2}, "

          if countdown(new_new_array, target, new_algorithm) != false
            return countdown(new_new_array, target, new_algorithm)
          else
            next
          end
        else
          next
        end

      end
    end

    # division step
    num_array.each do |num1|
      new_array = num_array.collect {|x| x}
      new_array.delete(num1)
      new_array.each do |num2|
        $count += 1
        new_new_array = new_array.collect {|x| x}
        if num1 % num2 == 0 && num1 / num2 != 0
          new_new_array << (num1 / num2)
          new_new_array.delete(num2)

          new_algorithm = algorithm + "#{num1} / #{num2} = #{num1 / num2}, "

          if countdown(new_new_array, target, new_algorithm) != false
            return countdown(new_new_array, target, new_algorithm)
          else
            next
          end
        else
          next
        end
      end

    end

    false
  end
end

puts countdown([1, 1, 2, 2, 3, 3], 101)
puts $count
