minediff() {
    git diff --name-only main | xargs open -na "Rubymine.app" --args ""
}
