require_relative "code"

class Mastermind

    def initialize(length)
        @secret_code = Code.random(length)
    end

    def print_matches(guess)
        p "exact matches #{@secret_code.num_exact_matches(guess)}"
        p "near matches #{@secret_code.num_near_matches(guess)}"
        return
    end

    def ask_user_for_guess
        p "Enter a code"
        userguess = gets.chomp
        guess_code = Code.from_string(userguess)
        self.print_matches(guess_code)
        @secret_code == guess_codergby
    end



end
