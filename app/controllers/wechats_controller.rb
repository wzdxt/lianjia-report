class WechatsController < ActionController::Base
  # For details on the DSL available within this file, see https://github.com/Eric-Guo/wechat#rails-responder-controller-dsl
  wechat_responder

  on :text do |request, content|
    request.reply.text "用法不对哦"
  end

  on :text, with: /^0\s+([[:word:]]+)\s*$/u do |request, qu|
    request.reply.text "<a href='#{Settings.report_root_url}/commands/0/#{qu}'>#{qu} 区小区列表</a>"
  end

  on :text, with: /^1\s*$/u do |request|
    request.reply.text "<a href='#{Settings.report_root_url}/commands/1'>上海每月成交记录</a>"
  end

  on :text, with: /^1\s+([[:word:]]+)\s*$/u do |request, area|
    request.reply.text "<a href='#{Settings.report_root_url}/commands/1/#{area}'>#{area} 区(板块)每月成交记录</a>"
  end

  on :text, with: /^2\s*$/u do |request|
    request.reply.text "<a href='#{Settings.report_root_url}/commands/2'>每日调价趋势</a>"
  end

  on :text, with: /^2\s+([[:word:]]+)\s*$/u do |request, area|
    request.reply.text "<a href='#{Settings.report_root_url}/commands/2/#{area}'>#{area} 每日调价趋势</a>"
  end

  on :text, with: /^3\s+([[:word:]]+)\s*$/u do |request, area|
    request.reply.text "<a href='#{Settings.report_root_url}/commands/3/#{area}'>#{area} 调价历史</a>"
  end




  on :text, with: /^9999\s*$/u do |request|
    request.reply.text "<a href='#{Settings.report_root_url}/monitors/index'>监控页面</a>"
  end


end
