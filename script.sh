set -e


## These values are coming from the terminal/user's input
DIR=$1
RECURSIVE=$2


echo "::group::DEBUG"
echo "DIR: '$DIR'"
echo "RECURSIVE: '$RECURSIVE'"
echo "::endgroup::"


## Check if the directory exists
if [ ! -d "$DIR" ]; then
    echo "ERROR: The '$DIR' directory does not exist."
    exit 1
fi


## Find all .sh files
if [ "$RECURSIVE" = "true" ]; then
    sh_files=$(find "$DIR" -type f -name "*.sh")
else
    sh_files=$(find "$DIR" -maxdepth 1 -type f -name "*.sh")
fi


## Check if any .sh files were found
if [ -z "$sh_files" ]; then
    echo "WARNING: No shell '.sh' files found."
else
    ## Loop through each .sh file and make it executable
    for file in $sh_files; do
        chmod +x "$file"
        echo "INFO: Made $file executable."
    done
fi