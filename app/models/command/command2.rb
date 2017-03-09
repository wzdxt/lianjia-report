module Command
  class Command2 < RawSqlModel

    def qu(v)
      @qu = v
      self
    end

    def raw_sql
      <<-SQL.strip_heredoc
SELECT
  date_format(时间, '%Y-%m') 月份,
  sum(成交量)                 成交量,
  sum(成交额)                 成交额,
  sum(面积)                  总面积,
  sum(成交额) / sum(面积)       均价
FROM (
       SELECT
         date                   时间,
         count(0) - 1           成交量,
         sum(price)             成交额,
         sum(size)              面积,
         sum(price) / sum(size) 均价
       FROM chengjiao
       WHERE date BETWEEN '2016-01-01' AND now() AND (
         name = '00'
         OR (
           qu = '#{@qu}'
         )
       )
       GROUP BY date
     ) t
GROUP BY date_format(时间, '%Y-%m')
      SQL
    end
  end

end
