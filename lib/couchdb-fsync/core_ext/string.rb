class String
  def indent(prefix)
    lines.map{|line| [prefix, line].join}.join
  end
end
