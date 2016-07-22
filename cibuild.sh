#!/usr/bin/env bash
set -e # halt script on error

echo "Searching for BOMs -------------------------------"

FOUND_BOM=false
for filename in ./**/*.*; do
    # Make sure that the file is UTF-8 so we don't search binary files or other encodings
    CURRENT_FILE_ENCODING="`file --mime-encoding --brief "$filename"`"
    if [ "$CURRENT_FILE_ENCODING" == "utf-8" ] && [ "`head -c 3 -- "$filename"`" == $'\xef\xbb\xbf' ]
    then
        # Make note of all the files that failed so we can see it in the Travis log
        FOUND_BOM=true
        echo "Found BOM in file $filename!"
    fi
done

if [ $FOUND_BOM == true ]
then
    # We still want to run the other validation checks even if we found BOMs
    echo "Checks failed! Jekyll can't handle BOMs. See above for list of problematic files."
else
    echo "Checks passed! No BOMs found."
fi

echo "Building site ------------------------------------"
bundle exec jekyll build --trace

echo "Validating HTML ----------------------------------"

SOURCE_DIR="$(readlink -f .)"
DEST_DIR="."

if [[ $TRAVIS = false || ($TRAVIS = true && $TRAVIS_EVENT_TYPE = "cron") ]]; then
    COMMIT_RESTRICTION_RANGE=""
else
    COMMIT_RESTRICTION_RANGE="$TRAVIS_COMMIT_RANGE"
fi

# We want to use the publish script so that we can implement other transformations in the future
ruby publish.rb --no-fix-links --test "ruby $(readlink -f check-build-html.rb) '$SOURCE_DIR' '$DEST_DIR' $COMMIT_RESTRICTION_RANGE"

# If the site build succeeded but we found BOMs, we want to fail the build
if [ $FOUND_BOM == true ]
then
    exit 1
fi
