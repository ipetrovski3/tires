module ClientsHelper
  def time_mod
    t = Time.now
    t.strftime('%Y')
  end
end
