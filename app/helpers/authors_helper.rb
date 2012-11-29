module AuthorsHelper
  def github_url(name)
    link_to name, "http://github.com/#{name}"
  end

  def gravatar(author)
    gravatar_id = author.gravatar_id
    url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=42&d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-user-420.png"
  end
end
