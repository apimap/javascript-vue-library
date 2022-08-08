#
# This script is to enable easy local development by copying building and copying the vue library
# directly to the portal / developer portal
#
# Input arguments:
# -t <root folder of the portal/developer portal project locally>
#

while getopts t: flag
do
    case "${flag}" in
        t) target=${OPTARG};;
    esac
done

packages=($(ls -d packages/*))
for i in "${packages[@]}"
do
    echo "Build $i"
    npm --prefix=$i/ install
    npm --prefix=$i/ run build
done

if [ -z "$target" ]
then
  echo "No LIBs copied"
else
  cp packages/code-display/dist ${target}/node_modules/@apimap/code-display/ -r
  cp packages/command-line/dist ${target}/node_modules/@apimap/command-line/ -r
  cp packages/input-core/dist ${target}/node_modules/@apimap/input-core/ -r
  cp packages/layout-core/dist ${target}/node_modules/@apimap/layout-core/ -r
  cp packages/output-note/dist ${target}/node_modules/@apimap/output-note/ -r
  cp packages/the-breadcrumbs/dist ${target}/node_modules/@apimap/the-breadcrumbs/ -r
fi
