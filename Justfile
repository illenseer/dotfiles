PROJECT := file_name(invocation_directory())

@_:
    just --list

[group('lifecycle')]
init:
    stow --verbose --target $HOME --restow */
