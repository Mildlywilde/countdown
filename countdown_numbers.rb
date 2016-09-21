def countdown(num_array, target, algorithm = "")
  #does current array include target?

  if num_array.include?(target)
    #If it does return the algorithm string
    return algorithm

  elsif num_array.length > 1
    #create new array, 1 step from current

    # add two numbers, push product to array and delete used numbers
    num_array.each_with_index do |num1, index|
      num_array[(index + 1)..-1].each do |num2|
        new_array = num_array.collect {|x| x }
        new_array << (num1 + num2)
        new_array.delete(num1)
        new_array.delete(num2)

        # add operation to algorithm string
        new_algorithm = algorithm + "#{num1} + #{num2} = #{num1 + num2}, "

        # puts new_array

        # if calling method on the new array does not equal false return the value of that method call (algorithm string)
        if countdown(new_array, target, new_algorithm) != false
          return countdown(new_array, target, new_algorithm)
        else
          break
        end
      end
    end

    # repeat addition step with multiplication
    num_array.each_with_index do |num1, index|
      num_array[(index + 1)..-1].each do |num2|
        new_array = num_array.collect {|x| x }
        new_array << (num1 * num2)
        new_array.delete(num1)
        new_array.delete(num2)

        new_algorithm = algorithm + "#{num1} * #{num2} = #{num1 * num2}, "

        if countdown(new_array, target, new_algorithm) != false
          return countdown(new_array, target, new_algorithm)
        else
          return false
        end
      end
    end

  else
    return false
  end
end

puts countdown([3, 5, 10, 4], 320)
