class ArticleMailerPreview < ActionMailer::Preview
  def article_created
    article = Article.last
    ArticleMailer.article_created(article)
  end

  def article_deleted
    article = Article.last
    ArticleMailer.article_deleted(article)
  end

  def article_updated
    article = Article.last
    ArticleMailer.article_updated(article)
  end    
end
