set -e

chmod +x $GITHUB_WORKSPACE/script.sh

## Test I: Non-existing dir
$GITHUB_WORKSPACE/script.sh $GITHUB_WORKSPACE/tests/foo-dir false