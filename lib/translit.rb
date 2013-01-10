# encoding: utf-8
module Translit
  def translit (string)
    table = {
      "ё"=>"yo","№"=>"#",
      "а"=>"a","б"=>"b","в"=>"v","г"=>"g",
      "д"=>"d","е"=>"e","ж"=>"zh","з"=>"z",
      "и"=>"i","й"=>"y","к"=>"k","л"=>"l",
      "м"=>"m","н"=>"n","о"=>"o","п"=>"p","р"=>"r",
      "с"=>"s","т"=>"t","у"=>"u","ф"=>"f","х"=>"h",
      "ц"=>"ts","ч"=>"ch","ш"=>"sh","щ"=>"sch","ъ"=>"'",
      "ы"=>"yi","ь"=>"","э"=>"e","ю"=>"yu","я"=>"ya"
    }

    string = string.mb_chars.downcase

    table.each do |translation|
      string.gsub!(/#{translation[0]}/, translation[1])
    end

    string.parameterize
  end
end
