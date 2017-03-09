class WechatsController < ActionController::Base
  # For details on the DSL available within this file, see https://github.com/Eric-Guo/wechat#rails-responder-controller-dsl
  wechat_responder

  on :text do |request, content|
    request.reply.text "用法不对哦"
  end

  on :text, with: /^1\s*$/u do |request|
    request.reply.text "<a href='#{Settings.report_root_url}/commands/1'>全城每月成交记录</a>"
  end

  on :text, with: /^2\s+([[:word:]]+)\s*$/u do |request, qu|
    request.reply.text "<a href='#{Settings.report_root_url}/commands/2/#{qu}'>#{qu}区每月成交记录</a>"
  end

end
