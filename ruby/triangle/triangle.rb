=begin
Write your code for the 'Triangle' exercise in this file. Make the tests in
`triangle_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/triangle` directory.
=end
class Triangle
    def initialize(sides)
      @sides = sides
    end
  
    def equilateral?
      valid? && @sides.uniq.count == 1 
    end

    def isosceles?
        valid? && (@sides.uniq.count == 2 || equilateral?)
    end

    def scalene?
        valid? && !isosceles?
    end

    def valid?
        sorted_sides = @sides.sort
        sorted_sides[0] + sorted_sides[1] >= sorted_sides[2] && sorted_sides.all? { |side| side > 0 }
    end
  end