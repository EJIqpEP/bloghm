module TagsHelper
  def tag_cloud
    @tag_cloud = Array.new
    Tag.all.each do |tag|
      count = tag.posts.published.count

      if count >= 1
        if count.between?(1,3)
          size = 1
        elsif count.between?(4,6)
          size = 2
        elsif count.between?(7,10)
          size = 3
        else
          size = 4
        end

        @tag_cloud.push([size, tag])
      end

    end
    @tag_cloud = @tag_cloud.sort_by{|x,y|x}.reverse.first(30)
  end
end
