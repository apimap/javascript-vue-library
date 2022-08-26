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
  echo "Target ${target}"
  cp -R packages/code-display/dist ${target}/node_modules/@apimap/code-display/
  cp -R packages/command-line/dist ${target}/node_modules/@apimap/command-line/
  cp -R packages/input-core/dist ${target}/node_modules/@apimap/input-core/
  cp -R packages/layout-core/dist ${target}/node_modules/@apimap/layout-core/
  cp -R packages/output-note/dist ${target}/node_modules/@apimap/output-note/
  cp -R packages/the-breadcrumbs/dist ${target}/node_modules/@apimap/the-breadcrumbs/
fi
