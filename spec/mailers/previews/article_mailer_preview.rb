class ArticleMailerPreview < ActionMailer::Preview
  def article_created
    article = FactoryBot.create(:article)
    ArticleMailer.article_created(article)
  end

  def article_deleted
    article = FactoryBot.create(:article)
    ArticleMailer.article_deleted(article)
  end

  def article_updated
    article = FactoryBot.create(:article)
    ArticleMailer.article_updated(article)
  end    
end
