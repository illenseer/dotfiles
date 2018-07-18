function prompt_user
    switch $USER

    case 'nils'
        echo "♞ "
    case 'root'
        echo "♛ "
    case '*'
        echo $USER
    end
end
