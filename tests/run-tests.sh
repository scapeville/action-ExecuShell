# set -e  # Don't use this because there are lines in this script that would intentionally raise exit `<error code>` and will be caught.


## Test I: Non-existing dir
$GITHUB_WORKSPACE/script.sh $GITHUB_WORKSPACE/tests/foo-dir false
[ $? -eq 1 ] && echo "INFO: Test I passed." || (echo "ERROR: Test I failed." && exit 1)

## Test II: Recursive
$GITHUB_WORKSPACE/script.sh $GITHUB_WORKSPACE/tests/test-dir true
[ $? -eq 0 ] && echo "INFO: Test II passed." || (echo "ERROR: Test II failed." && exit 1)

## Test III: Non-recursive
$GITHUB_WORKSPACE/script.sh $GITHUB_WORKSPACE/tests/test-dir false
[ $? -eq 0 ] && echo "INFO: Test III passed." || (echo "ERROR: Test III failed." && exit 1)

## Test IV: No shell files found
$GITHUB_WORKSPACE/script.sh $GITHUB_WORKSPACE/tests/test-dir-no-shell-files true
[ $? -eq 0 ] && echo "INFO: Test IV passed." || (echo "ERROR: Test IV failed." && exit 1)