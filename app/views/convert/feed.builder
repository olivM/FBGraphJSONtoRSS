
xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "FaceBook Status for '#{@q}'"
    xml.link @feed_url

    for post in @data
      if post['type'] == 'status'
        xml.item do
          xml.title post['from']['name']
          xml.description post['message']
          xml.pubDate post['created_time']
#        xml.link post_url(post)
        end
      end
    end
  end
end