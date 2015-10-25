class Card
  @rank

  attr_reader :rank

  def initialize_random
    init_array = %w{Two Three Four Five Six Seven Eight Nine Ten Jack Queen King Ace}
    @rank = init_array[rand(13)]
  end

  def initialize(s)
    @rank = s
  end

  def to_s
    return @rank
  end
end
