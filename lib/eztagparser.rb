require "eztagparser/version"

module Eztagparser
  class Error < StandardError; end
  def self.eztag(string)
    if string.is_a? String
    else
      raise "eztag error: passing argument is not string type"
    end
    indexs = []
    hash = {}
    tag_list = string.split(/[<>]/).reject {|x| x.empty? or x == " "}
    temp = []
    tags = []
    start = 0
    tag_list.each do |x|
      if temp.length > 0 and temp[start] == x.sub(/[\/]/,"")
        if temp[start..temp.length - 1].length == 1
          tags << {temp[start..temp.length - 1][0] => tag_list[tag_list.index(temp[start..temp.length - 1].last) + 1].strip}
        else
          tags << temp[start..temp.length - 1].reverse.inject(tag_list[tag_list.index(temp[start..temp.length - 1].last) + 1].strip) { |a, n| { n => a } }
        end
        start = start + temp[start..temp.length].length
      end
      tag_list.each do |y|
        if x == y.sub(/[\/]/,"") and y[0] == "/"
          temp << x
          indexs << [tag_list.index(x),tag_list.index(y)]
        end
      end
    end
     return tags[0] if tags.length == 1
     return tags
  end
end
