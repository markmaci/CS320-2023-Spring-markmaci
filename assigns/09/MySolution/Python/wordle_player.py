########################
# HX-2023-04-15: 20 points
########################
"""
Given a history of wordle hints, this function returns a
word as the player's guess.
"""
########################################################################
def wordle_guess(hints):
    word_length = len(hints[0])
    guess = ['?' for _ in range(word_length)]
    possible = []
    not_possible = []

    if hints == []:
        return "apple"

    for hint in hints:
        for i, (color, letter) in enumerate(hint):
            if color == 1:
                guess[i] = letter
            elif color == 2:
                possible.append(letter)
            else:
                not_possible.append(letter)

    for i, letter in enumerate(guess):
        if letter == '?':
            for letter in possible:
                if letter not in guess and letter not in not_possible:
                    guess[i] = letter
                    possible.remove(letter)
                    break

    for i, letter in enumerate(guess):
        if letter == '?':
            for letter in "abcdefghijklmnopqrstuvwxyz":
                if letter not in guess and letter not in not_possible:
                    guess[i] = letter
                    break

    return "".join(guess)








########################################################################
