# vaultr

[![Project Status: WIP - Initial development is in progress, but there has not yet been a stable, usable release suitable for the public.](http://www.repostatus.org/badges/latest/wip.svg)](http://www.repostatus.org/#wip)
[![Travis-CI Build Status](https://travis-ci.org/vimc/vaultr.svg?branch=master)](https://travis-ci.org/vimc/vaultr)
[![codecov.io](https://codecov.io/github/vimc/vaultr/coverage.svg?branch=master)](https://codecov.io/github/vimc/vaultr?branch=master)

API client for [vault](https://www.vaultproject.io/).

Vault provides a platform for distributing secrets across machines.  This package wraps the [vault http API](https://www.vaultproject.io/api/index.html) to allow secrets to be accessed from R.  Secrets might be passwords, tokens, certificates or any other sensitive data.

## Usage



Create a vault client with the `vault_client` function:


```r
vault <- vaultr::vault_client(login = TRUE)
```

```
## Verifying token
```

Interact with vault using this object:like


```r
vault$list("secret/database")
```

```
## [1] "admin"    "readonly"
```

and read secrets with


```r
vault$read("secret/database/admin")
```

```
## $value
## [1] "s3cret"
```


```r
vault$read("secret/database/readonly", field = "value")
```

```
## [1] "passw0rd"
```

or set secrets with

```r
vault$write("secret/webserver", list(password = "horsestaple"))
vault$read("secret/webserver")
```

or delete secrets with

```r
vault$delete("/secret/database/readonly")
```

## Installation

Install our current version via

```r
# install.packages("drat") # (if needed)
drat:::add("vimc")
install.packages("vaultr")
```

or install the bleeding edge with

```r
# install.packages("devtools") # (if needed)
devtools::install_gitub("vimc/vaultr", upgrade = FALSE)
```

## License

MIT © Imperial College of Science, Technology and Medicine
