class Recommend
    include ActiveModel::Model
    attr_accessor :datas

    def get_data(data)
        url_params = data
        agent = Mechanize.new
        page = agent.get("https://www.717450.net/search/result#{url_params}")
        datas_data = page.search('figure a img')
        @datas = datas_data.map do |data|
            data.get_attribute(:src)
        end
    end
end