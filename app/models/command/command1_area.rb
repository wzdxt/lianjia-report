module Command
  # 区域每月成交记录
  class Command1Area < RawSqlModel

    def area(v)
      @area = v
      self
    end

    def raw_sql
      <<-SQL.strip_heredoc
SELECT
  date_format(时间, '%Y-%m')  yuefen,
  sum(成交量)                 chengjiaoliang,
  sum(成交额)                 chengjiaoe,
  sum(面积)                   zongmianji,
  sum(成交额) / sum(面积)      junjia
FROM (
       SELECT
         date                   时间,
         count(0) - 1           成交量,
         sum(price)             成交额,
         sum(size)              面积,
         sum(price) / sum(size) 均价
       FROM chengjiao
       WHERE date BETWEEN '2016-03-01' AND now() AND (
         name = '00'
         OR (
           qu = '#{@area}'
           OR bankuai = '#{@area}'
         )
       )
       GROUP BY date
     ) t
GROUP BY date_format(时间, '%Y-%m')
      SQL
    end
  end

end
