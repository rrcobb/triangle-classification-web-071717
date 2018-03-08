class TriangleError < StandardError; end

class Triangle
  attr_accessor :a, :b, :c

  def initialize(a, b, c)
    @a = a
    @b = b
    @c = c
  end

  # triangle inequality: a + b > c, a + c > b, b + c > a
  def triangle_inequality_violated?
    a + b <= c || b + c <= a || a + c <= b
  end

  def kind
    if a <= 0 || b <= 0 || c <= 0 || triangle_inequality_violated?
      raise TriangleError
    elsif a == b && b == c
      :equilateral
    elsif b == c || a == b || a == c
      :isosceles
    else
      :scalene
    end
  end
end
