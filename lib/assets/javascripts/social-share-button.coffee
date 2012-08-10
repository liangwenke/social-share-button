window.SocialShareButton =
  openUrl : (url) ->
    window.open(url)
    false

  share : (el) ->
    site = $(el).data('site')
    title = encodeURIComponent($(el).parent().data('title'))
    img = encodeURIComponent($(el).parent().data("img"))
    url = encodeURIComponent($(el).parent().data("link") || location.href)

    switch site
      when "weibo"
        title = title + '  - 更多快乐分享 请关注 @哈皮士网 - '
      when "tqq"
        title = title + '  - 更多快乐分享 请收听 @hapishiv - '
      else
        title = title + '   ❤ 更多快乐分享 请访问哈皮士网： '

    switch site
      when "weibo"
        SocialShareButton.openUrl("http://v.t.sina.com.cn/share/share.php?url=#{url}&pic=#{img}&title=#{title}&content=utf-8")
      when "twitter"
        SocialShareButton.openUrl("https://twitter.com/home?status=#{title}: #{url}")
      when "douban"
        SocialShareButton.openUrl("http://www.douban.com/recommend/?image=#{img}&url=#{url}&title=#{title}&v=1&r=1")
      when "facebook"
        SocialShareButton.openUrl("http://www.facebook.com/sharer.php?t=#{title}&u=#{url}")
      when "qq"
        SocialShareButton.openUrl("http://sns.qzone.qq.com/cgi-bin/qzshare/cgi_qzshare_onekey?url=#{url}&title=#{title}&pics=#{img}")
      when "tqq"
        SocialShareButton.openUrl("http://share.v.t.qq.com/index.php?c=share&a=index&url=#{url}&title=#{title}&pic=#{img}")
      when "t163"
        SocialShareButton.openUrl("http://t.163.com/article/user/checkLogin.do?url=#{url}&info=#{title}-#{url}&images=#{img}")
      when "tsohu"
        SocialShareButton.openUrl("http://t.sohu.com/third/post.jsp?url=#{url}&title=#{title}&pic=#{img}")
    false