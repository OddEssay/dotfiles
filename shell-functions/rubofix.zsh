# Apply `rubocop -A` 
# `grep '.rb'` to any ruby files 
# `git diff --name-only main` that have changed.
# `grep -v schema` but ignore changes to the auto generated schema.
rubofix() {
    git diff --name-only main | grep '.rb' | grep -v schema | xargs rubocop -A
}
