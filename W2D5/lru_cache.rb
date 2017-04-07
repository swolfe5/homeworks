class LRUCache
  def initialize(n)
    @limit = n
    @cache = []
  end

  def count
    @cache.count
  end

  def add(el)
    @cache.delete(el) if @cache.include?(el)
    @cache.delete_at(0) if count == @limit
    @cache << el
  end

  def show
    @cache
  end
end
