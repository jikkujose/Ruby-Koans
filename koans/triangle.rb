# Triangle Project Code.

# Triangle analyzes the lengths of the sides of a triangle
# (represented by a, b and c) and returns the type of triangle.
#
# It returns:
#   :equilateral  if all sides are equal
#   :isosceles    if exactly 2 sides are equal
#   :scalene      if no sides are equal
#
# The tests for this method can be found in
#   about_triangle_project.rb
# and
#   about_triangle_project_2.rb
#
def triangle(a,b,c)
  sides = [a,b,c].sort

  if includes_zero?(sides) ||
     one_side_not_greater_than_the_other_two?(sides) ||
     has_negative_sides?(sides) 
    raise TriangleError
  end

  case sides.uniq.size
  when 1
    :equilateral
  when 2
    :isosceles
  when 3
    :scalene
  end

end

def includes_zero?(sides)
  sides.include?(0)
end

def one_side_not_greater_than_the_other_two?(sides)
  sides[2] >= sides[1] + sides[0]
end

def has_negative_sides?(sides)
  sides.inject(:*) < 0
end

# Error class used in part 2.  No need to change this code.
class TriangleError < StandardError
end
