MONTHS=10
LINES=20

cat <<EOT >>$3
<?xml version="1.0" encoding="UTF-8"?>
<rss version="2.0" xmlns:atom="http://www.w3.org/2005/Atom">
<channel>
<atom:link href="https://strahinja.org/blog/rss.xml" rel="self" 
    type="application/rss+xml" />
<link>https://strahinja.org/blog/rss.xml</link>
<title>//strahinja.org</title>
<description>Новости са личне странице Страхиње Радића</description>
<category>Blog</category>
<language>sr-rs</language>
<copyright>© 1999-2021 Страхиња Радић (Strahinya Radich)</copyright>
EOT

for d in $(find *-* -type d | sort -r | head -n ${MONTHS}); do
    if [ -d $d ]; then
        for f in $d/*.slw; do
            YAML=$(sed -e '0,/^---/d' -e '/^---/,$d' $f)
            TITLE=$(echo "${YAML}" | grep title: | sed -e 's/title: \+//g')
            DATE=$(echo "${YAML}" | grep date: | sed -e 's/date: \+//g' \
                | xargs -I{} date -R -d"{}")
            DESCRIPTION=$(slweb -b $f | tail -n +5 | sed -e '/References/,$d')
            cat <<EOT >>$3
    <item>
        <title>$TITLE</title>
        <link>https://strahinja.org/blog/$d/$(basename -s.slw $f)/</link>
        <guid>https://strahinja.org/blog/$d/$(basename -s.slw $f)/</guid>
        <pubDate>$DATE</pubDate>
        <description><![CDATA[$DESCRIPTION]]></description>
    </item>
EOT
        done
    fi
done
cat <<EOT >>$3
</channel>
</rss>
EOT

