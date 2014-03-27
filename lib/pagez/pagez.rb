class Pages
  attr_reader :page, :per_page

  def initialize(paginatable, options = {})
    @paginatable = paginatable
    @page = nil
    @per_page = options[:per_page] || 10
    @items = []
  end

  def to_page(page)
    page = page.to_i
    page = 1 if page <= 0
    if @page != page
      @page = page
      @items = if defined?(ActiveRecord::Base) && @paginatable.is_a?(ActiveRecord::Base)
                 @paginatable
                   .offset(@per_page * (page - 1))
                   .limit(@per_page)
               else
                 @paginatable.slice((@per_page * (page - 1)), @per_page)
               end
    end
    self
  end

  def total
    (@paginatable.count / per_page.to_f).ceil
  end

  def to_h
    to_page(page)
    {
      page: page,
      per_page: per_page,
      items: to_a,
      total: total
    }
  end

  def to_a
    to_page(page)
    @items.to_a
  end
end
