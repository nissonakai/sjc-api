class Recommend
    include ActiveModel::Model
    attr_accessor :data

    def scrape_data(list)
    target_data = []
    agent = Mechanize.new
    list.each do |num|
        page = agent.get("https://www.717450.net/search/detail/#{num}.html")
        title = page.at("h1.heading01").inner_text
        content = page.at("p.boxTitle").inner_text
        points = page.at("div.boxInner").search("li")
        point1 = points[0].inner_text
        point2 = points[1].inner_text
        data = {
            title: title,
            content: content,
            points: [point1, point2],
            wages: []
        }
        target_classes = ["wages", "location", "shift", "holiday"]
        treatment = page.at('div.jobTreatment')
        target_classes.each do |class_name|
            elements = treatment.search("p.#{class_name}")
            elements.each do |ele|
                if data[class_name.to_sym]
                    data[class_name.to_sym].push(ele.inner_text)
                else
                    data[class_name.to_sym] = ele.inner_text
                end
                    
            end
        end
        target_data.push(data)
    end
    @data = target_data
end

end