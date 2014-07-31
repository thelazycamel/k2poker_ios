module NumberHelper

  def formatted_score(score)
    rmq.format.number(score, "$###,###,###,###,###,##0")
  end

end
