=begin
Write your code for the 'Hamming' exercise in this file. Make the tests in
`hamming_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/hamming` directory.
=end
class Hamming

    def self.compute(strand_1, strand_2)
        if strand_1.length != strand_2.length
            raise ArgumentError 
        else 
            strand_1.chars.zip(strand_2.chars).count { |str1, str2| str1 != str2}
        end
    end

end
