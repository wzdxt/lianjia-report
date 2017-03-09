class RawSqlModel
  def initialize(page, limit=50)
    @page = page.to_i
    @limit = limit.to_i
  end

  def current_page
    @page
  end

  def total_pages
    res = execute(to_count_sql)
    total = res[0].values[0]
    (total.to_f / @limit).ceil
  end

  def limit_value
    @limit
  end

  def offset
    (@page - 1) * @limit
  end

  def all
    @_all ||= execute(to_sql)
  end

  def execute(sql)
    ActiveRecord::Base.connection.exec_query(sql)
  end

  def raw_sql
    <<-SQL.strip_heredoc
select distinct on (applicant_number) applicant_number, created_at, account_id from sms_messages
where account_id = 147
order by applicant_number, created_at DESC
    SQL
  end

  def to_sql
    <<-SQL.strip_heredoc
select * from (#{raw_sql}) t
limit #{@limit} offset #{offset}
    SQL
  end

  def to_count_sql
    <<-SQL.strip_heredoc
select count(0) from (#{raw_sql}) count_t
    SQL
  end
end