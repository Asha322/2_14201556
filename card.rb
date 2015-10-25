class Card
  @rank

  attr_reader :rank

  def initialize(s)
    @rank = s
  end

  def to_s
    @rank
  end
end
