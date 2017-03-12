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
  h.qu                                  qu,
  h.bankuai                             bankuai,
  h.xiaoqu                              xiaoqu,
  h.name                                fangchan,
  date_format(p.created_at, '%y-%m-%d') shijian,
  p.price - p_prev.price                chajia,
  p_prev.price                          tiaojiaqian,
  p.price                               tiaojiahou,
  p.unit_price                          danjia,
  p.unit_price - p_prev.unit_price      danjiacha
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
