########################################
## URL Redirects - root directory of the docs-dev staging site (non-versioned)
# [ci-redirect] [InfraInfo] See gulpfile.js in the doc-site repo.
# Some redirects are handled via Hugo aliases in the Markdown front matter.

# [InfraInfo] (sharonl) The source URL starts with "/docs-dev" => RedirectMatch
# with a starts-with rule should begin with "^/docs-dev/".

#///////////////////////////////////////
## Obsolete Multi-Versioned Site URLs

# Redirect old versioned sections URLs (<section>/<version>/ where <version> is
# "vX.Y" or "latest-release") to <version>/<section>
# <section>/vX.Y/* > latest-release/)
RedirectMatch 301 ^/(docs-dev)/(concepts|intro|reference|specs|tutorials)/(v[0-9]\.[0-9]|latest-release)(|/.*)$ https://igzdocsdev.wpengine.com/$1/$3/$2$4

# Redirect old non-versioned section pages (such as release-notes/*) and all
# section root-directory URLs (<section>/ - after the <section>/<version>/
# redirect) to latest-release/<section>/*
RedirectMatch 301 ^/(docs-dev)/(concepts|intro|reference|release-notes|specs|tutorials)(|/.*)$ https://igzdocsdev.wpengine.com/$1/latest-release/$2/$3

#///////////////////////////////////////
## Latest-Release Version-Number URLs
#(/v<X.Y/X.Y.Z (latest release)>/* > /latest-release/*)
# [TODO-NEW-VER] Update the hardcoded version number in the source URL.
RedirectMatch 301 ^/(docs-dev)/v3.0(\.[0-9]|)(|/.*)$ https://igzdocsdev.wpengine.com/$1/latest-release/$3

## Next-Release Version-Number URLs
#(/v<X.Y/X.Y.Z (next minor release)>/* > /latest-release/*)
# [InfraInfo] (sharonl) (12.1.21) It was decided that in order to allow linking
# to the relevant versioned product documentation from external sources - such
# as the product dashboard (UI) and v3io/tutorials - as part of the development
# for the next product release, before we've published related documentation,
# we'll also redirect docs/vX.Y URLs for the next minor release to the latest
# docs.
# [TODO-NEW-VER] Update the hardcoded version number in the source URL.
RedirectMatch 301 ^/(docs-dev)/v3.1(\.[0-9]|)(|/.*)$ https://igzdocsdev.wpengine.com/$1/latest-release/$3

#///////////////////////////////////////
## Removed Old-Release Doc Sites (No Longer Published)
#[InfraInfo] We don't redirect old v1.9-v2.2 URLs, like in docs/.htaccess,
# because these old-release docs were maintained in a docs-archive site whose
# URLs are now redirected to the docs/ site from the root
# sites/igzdocsdev/.htaccess file [ci-docs-archive-redirects].
RedirectMatch 301 ^/(docs-dev)/v2.3(|.[0-9])(|/.*)$ https://igzdocsdev.wpengine.com/$1/latest-release/$3

#///////////////////////////////////////
## Relocated Pages
# [ci-redirect-from-ver-site] [InfraInfo] See gulpfile.js in the doc-site repo.

# [InfraInfo] We don't need docs-dev/ redirects for v2.0 and earlier pages,
# like in docs/.htaccess, because these old-release docs were maintained in a
# docs-archive site whose URLs are now redirected to the docs/ site from the
# root sites/igzdocsdev/.htaccess file [ci-docs-archive-redirects].

#---------------------------------------
## Pages Removed in v2.5 and v2.3 Post Publication

# Architecture intro (temporarily excluded since v2.3)
# [c-arch-page-update] See the IntInfo in intro/architecture.md (doc-site repo).
RedirectMatch 301 ^/(docs-dev/[^/]+/intro)/architecture(|/.*)$ https://igzdocsdev.wpengine.com/$1/introduction/

# Trial-QS tutorials GS page (consolidated with the tutorial QS index page)
RedirectMatch 301 ^/(docs-dev/[^/]+/tutorials/getting-started/trial-qs/)overview(|/.*)$ https://igzdocsdev.wpengine.com/$1

# Additional-resources" tutorials GS page (moved to an introduction section)
RedirectMatch 301 ^/(docs-dev/[^/]+)/tutorials/getting-started/additional-resources(|/.*)$ https://igzdocsdev.wpengine.com/$1/intro/introduction/#platform-resources

#---------------------------------------
## Pages Moved in V2.8

# DNS & SMTP setup intro pages moved to a howto/ subdirectory
RedirectMatch 301 ^/(docs-dev/latest-release/intro/setup)/(dns|smtp)(|/.*)$ https://igzdocsdev.wpengine.com/$1/howto/$2

#=======================================
## Pages Added and Renamed (Moved) in V2.8.0
# The following redirects are for pages that were added in v2.8.0, when it was
# the latest-release doc, and then renamed (=> URLs changed) shortly after the
# initial publication. => It's sufficient to apply the rules to latest-release.

# BM & VM HW specs (replaced with a single on-prem HW spec) (8.9.20)
RedirectMatch 301 ^/(docs-dev/(latest-release|v2.8)/specs/hardware)/(bare-metal|vm)(-hw-spec)(|/*)$ https://igzdocsdev.wpengine.com/$1/on-prem$4$5

# Cloud-installation how-tos
# calculate-resources/ > resources-calculate/
RedirectMatch 301 ^/(docs-dev/latest-release/intro/setup/cloud/(aws|azure)/howto)/calculate-resources(|/)$ https://igzdocsdev.wpengine.com/$1/resources-calculate/
# configure-security-groups/ > network-security-groups-cfg/
RedirectMatch 301 ^/(docs-dev/latest-release/intro/setup/cloud/(aws|azure)/howto)/configure-security-groups(|/)$ https://igzdocsdev.wpengine.com/$1/network-security-groups-cfg/
# configure-subnet-public-ips-alloc/ > subnet-public-ips-alloc-cfg/
RedirectMatch 301 ^/(docs-dev/latest-release/intro/setup/cloud/(aws|azure)/howto)/configure-subnet-public-ips-alloc(|/)$ https://igzdocsdev.wpengine.com/$1/subnet-public-ips-alloc-cfg/
# create-iam-role/ > iam-role-n-instance-profile-create/
RedirectMatch 301 ^/(docs-dev/latest-release/intro/setup/cloud/(aws|azure)/howto)/create-iam-role(|/)$ https://igzdocsdev.wpengine.com/$1/iam-role-n-instance-profile-create/
# create-iam-user/ > iam-user-create/
RedirectMatch 301 ^/(docs-dev/latest-release/intro/setup/cloud/(aws|azure)/howto)/create-iam-user(|/)$ https://igzdocsdev.wpengine.com/$1/iam-user-create/
# prepare-install/ > pre-install-steps/
RedirectMatch 301 ^/(docs-dev/latest-release/intro/setup/cloud/(aws|azure)/howto)/prepare-install(|/)$ https://igzdocsdev.wpengine.com/$1/pre-install-steps/

