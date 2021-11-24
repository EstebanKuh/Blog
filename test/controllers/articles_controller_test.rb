require "test_helper"

class ArticlesControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  test "index exitoso" do
    get articles_path
    assert_response :success
  end

  test "POST crear: Crear un artículo" do
    assert_difference 'Article.count', 1 do
      post articles_path, params: {article: {title:"TestTitulo", body: "TestText"}}
    end

    assert_redirected_to article_url(Article.last)
  end

end
