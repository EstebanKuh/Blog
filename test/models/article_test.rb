require "test_helper"

class ArticleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  test "Creación artículo sin título" do
    article = Article.new
    assert_not article.save
  end

  test "Artículos publicados" do
    articles = Article.published
    assert_equal 1, articles.length

    assert_equal articles(:publicados).id, articles[2].id
  end

  test "Título Ruby" do
    assert_equal "RubyTitle", articles(:ruby).title
  end
end
