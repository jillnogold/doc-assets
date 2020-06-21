########################################
## URL Redirects - root directory of the docs staging site (non-versioned)
# [ci-redirect] [InfraInfo] See gulpfile.js in the doc-site repo.

# [InfraInfo] (sharonl) The source URL starts with "/docs" => RedirectMatch
# with a starts-with rule should begin with "^/docs".

#///////////////////////////////////////
## Obsolete Multi-Versioned Site URLs

# Redirect old versioned sections URLs (<section>/<version>/ where <version> is
# "vX.Y" or "latest-release") to <version>/<section>
# <section>/vX.Y/* > latest-release/)
RedirectMatch 301 ^/(docs)/(concepts|intro|reference|specs|tutorials)/(v[0-9]\.[0-9]|latest-release)(|/.*)$ https://igzdocsdev.wpengine.com/$1/$3/$2$4

# Redirect old non-versioned section pages (such as release-notes/*) and all
# section root-directory URLs (<section>/ - after the <section>/<version>/
# redirect) to latest-release/<section>/*
RedirectMatch 301 ^/(docs)/(concepts|intro|reference|release-notes|specs|tutorials)(|/.*)$ https://igzdocsdev.wpengine.com/$1/latest-release/$2/$3

#///////////////////////////////////////
## Latest-Release Version-Number URLs
#(/v<X.Y/X.Y.Z (latest release)>/* > /latest-release/*)
# [TODO-NEW-VER] Update the hardcoded version number in the source URL.
RedirectMatch 301 ^/(docs)/v2.8(\.[0-9]|)(|/.*)$ https://igzdocsdev.wpengine.com/$1/latest-release/$3

#///////////////////////////////////////
## Removed Old-Release Doc Sites (No Longer Published)
# [ci-docs-archive-redirects] The v1.9-v2.2 docs-archive site pages are first
# redirected to matching docs/* pages from sites/igzdocsdev/.htaccess. Pages
# that are no longer found in latest-release are redirected later in this file.
RedirectMatch 301 ^/(docs)/v(2.3|2.2|2.1|2.0|1.9)(|.[0-9])(|/.*)$ https://igzdocsdev.wpengine.com/$1/latest-release$4

#///////////////////////////////////////
## Relocated Pages
# [ci-redirect-from-ver-site] [InfraInfo] See gulpfile.js in the doc-site repo.

#---------------------------------------
## Pages Moved or Removed in v2.0
# (The old v1.9-v2.2 URLs are redirected to the current-site latest-release docs
# from the root sites/<site>/.htaccess file.)

# Data-pipeline intro (removed)
RedirectMatch 301 /(latest-release/intro)/data-pipeline(|/*)$ https://igzdocsdev.wpengine.com/docs/$1/introduction/

# Cloud-trial getting-started tutorials that moved out of the trial QSs
# Ingestion & consumption QS
RedirectMatch 301 /(latest-release/tutorials/getting-started)/trial-qs/(ingest-n-consume-files)(|/*)$ https://igzdocsdev.wpengine.com/docs/$1/$2/
# Grafana-dashboards QS
RedirectMatch 301 /(latest-release/tutorials/getting-started)/trial-qs/(grafana-dashboards)(|/*)$ https://igzdocsdev.wpengine.com/docs/$1/$2/

# Presto cloud-trial QS tutorial (removed in v2.0 - reference-doc duplication)
RedirectMatch 301 /(latest-release)/tutorials/getting-started/trial-qs/(presto)(|/*)$ https://igzdocsdev.wpengine.com/docs/$1/reference/$2/overview/

# Development QS (removed - non-k8s doc)
RedirectMatch 301 /(latest-release/tutorials/getting-started)/development-qs(|/*)$ https://igzdocsdev.wpengine.com/docs/$1/

# Data-copy QS tutorial (removed - non-k8s doc)
RedirectMatch 301 /(latest-release/tutorials/getting-started)/data-copy-qs(|/*)$ https://igzdocsdev.wpengine.com/docs/$1/ingest-n-consume-files/

# Spark data-ingestion QS tutorial (moved)
RedirectMatch 301 /(latest-release/tutorials)/getting-started/data-ingestion/data-ingestion-w-spark-qs(|/*)$ https://igzdocsdev.wpengine.com/docs/$1/getting-started/data-ingestion-w-spark-qs/

# Data-ingestion QSs tutorials directory (removed)
RedirectMatch 301 /(latest-release/tutorials)/getting-started/data-ingestion(|/*)$ https://igzdocsdev.wpengine.com/docs/$1/getting-started/ingest-n-consume-files/

#---------------------------------------
## Pages Removed in v2.5 and v2.3 Post Publication

# Architecture intro (temporarily excluded since v2.3)
# [c-arch-page-update] See the IntInfo in intro/architecture.md (doc-site repo).
RedirectMatch 301 ^/(docs/[^/]+/intro)/architecture(|/.*)$ https://igzdocsdev.wpengine.com/$1/introduction/

# Trial-QS tutorials GS page (consolidated with the tutorial QS index page)
RedirectMatch 301 ^/(docs/[^/]+/tutorials/getting-started/trial-qs/)overview(|/.*)$ https://igzdocsdev.wpengine.com/$1

# Additional-resources" tutorials GS page (moved to an introduction section)
RedirectMatch 301 ^/(docs/[^/]+)/tutorials/getting-started/additional-resources(|/.*)$ https://igzdocsdev.wpengine.com/$1/intro/introduction/#platform-resources

#---------------------------------------
## Pages Moved in V2.8

# DNS & SMTP setup intro pages moved to a howto/ subdirectory
RedirectMatch 301 ^/(docs/latest-release/intro/setup)/(dns|smtp)(|/.*)$ https://igzdocsdev.wpengine.com/$1/howto/$2

