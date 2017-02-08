require '../ch1/movie'
require '../ch1/rental'

# 비디오 대여점 고객
class Customer
  attr_reader :name

  def initialize(name)
    @name = name
    @rentals = []
  end

  def add_rental(arg)
    @rentals << arg
  end

  def statement
    total_amount = 0
    frequent_renter_points = 0
    result = "고객 #{@name}의 대여 기록\n"

    @rentals.each do |element|
      this_amount = amount_for(element)

      # 적립 포인트를 더함
      frequent_renter_points += 1

      # 최신물을 이틀 이상 대여하면 보너스 포인트를 더함
      if element.movie.price_code == Movie.NEW_RELEASE && element.days_rented > 1
        frequent_renter_points += 1
      end

      # 이번 대여의 계산 결과를 표시
      result += "\t" + element.movie.title + "\t" + this_amount.to_s + "\n"
      total_amount += this_amount
    end

    # 푸터 행 추가
    result += "대여료는 #{total_amount}입니다.\n"
    result += "적립 포인트는 #{frequent_renter_points} 입니다."
    result
  end

  def amount_for(rental)
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
end
