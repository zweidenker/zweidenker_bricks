# Script to download translations from poeditor
#
# Prerequisites:
#
# 1. Add a poeditor.properties file
# It should declare the variables:
# PE_API_TOKEN="Api Token"
# PE_PROJECT_ID="Project ID"
#
# 2. Install jq
# on MacOs using `brew install jq`
# for other operating systems check:
# https://stedolan.github.io/jq/download/
. ./poeditor.properties

cd ..

l10nPath="lib/l10n"
for lang in {{#languages}}"{{.}}" {{/languages}}; do
  echo "Loading $lang"

  file="$l10nPath/{{name.camelCase()}}_$lang.arb"
  command=$(curl -X POST https://api.poeditor.com/v2/projects/export \
        -d api_token="$PE_API_TOKEN" \
        -d id="$PE_PROJECT_ID" \
        -d language="$lang" \
        -d type="arb" | jq -r ".result.url")
  echo "Command($lang): $command"
  curl "$command" -o "$file"

done