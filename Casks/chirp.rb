cask "chirp" do
  version "20260403"
  sha256 "eeef045b5e6ac9f8bd702175ec41d0eb5d2ded0db66e8602f4fc320bc8f89760"

  url "https://archive.chirpmyradio.com/chirp_next/next-#{version}/chirp-next-#{version}.app.zip",
      referer:    "https://archive.chirpmyradio.com/chirp_next/next-#{version}/",
      user_agent: :fake
  name "CHIRP"
  desc "Tool for programming amateur radio"
  homepage "https://chirpmyradio.com/projects/chirp/wiki/Home"

  # TODO: `user_agent` customization, though present, doesn't take
  # effect for `livecheck`. Until this is fixed in underlying code,
  # `livecheck` won't work out of the box. 2 approaches of version
  # probing are documented for that day. For now we rely on separate
  # curl calls to retrieve latest version number.

  livecheck do
    url "https://archive.chirpmyradio.com/chirp_next/",
        referer:    "https://archive.chirpmyradio.com",
        user_agent: "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) " \
                    "AppleWebKit/537.36 (KHTML, like Gecko) " \
                    "Chrome/122.0.0.0 Safari/537.36"
    regex(/next-(\d{8})/i)
    strategy :page_match
  end

  # livecheck do
  #   url "https://archive.chirpmyradio.com/download?stream=next",
  #       header: 'User-Agent: "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) ' \
  #               'AppleWebKit/537.36 (KHTML, like Gecko) ' \
  #               'Chrome/122.0.0.0 Safari/537.36"',
  #       referer: "https://archive.chirpmyradio.com"
  #       # user_agent: "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) " \
  #                     "AppleWebKit/537.36 (KHTML, like Gecko) " \
  #                     "Chrome/122.0.0.0 Safari/537.36"
  #
  #   # Use header_match to follow the redirect chain
  #   strategy :header_match do |headers, url|
  #     # 'url' represents the final URL after all redirects.
  #     # Example: https://archive.chirpmyradio.com/chirp_next/next-20260206
  #
  #     # We extract the date digits that appear after 'next-'
  #     url.to_s[/next-(\d{8})/, 1]
  #   end
  # end

  app "CHIRP.app"

  zap trash: "~/.chirp"
end
