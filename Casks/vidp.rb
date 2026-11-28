# frozen_string_literal: true

cask "vidp" do
  version "0.18.2"
  sha256 "11e5940ad83ab783ec9b3b312c1ffdf662b01cfc992d1b9014e6125d592a64b0"

  url "https://github.com/vidplabs/vidp/releases/download/v#{version}/vidp.app.zip"
  name "vidp"
  desc "Minimal keyboard-driven video player built on libmpv"
  homepage "https://github.com/vidplabs/vidp"

  depends_on macos: :tahoe

  app "vidp.app"

  # Ad-hoc signed, not notarized, so Gatekeeper blocks the first launch.
  postflight_steps do
    run "/usr/bin/xattr",
        args:         ["-dr", "com.apple.quarantine", "{{appdir}}/vidp.app"],
        must_succeed: false
  end
end
