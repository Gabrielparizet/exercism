defmodule LibraryFees do
  def datetime_from_string(string) do
    NaiveDateTime.from_iso8601!(string)
  end

  def before_noon?(datetime) do
    Time.compare(NaiveDateTime.to_time(datetime), ~T[12:00:00]) == :lt
  end

  def return_date(checkout_datetime) do
    case before_noon?(checkout_datetime) do
      true -> do_return_date(checkout_datetime, 28)
      false -> do_return_date(checkout_datetime, 29)
    end
  end

  defp do_return_date(checkout_datetime, days_number) do
    checkout_datetime
    |> NaiveDateTime.add(days_number*24*3600)
    |> NaiveDateTime.to_date()
  end

  def days_late(planned_return_date, actual_return_datetime) do
    return_datetime_to_date = NaiveDateTime.to_date(actual_return_datetime)
    days_late = Date.diff(return_datetime_to_date, planned_return_date)
    case days_late >= 1 do
      true -> days_late
      _ -> 0
    end
  end

  def monday?(datetime) do
    datetime
    |> NaiveDateTime.to_date()
    |> Date.day_of_week() == 1
  end

  def calculate_late_fee(checkout, return, rate) do
    checkout_date = datetime_from_string(checkout)
    return_date = datetime_from_string(return)
    case monday?(return_date) do
      true -> do_calculate_fee(checkout_date, return_date, rate*0.5) |> trunc
      false -> do_calculate_fee(checkout_date, return_date, rate)
    end
  end

  defp do_calculate_fee(checkout, return, rate) do
    planned_return_date = return_date(checkout)
    days_late = days_late(planned_return_date, return)
    days_late * rate
  end

end
