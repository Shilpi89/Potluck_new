module EventsHelper
  def total_fund_amt id
    amt = Participant.new.fund_amount(id)
    amt
  end
end
