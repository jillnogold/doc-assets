# BEGIN WordPress
<IfModule mod_rewrite.c>
RewriteEngine On
RewriteBase /
RewriteRule ^index\.php$ - [L]
RewriteCond %{REQUEST_FILENAME} !-f
RewriteCond %{REQUEST_FILENAME} !-d
RewriteRule . /index.php [L]
</IfModule>

# END WordPress

# Trim extra slashes (/) in the path
RewriteCond %{THE_REQUEST} //
RewriteRule ^.*$ $0 [R=302,L,NE]

####################
## Doc-Site Redirects

## docs-archive/* or techpreview/* > docs/*
# [ci-docs-archive-redirects] [ci-techpreview-redirects]
# [InfraInfo] (Restructured URL versioning and obsolete-pages redirects are
# handled from docs/.htaccess using the new URLs from the following redirect.
RedirectMatch 301 ^/(docs-archive|techpreview)(|/.*)$ https://igzdocsdev.wpengine.com/docs/$2

## Docs home (base doc-site URL) > latest-release/ home
RedirectMatch 301 ^/(docs)(/|)$ https://igzdocsdev.wpengine.com/$1/latest-release/

