*** Variables ***
@{items}    tom    kite    rose

*** Test Cases ***
case02
    FOR    ${item}    IN  @{items}
        Log    ${item}
    END

    Repeat Keyword    5    Log    1