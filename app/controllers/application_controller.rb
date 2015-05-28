class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
# ##定时任务  # 每天6点执行一次
# require 'rufus-scheduler'
# scheduler = Rufus::Scheduler.new
# scheduler.cron '0 6 * * *' do

##数据抓取
    require 'nokogiri'  
    require 'open-uri' 
    @doc = Nokogiri::HTML(open('http://www.wangdaizhijia.com', 'User-Agent' => 'firefox'))
    i = 1
    @doc.css(".topColumnList a").each do |link|
        a_title = link.text
        a_href = link['href']
        if i <= 10
            column = Column.first
            contents = Nokogiri::HTML(open(a_href, 'User-Agent' => 'firefox'))
            content = contents.css(".aritcle_txt")
            if column.present?
                data = Column.find_by(id: i)
                data.title = a_title
                data.url = a_href
                data.content = content
                data.save
            else
                columns = Column.create(title: a_title, url: a_href ,status: 1)
            end
        end
        i += 1
    end  

# end
# scheduler.join   #die

##批量删除
# for value in 136..155
#     user = Column.find_by(id:value)
#     user.destroy
# end

##定时任务  #每秒执行一次
# require 'rufus-scheduler'
# scheduler = Rufus::Scheduler.new
# puts Time.new
# scheduler.every '1s' do
#   puts Time.new
#   puts 'Hello... Word'
# end
# scheduler.join

##在特定的cron时间执行 #每分钟执行一次
# require 'rufus-scheduler'
# scheduler = Rufus::Scheduler.new
# puts Time.new
# puts 'process begin----'
# scheduler.cron '/1 * * * *' do
#   puts Time.new
#   puts 'Hello word'
# end
# scheduler.join





end
