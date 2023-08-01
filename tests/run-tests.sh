# set -e  # Don't use this

chmod +x $GITHUB_WORKSPACE/script.sh

## Test I: Non-existing dir
$GITHUB_WORKSPACE/script.sh $GITHUB_WORKSPACE/tests/foo-dir false
if [ $? -eq 1 ]; then
    echo "INFO: Test I passed."
else
    echo "ERROR: Test I failed."
    exit 1
fi

## Test II: Recursive
$GITHUB_WORKSPACE/script.sh $GITHUB_WORKSPACE/tests/test-dir true

## Test II: Non-recursive
$GITHUB_WORKSPACE/script.sh $GITHUB_WORKSPACE/tests/test-dir false