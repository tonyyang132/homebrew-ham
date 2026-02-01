cask 'chirp' do
  version '20260123'
  sha256 '841a4c2e2792f797da0a578fd0ca0f39cbfa57e3206763916b092fc76d14334c'

  url "https://archive.chirpmyradio.com/chirp_next/next-#{version}/chirp-next-#{version}.app.zip",
      verified: 'archive.chirpmyradio.com/',
      referer: "https://archive.chirpmyradio.com/chirp_next/next-#{version}/"
  name 'CHIRP'
  desc 'Tool for programming amateur radio'
  homepage 'https://chirpmyradio.com/projects/chirp/wiki/Home'

  livecheck do
    url 'https://archive.chirpmyradio.com/chirp_next/'
    regex(/next-(\d{8})/i)
    strategy :page_match
  end

  app 'CHIRP.app'

  zap trash: '~/.chirp'
end
