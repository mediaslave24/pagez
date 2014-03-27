require 'spec_helper'

describe 'Pagez' do
  context 'with ActiveRecord' do
    before do
      50.times do
        Post.create
      end
    end

    after do
      Post.destroy_all
    end

    it 'works well with activerecord' do
      scope = Post.order('created_at desc')
      page = Pagez
        .new(scope, per_page: 5)

      page.to_a.should eq(scope.limit(5).to_a)
      page.page.should eq(1)

      page.total.should eq(10)
    end

    it 'paginates' do
      scope = Post.order('created_at desc')
      page = Pagez
        .new(scope, per_page: 5)
      page.to_page(3)

      page.to_a.should eq(scope.limit(5).offset(10))
      page.page.should eq(3)
      page.total.should eq(10)

      page = Pagez
        .new(scope, per_page: 20)
      page.to_page(3).to_a.should eq(scope.limit(20).offset(40))

      page.to_page(1000).to_a.should eq([])

      page.total.should eq(3)
    end
  end

  it 'works also for arrays too' do
    array = (1..50).to_a
    page = Pagez.new(array, per_page: 10)
    page.to_a.should eq(array.slice(0, 10))
    page.page.should eq(1)

    page.to_page(5).to_a.should eq(array.slice(40, 10))
    page.page.should eq(5)
    page.to_page(100).to_a.should eq([])

    page.total.should eq(5)
  end

  it 'can be converted to hash' do
    array = (1..50).to_a
    page = Pagez.new(array, per_page: 10)
    page.to_h.should eq(
      page: 1,
      per_page: 10,
      items: (1..10).to_a,
      total: 5
    )
  end
end
