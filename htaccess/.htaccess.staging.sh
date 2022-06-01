########################################
## URL Redirects - root directory of the docs staging site (non-versioned)
# [ci-redirect] [InfraInfo] See gulpfile.js in the doc-site repo.
# Some redirects are handled via Hugo aliases in the Markdown front matter,
# which results in a directory for the redirected page that contains an index
# file with the redirection code.
# [ci-redirect-anchors] (sharonl) It's not possible to redirect specific anchor
# tags (#). Such tags are not considered part of the redirected URL and are
# simply attached to the destination redirection URL as-is; (it might be
# possible to eliminate the appending of the anchor from the redirected URL to
# the destination URL with rewrite rules, but this would apply to all redirects
# and in some cases we want to keep the original anchor, and on the flip side
# there's no real harm with keeping an invalid anchor in the destination URL).

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
RedirectMatch 301 ^/(docs)/(concepts|intro|reference|release-notes|specs|tutorials)(|/.*)$ https://igzdocsdev.wpengine.com/$1/latest-release/$2$3

#///////////////////////////////////////
## Latest-Release Version-Number URLs
#(/v<X.Y/X.Y.Z (latest release)>/* > /latest-release/*)
# [TODO-NEW-VER] Update the hardcoded version number in the source URL.
RedirectMatch 301 ^/(docs)/v3.2(\.[0-9]|)(|/.*)$ https://igzdocsdev.wpengine.com/$1/latest-release$3

## Next-Release Version-Number URLs
#(/v<X.Y/X.Y.Z (next minor release)>/* > /latest-release/*)
# [InfraInfo] (sharonl) (12.1.21) It was decided that in order to allow linking
# to the relevant versioned product documentation from external sources - such
# as the product dashboard (UI) and v3io/tutorials - as part of the development
# for the next product release, before we've published related documentation,
# we'll also redirect docs/vX.Y URLs for the next minor release to the latest
# docs.
# [TODO-NEW-VER] Update the hardcoded version number in the source URL.
RedirectMatch 301 ^/(docs)/v3.5(\.[0-9]|)(|/.*)$ https://igzdocsdev.wpengine.com/$1/latest-release$3

#///////////////////////////////////////
## Removed Old-Release Doc Sites (No Longer Published)
# [ci-docs-archive-redirects] The v1.9-v2.2 docs-archive site pages are first
# redirected to matching docs/* pages from sites/igzdocsdev/.htaccess. Pages
# that are no longer found in latest-release are redirected later in this file.
RedirectMatch 301 ^/(docs)/v(2.3|2.2|2.1|2.0|1.9)(|.[0-9])(|/.*)$ https://igzdocsdev.wpengine.com/$1/latest-release$4

#///////////////////////////////////////
## External Doc-Site URL Errors
# [IntInfo] (sharonl) Redirect rules to handle errors in external doc-site
# links. These rules aren't really required for the staging sites, but I added
# them for consistency with the public site and for testing.

# ecosystem/app-services/ > intro/ecosystem/app-services/
# [IntInfo] (sharonl) (17.3.21) I found that the v3.0.0 and v3.0.1 dashboard
# (UI) Help Center | "Application Services" tile has an error in the URL -
# missing intro/ - which is probably also true in earlier releases.
# [SITE-RESTRUCT] In v3.0.0, this URL moved to services/app-services/. This is
# handled by a redirect rule later in this file. I've now also updated the UI
# URL, for future releases (after v3.0.1) to refer to to services/app-services/.
# (Note: I only redirected latest-release/, because until v3.0, the UI doc-site
# links were always to the latest-release doc site; in v3.0.0 we moved to
# versioned URLs to match the platform version.)
RedirectMatch 301 ^/(docs/latest-release)/ecosystem/(app-services)(|/.*)$ https://igzdocsdev.wpengine.com/$1/services/$2$3

#///////////////////////////////////////
## Relocated Pages
# [ci-redirect-from-ver-site] [InfraInfo] See gulpfile.js in the doc-site repo.

#---------------------------------------
## Pages Moved or Removed in v2.0
# (The old v1.9-v2.2 URLs are redirected to the current-site latest-release docs
# from the root sites/<site>/.htaccess file.)

