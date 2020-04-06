class Result
    include ActiveModel::Model
    attr_accessor :email, :age, :job, :wage, :sex, :prefecture_id, :dormitory, :answers, :result_id, :result_title, :recommend

    def area_id
        return dormitory ? 0 : Prefecture.find(prefecture_id).area_id
    end

    def area_name
        return Area.find(area_id).name 
    end

    def area_url
        return "https://www.717450.net/search/result?category=#{Area.find(area_id).param}&disp_type=1"
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