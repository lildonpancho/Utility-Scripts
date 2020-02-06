!#/usr/bin/env python3

def choice_loop(choice_prompt, options_list):
    """Gets the users' choice.

    Args:
        choice_prompt (str): Asks the user to choose from a list of options.
        options_list (list): A list of options for the user to choose from.

    Returns:
        str: User choice.
    """
    while True:
        print(choice_prompt)
        for n, option in enumerate(options_list, start=1):
            print(f"{n}) {option}")
        try:
            choice = int(input("Enter choice: "))
            return options_list[choice-1]
        except Exception:
            print('Invalid selection. Please try again.\n')
