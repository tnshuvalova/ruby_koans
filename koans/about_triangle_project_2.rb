require File.expand_path(File.dirname(__FILE__) + '/edgecase')

# You need to write the triangle method in the file 'triangle.rb'
require 'triangle.rb'

class AboutTriangleProject2 < EdgeCase::Koan
  # The first assignment did not talk about how to handle errors.
  # Let's handle that part now.
  class TriangleError < RuntimeError
  end
  
  def triangle(a,b,c)
  
	if a*b*c==0
		raise TriangleError
	end

	if a<0 || c<0 || b<0
		raise TriangleError
	end

	args=[a,b,c].sort

	if args[2] >= (args[0] + args[1])
		raise TriangleError
	end

    if a==b || a==c || b==c
      if a==b && a==c
         return:equilateral
      end
      return :isosceles
    end
    :scalene
  end

  def test_illegal_triangles_throw_exceptions
    assert_raise(TriangleError) do triangle(0, 0, 0) end
    assert_raise(TriangleError) do triangle(3, 4, -5) end
    assert_raise(TriangleError) do triangle(1, 1, 3) end
    assert_raise(TriangleError) do triangle(2, 4, 2) end
    # HINT: for tips, see http://stackoverflow.com/questions/3834203/ruby-koan-151-raising-exceptions
 end
end

