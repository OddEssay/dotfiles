# Git Configuration for Work vs Personal Repositories

To configure different git emails based on repositories:

1. Set global default email (personal):
   ```bash
   git config --global user.email "clicknmix@gmail.com"
   ```

2. For specific repositories like "artic-monorepo", configure work email:
   ```bash
   cd /path/to/artic-monorepo
   git config user.email "paul@artic.works"
   ```

3. Other repositories will use the global default email.

Note: Git doesn't support automatic repository-based configuration switching through a single gitconfig file. Each repository must have its email configured individually.

To verify configuration:
```bash
git config user.email
```