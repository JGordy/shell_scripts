echo 'Component Name: '

read component

echo 'Project path to component -> Example: src/components/shared/'
echo
read projectPathToComponents

SOURCEPATH=$projectPathToComponents
SOURCEPATH+="src/"

STYLEPATH=$projectPathToComponents
STYLEPATH+="styles/"

TESTPATH=$projectPathToComponents
TESTPATH+="tests/"

echo $SOURCEPATH$component

# Check to see if file already exists
if [ -f $SOURCEPATH$component.jsx ]
then
    # file already exists
    echo $component already exists, exiting.
    exit 1
else
    echo
    echo "directory will look like this after file creation:

    $projectPathToComponents
            ├── src
                ├── $component.jsx
                ├── ...other components
            ├── styles
                ├── $component.css
                ├── ...other components styles
            ├── tests
                ├── $component.spec.js
                ├── ...other components tests"

    echo
    echo 'Creating -> '$component ' files'

    sh ~/shell_scripts/createJSX.sh $component $projectPathToComponents

    sh ~/shell_scripts/createStyles.sh $component $projectPathToComponents

    sh ~/shell_scripts/createJsTest.sh $component $projectPathToComponents

    git status

    git add "$SOURCEPATH$component.jsx" "$STYLEPATH$component.css" "$TESTPATH$component.spec.js"

    git status

fi