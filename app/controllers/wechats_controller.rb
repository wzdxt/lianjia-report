class WechatsController < ActionController::Base
  # For details on the DSL available within this file, see https://github.com/Eric-Guo/wechat#rails-responder-controller-dsl
  wechat_responder

  on :text do |request, content|
    request.reply.text "echo: #{content}" # Just echo
  end

  on :text, with: /^1\s+([[:word:]]+)\s*$/u do |request, qu|
    request.reply.text "<a href='#{Settings.report_root_url}/commands/1/#{qu}'>点击查看</a>"
  end

  on :text, with: /^2\s+([[:word:]]+)\s+([[:word:]]+)\s*$/u do |request, content, c2|
    request.reply.text "url: #{content} #{c2}"
  end
end
