class Triangle

  attr_accessor :side1, :side2, :side3

  def initialize(side1, side2, side3)
    @side1 = side1
    @side2 = side2
    @side3 = side3
    @sides = [side1, side2, side3]
  end

  def kind
    if !illegal_triangle
      if side1 == side2 && side2 == side3
        :equilateral
      elsif side1 == side2 || side1 == side3 || side2 == side3
        :isosceles
      elsif side1 != side2 && side2 != side3 && side1 != side3
        :scalene
      end
    end
  end

  def illegal_triangle
    org_sides = @sides.sort
    if org_sides.any? { |x| x <= 0 }
      raise TriangleError
    elsif org_sides[0] + org_sides[1] <= org_sides[2]
      raise TriangleError
   end
 end

  class TriangleError < StandardError
  end

end
