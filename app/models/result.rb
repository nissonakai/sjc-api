class Result
    include ActiveModel::Model
    attr_accessor :email, :age, :job, :wage, :sex, :prefecture_id, :dormitory, :answers, :result_title, :recommend

    def area_category
        if prefecture_id <= 7
            return 1
        elsif prefecture_id <= 14
            return 2
        elsif prefecture_id <= 20
            return 3
        elsif prefecture_id <= 24
            return 4
        elsif prefecture_id <= 30
            return 5
        elsif prefecture_id <= 39
            return 6
        else
            return 7
        end
    end

    def scrape_data(list)
        target_data = []
        agent = Mechanize.new
        base_url = "https://www.717450.net"
        list.each do |num|
            page_link = "#{base_url}/search/detail/#{num}.html"
            page = agent.get(page_link)
            title = page.at("h1.heading01").inner_text
            content = page.at("p.boxTitle").inner_text
            points = page.at("div.boxInner").search("li")
            point1 = points[0].inner_text
            point2 = points[1].inner_text
            image_base = page.at("ul.outLineSubSlider").search("img")[0]["src"]
            image_path = image_base.include?(base_url) ? image_base : base_url + image_base
            data = {
                page_link: page_link,
                title: title,
                content: content,
                points: [point1, point2],
                image_path: image_path,
                wage: []
            }
            target_classes = ["wage", "location", "shift", "holiday"]
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
            @recommend = target_data
        end

end