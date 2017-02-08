require '../ch1/movie'

# 영화를 대여중인 고객을 나타낸다
class Rental
  attr_reader :movie, :days_rented

  def initialize(movie, days_rented)
    @movie = movie
    @days_rented = days_rented
  end

  def change
    # 영화 종류별 내용을 각각 구함
    result = 0

    case rental.movie.price_code
      when Movie::REGULAR
        result += 2
        result += (rental.days_rented - 2) * 1.5 if rental.days_rented > 2
      when Movie::NEW_RELEASE
        result += rental.days_rented * 3
      when Movie::CHILDRENS
        result += 1.5
        result += (rental.days_rented - 3) * 1.5 if rental.days_rented > 3
    end
    result
  end

  def frequent_renter_points
    (movie.price_code == Movie.NEW_RELEASE && days_rented > 1) ? 2 : 1
  end
end
