module Command
  # 每日调价趋势
  class Command2Area < RawSqlModel

    def area(v)
      @area = v
      self
    end

    def raw_sql
      <<-SQL.strip_heredoc
SELECT
  date_format(时间, '%y-%m-%d') 时间,
  sum(调幅)                     总差额,
  sum(abs(调幅) + 调幅) / 2       上调,
  sum(abs(调幅) - 调幅) / 2       下调,
  sum(面积) /100                `总面积`,
  sum(调幅) / sum(面积) * 100     单价差
FROM (
       SELECT
         p.created_at           时间,
         p.price - p_prev.price 调幅,
         h.size                 面积
       FROM ershoufang_price p
         JOIN ershoufang_price p_prev ON p.prev_id = p_prev.id
         JOIN ershoufang h ON p.ershoufang_id = h.id
         JOIN xiaoqu xq ON h.xiaoqu_page_id = xq.page_id
       WHERE (h.xiaoqu = '#{@area}' OR h.bankuai = '#{@area}' OR h.qu = '#{@area}')
     ) t
GROUP BY date_format(时间, '%y-%m-%d')
      SQL
    end
  end

end
