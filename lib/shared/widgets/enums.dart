/// [SecureStorageKeys]
enum SecureStorageKeys {
  /// save `token` to this key
  authToken,
}

/// `AuthStatus`
enum AuthStatus {
  ///
  unknown,

  /// user is not logged in
  notLoggedIn,

  /// user is logged in
  loggedIn,

  /// user is logged in but token is invalid
  loading,
}