# Data-pipeline intro (removed)
RedirectMatch 301 ^/(docs/latest-release/intro)/data-pipeline(|/*)$ https://igzdocsdev.wpengine.com/$1/introduction/

# Cloud-trial getting-started tutorials that moved out of the trial QSs
# Ingestion & consumption QS
RedirectMatch 301 ^/(docs/latest-release)/tutorials/getting-started/trial-qs/(ingest-n-consume-files)(|/*)$ https://igzdocsdev.wpengine.com/$1/data-layer/objects/$2/
# Grafana-dashboards QS
RedirectMatch 301 ^/(docs/latest-release)/tutorials/getting-started/trial-qs/(grafana-dashboards)(|/*)$ https://igzdocsdev.wpengine.com/$1/services/$2/

# Presto cloud-trial QS tutorial (removed in v2.0 - reference-doc duplication)
RedirectMatch 301 ^/(docs/latest-release)/tutorials/getting-started/trial-qs/(presto)(|/*)$ https://igzdocsdev.wpengine.com/$1/data-layer/$2/overview/

# Development QS (removed - non-k8s doc)
RedirectMatch 301 ^/(docs/latest-release)/tutorials/getting-started/development-qs(|/*)$ https://igzdocsdev.wpengine.com/$1/intro/introduction

# Data-copy QS tutorial (removed - non-k8s doc)
RedirectMatch 301 ^/(docs/latest-release)/tutorials/getting-started/data-copy-qs(|/*)$ https://igzdocsdev.wpengine.com/$1/data-layer/objects/ingest-n-consume-files/

# Spark data-ingestion QS tutorial (moved)
RedirectMatch 301 ^/(docs/latest-release)/tutorials/getting-started/data-ingestion/(data-ingestion-w-spark-qs)(|/*)$ https://igzdocsdev.wpengine.com/$1/data-layer/$2/

# Data-ingestion QSs tutorials directory (removed)
RedirectMatch 301 ^/(docs/latest-release)/tutorials/getting-started/data-ingestion(|/*)$ https://igzdocsdev.wpengine.com/$1/intro/data-ingestion-and-preparation/

#---------------------------------------
## Pages Removed in v2.5 and v2.3 Post Publication

# Architecture intro (temporarily excluded since v2.3)
# [c-arch-page-update] See the IntInfo in intro/architecture.md (doc-site repo).
RedirectMatch 301 ^/(docs/[^/]+/intro)/architecture(|/.*)$ https://igzdocsdev.wpengine.com/$1/introduction/

# Trial-QS tutorials GS page (consolidated with the tutorial QS index page)
RedirectMatch 301 ^/(docs/[^/]+)/tutorials/getting-started/(trial-qs)/overview(|/.*)$ https://igzdocsdev.wpengine.com/$1/intro/$2

# Additional-resources" tutorials GS page (moved to an introduction section)
RedirectMatch 301 ^/(docs/[^/]+)/tutorials/getting-started/additional-resources(|/.*)$ https://igzdocsdev.wpengine.com/$1/intro/introduction/#platform-resources

#---------------------------------------
## Pages Moved in V2.8

# DNS & SMTP setup intro pages moved to a howto/ subdirectory
RedirectMatch 301 ^/(docs/latest-release)/intro/setup/(dns|smtp)(|/.*)$ https://igzdocsdev.wpengine.com/$1/cluster-mgmt/deployment/post-deployment-howtos/howto$2

#=======================================
## Pages Added and Renamed (Moved) in V2.8.0
# The following redirects are for pages that were added in v2.8.0, when it was
# the latest-release doc, and then renamed (=> URLs changed) shortly after the
# initial publication. => It's sufficient to apply the rules to latest-release.

# BM & VM HW specs (replaced with a single on-prem HW spec - 8.9.20;
# [SITE-RESTRUCT-V3.0.0] moved)
RedirectMatch 301 ^/(docs/(latest-release|v2.8))/specs/hardware/(bare-metal|vm)(-hw-spec)(|/*)$ https://igzdocsdev.wpengine.com/$1/cluster-mgmt/deployment/on-prem$4$5

# Cloud-installation how-tos
# calculate-resources/ > resources-calculate/
RedirectMatch 301 ^/(docs/latest-release)/intro/setup/(cloud/(aws|azure)/howto)/calculate-resources(|/)$ https://igzdocsdev.wpengine.com/$1/cluster-mgmt/deployment/$2/resources-calculate/
# configure-security-groups/ > network-security-groups-cfg/
RedirectMatch 301 ^/(docs/latest-release)/intro/setup/(cloud/(aws|azure)/howto)/configure-security-groups(|/)$ https://igzdocsdev.wpengine.com/$1/cluster-mgmt/deployment/$2/network-security-groups-cfg/
# configure-subnet-public-ips-alloc/ > subnet-public-ips-alloc-cfg/
RedirectMatch 301 ^/(docs/latest-release)/intro/setup/(cloud/(aws|azure)/howto)/configure-subnet-public-ips-alloc(|/)$ https://igzdocsdev.wpengine.com/$1/cluster-mgmt/deployment/$2/subnet-public-ips-alloc-cfg/
# create-iam-role/ > iam-role-n-instance-profile-create/
RedirectMatch 301 ^/(docs/latest-release)/intro/setup/(cloud/(aws|azure)/howto)/create-iam-role(|/)$ https://igzdocsdev.wpengine.com/$1/cluster-mgmt/deployment/$2/iam-role-n-instance-profile-create/
# create-iam-user/ > iam-user-create/
RedirectMatch 301 ^/(docs/latest-release)/intro/setup/(cloud/(aws|azure)/howto)/create-iam-user(|/)$ https://igzdocsdev.wpengine.com/$1/cluster-mgmt/deployment/$2/iam-user-create/
# prepare-install/ > pre-install-steps/
RedirectMatch 301 ^/(docs/latest-release)/intro/setup/(cloud/(aws|azure)/howto)/prepare-install(|/)$ https://igzdocsdev.wpengine.com/$1/cluster-mgmt/deployment/$2/pre-install-steps/

#---------------------------------------
## Pages Moved in V3.0

#=======================================
## [SITE-RESTRUCT-V3.0.0] V3.0.0 Doc-Site Restructure Changes [IG-17510]
# [ci-redirect-anchors] See IG-17510 for additional anchor-specific redirect
# logic, which cannot be implemented with .htaccess redirect rules.

# intro/ pages
# intro/ecosystem/
RedirectMatch 301 ^/(docs/latest-release/intro)/ecosystem/(ui)(|/.*)$ https://igzdocsdev.wpengine.com/$1/$2$3
RedirectMatch 301 ^/(docs/latest-release)/intro/ecosystem/data-fabric(|/.*)$ https://igzdocsdev.wpengine.com/$1/data-layer$2
RedirectMatch 301 ^/(docs/latest-release)/intro/ecosystem/(app-services)(|/.*)$ https://igzdocsdev.wpengine.com/$1/services/$2$3
RedirectMatch 301 ^/(docs/latest-release)/intro/ecosystem(|/.*)$ https://igzdocsdev.wpengine.com/$1/services/
# intro/logging-n-debugging/
RedirectMatch 301 ^/(docs/latest-release)/intro/(logging-n-debugging)(|/.*)$ https://igzdocsdev.wpengine.com/$1/cluster-mgmt/$2$3
# intro/setup/
RedirectMatch 301 ^/(docs/latest-release)/intro/setup/(cloud)/(aws|azure)/installation-guides/((aws|azure)-installation-guide)(|/.*)$ https://igzdocsdev.wpengine.com/$1/cluster-mgmt/deployment/$2/$3/$4$6
RedirectMatch 301 ^/(docs/latest-release)/intro/setup/(cloud)/(aws|azure)/installation-guides(|/.*)$ https://igzdocsdev.wpengine.com/$1/cluster-mgmt/deployment/$2/$3/$3-installation-guide$4
RedirectMatch 301 ^/(docs/latest-release)/intro/setup/(on-prem/vm)/(vmware|proxmox)/installation-guides/((vmware|proxmox)-installation-guide)(|/.*)$ https://igzdocsdev.wpengine.com/$1/cluster-mgmt/deployment/$2/$3/$4$6
RedirectMatch 301 ^/(docs/latest-release)/intro/setup/(on-prem/vm)/(vmware|proxmox)/installation-guides(|/.*)$ https://igzdocsdev.wpengine.com/$1/cluster-mgmt/deployment/$2/$3/$3-installation-guide$4
RedirectMatch 301 ^/(docs/latest-release)/intro/setup/howto(|/.*)$ https://igzdocsdev.wpengine.com/$1/cluster-mgmt/deployment/post-deployment-howtos$2
RedirectMatch 301 ^/(docs/latest-release)/intro/setup(|/.*)$ https://igzdocsdev.wpengine.com/$1/cluster-mgmt/deployment$2
# intro/serverless/
RedirectMatch 301 ^/(docs/latest-release)/intro/serverless(|/.*)$ https://igzdocsdev.wpengine.com/$1/services/app-services/nuclio$2

# concepts/ pages
# (concepts/project-life-cycle/ was redirected to concepts/projects/ before
# v3.0.0 via a Hugo `aliases` front-matter configuration.)
RedirectMatch 301 ^/(docs/latest-release)/concepts/(projects|project-life-cycle)(|/.*)$ https://igzdocsdev.wpengine.com/$1/ds-and-mlops$3
RedirectMatch 301 ^/(docs/latest-release)/concepts/containers-collections-objects(|/.*)$ https://igzdocsdev.wpengine.com/$1/data-layer$2
RedirectMatch 301 ^/(docs/latest-release)/concepts/nosql-dbs(|/.*)$ https://igzdocsdev.wpengine.com/$1/data-layer/nosql$2
RedirectMatch 301 ^/(docs/latest-release)/concepts/streams(|/.*)$ https://igzdocsdev.wpengine.com/$1/data-layer/stream$2
RedirectMatch 301 ^/(docs/latest-release)/concepts/(users|security)(|/.*)$ https://igzdocsdev.wpengine.com/$1/users-and-security/$2$3
RedirectMatch 301 ^/(docs/latest-release)/concepts(|/.*)$ https://igzdocsdev.wpengine.com/$1/intro/

# tutorials/ pages
RedirectMatch 301 ^/(docs/latest-release)/tutorials/getting-started/(trial-qs)(|/.*)$ https://igzdocsdev.wpengine.com/$1/intro/$2$3
RedirectMatch 301 ^/(docs/latest-release)/tutorials/getting-started/fundamentals(|/.*)$ https://igzdocsdev.wpengine.com/$1/intro/introduction$2
RedirectMatch 301 ^/(docs/latest-release)/tutorials/getting-started/containers(|/.*)$ https://igzdocsdev.wpengine.com/$1/data-layer/containers/working-with-containers$2
RedirectMatch 301 ^/(docs/latest-release)/tutorials/getting-started/(data-ingestion-and-preparation)(|/.*)$ https://igzdocsdev.wpengine.com/$1/data-layer/$2$3
RedirectMatch 301 ^/(docs/latest-release)/tutorials/getting-started/(ingest-n-consume-files)(|/.*)$ https://igzdocsdev.wpengine.com/$1/data-layer/objects/$2$3
RedirectMatch 301 ^/(docs/latest-release)/tutorials/getting-started/data-ingestion-w-spark-qs(|/.*)$ https://igzdocsdev.wpengine.com/$1/data-layer/spark-data-ingestion-qs$2
RedirectMatch 301 ^/(docs/latest-release)/tutorials/getting-started/(grafana-dashboards)(|/.*)$ https://igzdocsdev.wpengine.com/$1/services/$2$3
RedirectMatch 301 ^/(docs/latest-release)/tutorials/getting-started(|/.*)$ https://igzdocsdev.wpengine.com/$1/intro/introduction$2
RedirectMatch 301 ^/(docs/latest-release)/tutorials/(tsdb)(|/.*)$ https://igzdocsdev.wpengine.com/$1/data-layer/$2$3
RedirectMatch 301 ^/(docs/latest-release)/tutorials(|/.*)$ https://igzdocsdev.wpengine.com/$1/intro/

# reference/ pages
RedirectMatch 301 ^/(docs/latest-release)/(reference)/api-reference/(management-apis)(|/.*)$ https://igzdocsdev.wpengine.com/$1/cluster-mgmt/$2/$3$4
RedirectMatch 301 ^/(docs/latest-release)/reference/(presto)(|/.*)$ https://igzdocsdev.wpengine.com/$1/data-layer/$2$3
RedirectMatch 301 ^/(docs/latest-release)/(reference/(data-types|expressions|nosql-table-schema|reserved-names|system-attributes))(|/.*)$ https://igzdocsdev.wpengine.com/$1/data-layer/$2$4
RedirectMatch 301 ^/(docs/latest-release)/(reference)/api-reference(|/.*)$ https://igzdocsdev.wpengine.com/$1/data-layer/$2$3
RedirectMatch 301 ^/(docs/latest-release)/(reference)(|/.*)$ https://igzdocsdev.wpengine.com/$1/data-layer/$2/

# specs/ pages
RedirectMatch 301 ^/(docs/latest-release)/specs/(support-matrix|sw-specifications)(|/.*)$ https://igzdocsdev.wpengine.com/$1/cluster-mgmt/deployment/$2$3
RedirectMatch 301 ^/(docs/latest-release)/specs/hardware/overview(|/.*)$ https://igzdocsdev.wpengine.com/$1/cluster-mgmt/deployment$2
RedirectMatch 301 ^/(docs/latest-release)/specs/hardware/cloud-hw-spec(|/.*)$ https://igzdocsdev.wpengine.com/$1/cluster-mgmt/deployment/cloud/$2
RedirectMatch 301 ^/(docs/latest-release)/specs/hardware/(on-prem-hw-spec)(|/.*)$ https://igzdocsdev.wpengine.com/$1/cluster-mgmt/deployment/on-prem/$2$3
RedirectMatch 301 ^/(docs/latest-release)/specs/hardware(|/.*)$ https://igzdocsdev.wpengine.com/$1/cluster-mgmt/deployment$2
RedirectMatch 301 ^/(docs/latest-release)/specs(|/.*)$ https://igzdocsdev.wpengine.com/$1/cluster-mgmt/deployment/

