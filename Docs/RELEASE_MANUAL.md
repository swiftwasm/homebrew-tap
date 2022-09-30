# Release Manual

## Carton

1. Update source repository version like [this commit](https://github.com/swiftwasm/homebrew-tap/commit/092b990f9fe0edde748e66a714f31ea7840c0a67)
2. Open a PR with the change
3. After `test-bot` CI job passed, add `pr-pull` label to your PR
4. After the PR merged by the bot, a new release is created
5. (Optional) Create a bottle for arm64 on your machine by following the below steps

```console
$ brew fetch --force swiftwasm/tap/carton
$ brew install --build-bottle swiftwasm/tap/carton
$ brew bottle swiftwasm/tap/carton --no-rebuild
==> Bottling carton--0.16.0.arm64_monterey.bottle.1.tar.gz...
==> Detecting if carton--0.16.0.arm64_monterey.bottle.1.tar.gz is relocatable...
./carton--0.16.0.arm64_monterey.bottle.1.tar.gz
  bottle do
    sha256 cellar: :any_skip_relocation, arm64_monterey: "0f1500b704cc74e77a222c7dd2b37f03b52d1611b3b287938297e9c9d2b7f00a"
  end

$ vim ./carton.rb # add bottle line
$ brew style ./carton.rb --fix
```
