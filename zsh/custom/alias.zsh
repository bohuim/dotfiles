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

# Python
venv()
{
    if [ -z "$1" ]; then
        echo "Usage: venv <dir under ~/venv>"
        return
    fi

    source ~/venv/$1/bin/activate
}

# Swift
alias spm='swift package'

# Cal, Fall 2017
alias cs168='ssh cs168-ahj@hive20.cs.berkeley.edu'

