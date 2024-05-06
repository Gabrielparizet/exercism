=begin
Write your code for the 'Raindrops' exercise in this file. Make the tests in
`raindrops_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/raindrops` directory.
=end
class Raindrops

    def self.convert(number)
        if number % 105 == 0
            return "PlingPlangPlong"
        elsif number % 15 == 0
            return "PlingPlang"
        elsif number % 21 == 0
            return "PlingPlong"
        elsif number % 35 == 0
            return "PlangPlong"
        elsif number % 3 == 0
            return "Pling"
        elsif number % 5 == 0
            return "Plang"
        elsif number % 7 == 0
            return "Plong"
        else
            return number.to_s
        end
    end
end
