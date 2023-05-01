class ArticleMailer < ApplicationMailer
  def article_created(article)
    @email = article.user.email
    @title = article.title

    mail(to: @email)
  end

  def article_deleted(article)
    @email = article.user.email
    @title = article.title

    mail(to: @email)
  end

  def article_updated(article)
    @email = article.user.email
    @title = article.title

    mail(to: @email)
  end
end
