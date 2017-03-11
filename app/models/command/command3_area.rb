module Command
  # 调价历史
  class Command3Area < RawSqlModel

    def area(v)
      @area = v
      self
    end

    def raw_sql
      <<-SQL.strip_heredoc
SELECT
  h.qu                                  区,
  h.bankuai                             板块,
  h.xiaoqu                              小区,
  h.name                                房产,
  date_format(p.created_at, '%y-%m-%d') 时间,
  p.price - p_prev.price                差价,
  p_prev.price                          调价前,
  p.price                               调价后,
  p.unit_price                          单价,
  p.unit_price - p_prev.unit_price      单价差
FROM ershoufang h
  LEFT JOIN ershoufang_price p ON h.id = p.ershoufang_id
  JOIN ershoufang_price p_prev ON p_prev.id = p.prev_id
  JOIN xiaoqu xq ON h.xiaoqu_page_id = xq.page_id
WHERE h.xiaoqu = '#{@area}' OR h.bankuai = '#{@area}' OR h.qu = '#{@area}'
ORDER BY xq.id, h.id, p.id
     SQL
    end
  end

end
