##' @section Methods:
##'
##' \describe{
##' \item{\code{api}}{
##'   Returns an api client object that can be used to directly interact with the vault server.
##'   \cr\emph{Usage:}\preformatted{api()}
##' }
##' \item{\code{read}}{
##'   Read a value from the vault.  This can be used to read any value that you have permission to read, and can also be used as an interface to a version 1 key-value store (see \code{\link{vault_client_kv1}}.  Similar to the vault CLI command \code{vault read}.
##'   \cr\emph{Usage:}\preformatted{read(path, field = NULL, metadata = FALSE)}
##'
##'   \emph{Arguments:}
##'   \itemize{
##'     \item{\code{path}:   Path for the secret to read, such as \code{/secret/mysecret}
##'     }
##'
##'     \item{\code{field}:   Optional field to read from the secret.  Each secret is stored as a key/value set (represented in R as a named list) and this is equivalent to using \code{[[field]]} on the return value. The default, \code{NULL}, returns the full set of values.
##'     }
##'
##'     \item{\code{metadata}:   Logical, indicating if we should return metadata for this secret (lease information etc) as an attribute along with the values itself.  Ignored if \code{field} is specified.
##'     }
##'   }
##' }
##' \item{\code{write}}{
##'   Write data into the vault.  This can be used to write any value that you have permission to write, and can also be used as an interface to a version 1 key-value store (see \code{\link{vault_client_kv1}}.  Similar to the vault CLI command \code{vault write}.
##'   \cr\emph{Usage:}\preformatted{write(path, data)}
##'
##'   \emph{Arguments:}
##'   \itemize{
##'     \item{\code{path}:   Path for the secret to write, such as \code{/secret/mysecret}
##'     }
##'
##'     \item{\code{data}:   A named list of values to write into the vault at this path. This \emph{replaces} any existing values.
##'     }
##'   }
##' }
##' \item{\code{list}}{
##'   List data in the vault at a given path.  This can be used to list keys, etc (e.g., at \code{/secret}).
##'   \cr\emph{Usage:}\preformatted{list(path, full_names = FALSE)}
##'
##'   \emph{Arguments:}
##'   \itemize{
##'     \item{\code{path}:   The path to list
##'     }
##'
##'     \item{\code{full_names}:   Logical, indicating if full paths (relative to the vault root) should be returned.
##'     }
##'   }
##'
##'   \emph{Value}:
##'   A character vector (of zero length if no keys are found).  Paths that are "directories" (i.e., that contain keys and could themselves be listed) will be returned with a trailing forward slash, e.g. \code{path/}
##' }
##' \item{\code{delete}}{
##'   Delete a value from the vault
##'   \cr\emph{Usage:}\preformatted{delete(path)}
##'
##'   \emph{Arguments:}
##'   \itemize{
##'     \item{\code{path}:   The path to delete
##'     }
##'   }
##' }
##' \item{\code{login}}{
##'   Login to the vault.  This method is more complicated than most.
##'   \cr\emph{Usage:}\preformatted{login(..., method = "token", mount = NULL, renew = FALSE,
##'       quiet = FALSE, token_only = FALSE, use_cache = TRUE)}
##'
##'   \emph{Arguments:}
##'   \itemize{
##'     \item{\code{...}:   Additional named parameters passed through to the underlying method
##'     }
##'
##'     \item{\code{method}:   Authentication method to use, as a string.  Supported values include \code{token} (the default), \code{github}, \code{approle} and \code{userpass}.
##'     }
##'
##'     \item{\code{mount}:   The mount path for the authentication backend, \emph{if it has been mounted in a nonstandard location}.  If not given, then it is assumed that the backend was mounted at a path corresponding to the method name.
##'     }
##'
##'     \item{\code{renew}:   Login, even if we appear to hold a valid token.  If \code{FALSE} and we have a token then \code{login} does nothing.
##'     }
##'
##'     \item{\code{quiet}:   Suppress some informational messages
##'     }
##'
##'     \item{\code{token_only}:   Logical, indicating that we do not want to actually log in, but instead just generate a token and return that.  IF given then \code{renew} is ignored and we always generate a new token.
##'     }
##'
##'     \item{\code{use_cache}:   Logical, indicating if we should look in the session cache for a token for this client.  If this is \code{TRUE} then when we log in we save a copy of the token for this session and any subsequent calls to \code{login} at this vault address that use \code{use_cache = TRUE} will be able to use this token.  Using cached tokens will make using some authentication backends that require authentication with external resources (e.g., \code{github}) much faster.
##'     }
##'   }
##' }
##' \item{\code{status}}{
##'   Return the status of the vault server, including whether it is sealed or not, and the vault server version.
##'   \cr\emph{Usage:}\preformatted{status()}
##' }
##' \item{\code{unwrap}}{
##'   Returns the original response inside the given wrapping token. The vault endpoints used by this method perform validation checks on the token, returns the original value on the wire rather than a JSON string representation of it, and ensures that the response is properly audit-logged.
##'   \cr\emph{Usage:}\preformatted{unwrap(token)}
##'
##'   \emph{Arguments:}
##'   \itemize{
##'     \item{\code{token}:   Specifies the wrapping token ID
##'     }
##'   }
##' }
##' \item{\code{wrap_lookup}}{
##'   Look up properties of a wrapping token.
##'   \cr\emph{Usage:}\preformatted{wrap_lookup(token)}
##'
##'   \emph{Arguments:}
##'   \itemize{
##'     \item{\code{token}:   Specifies the wrapping token ID to lookup
##'     }
##'   }
##' }
##' }
