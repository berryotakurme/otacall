class Scraping
require 'uri'
  def self.angerme_scraping
    agent = Mechanize.new
    page = agent.get('http://www.uta-net.com/search/?Aselect=1&Bselect=3&Keyword=%83X%83}%83C%83%8C%81[%83W&sort=5')
    elements = page.search('.side.td1 a')

    elements.each do |ele|
      title = ele.inner_text
      song = Song.where(name: title, artist_id: 3, display: 1).first_or_initialize
      song.save
    end
  end

  def self.morning_scraping
    agent = Mechanize.new
    num = 1
    #自分で入力
    while true do
      next_url = "http://www.uta-net.com/search/?Aselect=1&Bselect=3&Keyword=%83%82%81[%83j%83%93%83O%96%BA%81B&sort=5&pnum=#{num}"
      page = agent.get(next_url)
      elements = page.search('.side.td1 a')

      elements.each do |ele|
        title = ele.inner_text
        song = Song.where(name: title, artist_id: 2).first_or_initialize
        song.save
      end

      links = []
      next_page = page.search('#page_list a')
      next_page.each do |test|
        links << test.inner_text
      end

      links.each do |string|
        break if string != ">"
      end
      # next_link = page.search('#page_list a')
      # next_url = next_link.get_attribute('href')
      num += 1

      puts num

    end
  end

  def self.cute_scraping
    agent = Mechanize.new
    page = agent.get('http://www.uta-net.com/search/?Aselect=1&Bselect=1&Keyword=%81%8E-ute&sort=5')
    elements = page.search('.side.td1 a')

    elements.each do |ele|
      title = ele.inner_text
      song = Song.where(name: title, artist_id: 1).first_or_initialize
      song.save
    end
  end

  def self.juice_scraping
    agent = Mechanize.new
    page = agent.get('http://www.uta-net.com/search/?Aselect=1&Bselect=3&Keyword=juice=juice&sort=5')
    elements = page.search('.side.td1 a')

    elements.each do |ele|
      title = ele.inner_text
      song = Song.where(name: title, artist_id: 4).first_or_initialize
      song.save
    end
  end

  def self.country_scraping
    agent = Mechanize.new
    page = agent.get('http://www.uta-net.com/search/?Aselect=1&Bselect=3&Keyword=%83J%83%93%83g%83%8A%81[%96%BA%81B&sort=5')
    elements = page.search('.side.td1 a')

    elements.each do |ele|
      title = ele.inner_text
      song = Song.where(name: title, artist_id: 5).first_or_initialize
      song.save
    end
  end

  def self.kobushi_scraping
    agent = Mechanize.new
    page = agent.get('http://www.uta-net.com/artist/18072/5/')
    elements = page.search('.side.td1 a')

    elements.each do |ele|
      title = ele.inner_text
      song = Song.where(name: title, artist_id: 6).first_or_initialize
      song.save
    end
  end

  def self.tsubaki_scraping
    agent = Mechanize.new
    page = agent.get('#')
    elements = page.search('.side.td1 a')

    elements.each do |ele|
      title = ele.inner_text
      song = Song.where(name: title, artist_id: 7).first_or_initialize
      song.save
    end
  end

  def self.buono_scraping
    agent = Mechanize.new
    page = agent.get('http://www.uta-net.com/search/?Aselect=1&Bselect=3&Keyword=buono!&sort=5')
    elements = page.search('.side.td1 a')

    elements.each do |ele|
      title = ele.inner_text
      song = Song.where(name: title, artist_id: 8, display: 1).first_or_initialize
      song.save
    end
  end

  def self.berryz_scraping
    agent = Mechanize.new
    page = agent.get('http://www.uta-net.com/search/?Aselect=1&Bselect=3&Keyword=berryz%8DH%96[&sort=5')
    elements = page.search('.side.td1 a')

    elements.each do |ele|
      title = ele.inner_text
      song = Song.where(name: title, artist_id: 9, display: 1).first_or_initialize
      song.save
    end
  end

end