# Solving coding katas in Dart language using TDD   

### Coverage
**Use**: `dart run test --coverage=./coverage && dart pub global run coverage:format_coverage --packages=.dart_tool/package_config.json --report-on=lib --lcov -o ./coverage/lcov.info -i ./coverage`

# Arlo's Commit Notation Cheat Sheet

# Arlo's Commit Notation Cheat Sheet

## Risk Categories
| Symbol | Risk Description                     |
|--------|--------------------------------------|
| .      | Provable (changes are easy to verify)|
| -      | Tested (changes have been tested)    |
| !      | Single Action (single, atomic change)|
| @      | Other (miscellaneous changes)        |

## Action Categories
| Symbol | Action Description                       |
|--------|------------------------------------------|
| r      | Refactoring (improving code structure)   |
| e      | Environment (non-code changes)           |
| d      | Documentation (changes to documentation) |
| t      | Test only (changes to tests)             |
| F      | Feature (new features)                   |
| B      | Bugfix (fixing bugs)                     |

## Examples
- `.r rename variable`: Provable refactoring change, such as renaming a variable.
- `-e update build script`: Tested change to the environment, such as updating a build script.
- `!B fixed spelling on label`: Single action bugfix, like fixing a spelling error on a label.
- `@d update README`: Miscellaneous documentation change, like updating the README file.

## Commit Message Guidelines
- Always use the appropriate risk and action symbols to describe the change.
- Provide a concise description of the change after the symbols.

## Example Commit Messages
- `.r rename variable`: This commit renames a variable, which is a provable refactoring change.
- `-e update build script`: This commit updates a build script, indicating a tested environment change.
- `!B fixed spelling on label`: This commit fixes a spelling error on a label, a single action bugfix.
- `@d update README`: This commit updates the README file, categorized as other documentation change.

By using this notation, you can clearly and concisely describe the nature and risk of your changes in commit messages.
