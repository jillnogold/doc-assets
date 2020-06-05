########################################
## URL Redirects - root directory of the docs staging site (non-versioned)
# [ci-redirect] [InfraInfo] See gulpfile.js in the doc-site repo.

# [InfraInfo] (sharonl) The source URL starts with "/docs" => RedirectMatch
# with a starts-with rule should begin with "^/docs".

#///////////////////////////////////////
# Redirect old versioned sections URLs (<section>/<version>/ where <version> is
# "vX.Y" or "latest-release") to <version>/<section>
# <section>/vX.Y/* > latest-release/)
RedirectMatch 301 ^/(docs)/(concepts|intro|reference|specs|tutorials)/(v[0-9]\.[0-9]|latest-release)(|/.*)$ https://igzdocsdev.wpengine.com/$1/$3/$2$4

# Redirect old non-versioned section pages (such as release-notes/*) and all
# section root-directory URLs (<section>/ - after the <section>/<version>/
# redirect) to latest-release/<section>/*
RedirectMatch 301 ^/(docs)/(concepts|intro|reference|release-notes|specs|tutorials)(|/.*)$ https://igzdocsdev.wpengine.com/$1/latest-release/$2/$3

#///////////////////////////////////////
# Redirect latest-release version-number URLs (/v<X.Y/X.Y.Z (latest release)>/*
# > /latest-release/*)
# [TODO-NEW-VER] Update the hardcoded version number in the source URL.
RedirectMatch 301 ^/(docs)/v2.8(\.[0-9]|)(|/.*)$ https://igzdocsdev.wpengine.com/$1/latest-release/$3

#///////////////////////////////////////
## Relocated-Pages Redirects
# [ci-redirect-from-ver-site] [InfraInfo] See gulpfile.js in the doc-site repo.

#---------------------------------------
## Temporarily Removed Pages
# [c-arch-page-update] See the IntInfo in the architecture.md intro page.
RedirectMatch 301 ^/(docs/[^/]+)/intro/architecture(|/.*)$ https://igzdocsdev.wpengine.com/$1

#---------------------------------------
## Pages Moved in V2.8

# DNS & SMTP setup intro pages moved to a howto/ subdirectory
RedirectMatch 301 ^/(docs/latest-release/intro/setup)/(dns|smtp)(|/.*)$ https://igzdocsdev.wpengine.com/$1/howto/$2

#---------------------------------------
## Pages Removed for v2.5.4 and v2.3.1 Post Publication

# Trial-QS tutorials GS page (consolidated with the tutorial QS index page)
RedirectMatch 301 ^/(docs/[^/]+/tutorials/getting-started/trial-qs/)overview(|/.*)$ https://igzdocsdev.wpengine.com/$1$2

# Additional-resources" tutorials GS page (moved to an introduction section)
RedirectMatch 301 ^/(docs/[^/]+)/tutorials/getting-started/(additional-resources)(|/.*)$ https://igzdocsdev.wpengine.com/$1/intro/introduction/#$2

