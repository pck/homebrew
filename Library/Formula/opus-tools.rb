require 'formula'

class OpusTools < Formula
  homepage 'http://www.opus-codec.org'
  url 'http://downloads.xiph.org/releases/opus/opus-tools-0.1.5.tar.gz'
  sha1 '8e952ca1f24cf847f4534c017a64b0823df9ecd0'

  head 'https://git.xiph.org/opus-tools.git'

  if build.head?
    depends_on :automake
    depends_on :libtool
  end

  depends_on 'pkg-config' => :build
  depends_on 'opus'
  depends_on 'libogg'

  def install
    system "./autogen.sh" if build.head?
    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make install"
  end
end
