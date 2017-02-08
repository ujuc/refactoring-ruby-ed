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
    frequent_renter_points = 0
    result = "고객 #{@name}의 대여 기록\n"

    @rentals.each do |element|
      # 적립 포인트를 더함
      frequent_renter_points += element.frequent_renter_points

      # 이번 대여의 계산 결과를 표시
      result += "\t" + element.movie.title + "\t" + element.change.to_s + "\n"
    end

    # 푸터 행 추가
    result += "대여료는 #{total_charge}입니다.\n"
    result += "적립 포인트는 #{frequent_renter_points} 입니다."
    result
  end

  private

  def total_charge
    @rentals.inject(0) { |sum, rental| sum + rental.charge }
  end
end
