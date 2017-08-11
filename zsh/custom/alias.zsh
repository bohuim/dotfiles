alias c=clear

# edit and source specified file.
edit-source()
{
    if [ -z "$1" ]; then
        echo "Usage: edit-source path/to/file"
        return
    fi

    $EDITOR $1 && source $1
}


# Swift
alias spm='swift package'
