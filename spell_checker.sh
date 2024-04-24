# To use this script:
#Copy the code into a file (e.g., spell_checker.sh).
#Make the script executable with the command chmod +x spell_checker.sh.
#Run the script with ./spell_checker.sh.
#Enter your text, and the script will check each word against the list of known words.
#If a word is misspelled, it will be marked in red, and the script will suggest possible corrections.
#This script is quite basic and may not handle all cases perfectly (e.g., words with punctuation, capitalization, etc.), but it provides a starting point for a simple spell checker in Bash.

#!/bin/bash

# Known list of words (add more as needed)
KNOWN_WORDS=("apple" "banana" "orange" "grape" "pear")

echo "Welcome to the Spell Checker!"
echo "Enter your text (press Ctrl+D to finish):"

while IFS= read -r -d ' ' word; do
    # Remove trailing punctuation
    word="${word%"${word##*[![:punct:]]}"}"

    # Check if the word is in the known list
    if [[ " ${KNOWN_WORDS[@]} " =~ " $word " ]]; then
        echo -n "$word "
    else
        echo -n "$(tput setaf 1)$word$(tput sgr0) "
        read -p "Did you mean: " -a suggestions <<< "$(grep -i "^$word$" <<< "${KNOWN_WORDS[@]}")"
        echo -n "$(tput setaf 2)${suggestions[*]}$(tput sgr0) "
    fi
done

echo
