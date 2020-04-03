class Jobnumber < ApplicationRecord
    validates :number, presence: true, length: { is: 6 }, uniqueness:  {scope: [:category, :area_id]}
    validates :category, presence: true, numericality: { only_integer: true, less_than_or_equal_to: 4 }
    validate :valid_number?
    validate :url_exist?

    def valid_number?
        unless number =~ /[0-9]{6}/
            errors.add(:number, "は6桁の数字で入力してください")
        end
    end

    def url_exist?
        url = URI.parse("https://www.717450.net/search/detail/#{number}.html")
        req = Net::HTTP.new(url.host, url.port)
        req.use_ssl = (url.scheme == "https")
        res = req.request_head(url.path)
        if res.code != "200"
            errors.add(:number, "は存在しないお仕事Noです")
        end
    end

    def self.number_list(category_id, area_id)
        return where(category: category_id, area_id: area_id).map { |num| num.number }
    end

end
