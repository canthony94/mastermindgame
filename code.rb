class Code
  
  attr_reader :pegs
  
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  def self.valid_pegs?(chars)
    chars.all? {|char| POSSIBLE_PEGS.has_key?(char.upcase)}
  end

  def self.random(length)
    random_array = []
    length.times {random_array << POSSIBLE_PEGS.keys.sample}
    Code.new(random_array)
  end

  def self.from_string(str)
    strsplit = str.split("")
    Code.new(strsplit)
  end

  def initialize(arr)
    if Code.valid_pegs?(arr) == false
      raise "this is not a valid sequence, you must input 'R', 'G', 'B', 'Y'" 
    else
      @pegs = arr.map(&:upcase)
    end
  end

  def [](index)
    @pegs[index]
  end

  def length
    @pegs.length
  end

  def num_exact_matches(guess_code)
    count = 0

    (0...guess_code.length).each do |i|
      count += 1 if guess_code[i] == @pegs[i]
    end
    count
  end

  def num_near_matches(guess_code)
    count = 0
    (0...guess_code.length).each do |i|
      if guess_code[i] != @pegs[i] && @pegs.include?(guess_code[i])
        count += 1
      end
    end
    count
  end

  def ==(guess_code)
    return guess_code == @pegs
  end
end
