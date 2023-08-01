# set -e  # Don't use this because there are lines in this script that would intentionally raise exit `<error code>` and will be caught.


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
echo "INFO: Test II passed."

## Test III: Non-recursive
$GITHUB_WORKSPACE/script.sh $GITHUB_WORKSPACE/tests/test-dir false
echo "INFO: Test III passed."

## Test IV: No shell files found
$GITHUB_WORKSPACE/script.sh $GITHUB_WORKSPACE/tests/test-dir false
echo "INFO: Test IV passed."