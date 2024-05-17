=begin
Write your code for the 'Luhn' exercise in this file. Make the tests in
`luhn_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/luhn` directory.
=end
class Luhn 
    def initialize(string)
        @string = string
    end

    def valid?(@string)
        if @string.length <= 1
            false 
        else
            
        end
end