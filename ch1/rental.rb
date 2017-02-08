require '../ch1/movie'

# 영화를 대여중인 고객을 나타낸다
class Rental
  attr_reader :movie, :days_rented

  def initialize(movie, days_rented)
    @movie = movie
    @days_rented = days_rented
  end

  def charge
    # 영화 종류별 내용을 각각 구함
    movie.charge(days_rented)
  end

  def frequent_renter_points
    movie.frequent_renter_points(days_rented)
  end
end
