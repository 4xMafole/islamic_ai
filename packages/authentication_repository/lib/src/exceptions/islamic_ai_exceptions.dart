/// Thrown when ozare api fails.
class IslamicAIException implements Exception {
  /// Thrown when ozare api fails.
  const IslamicAIException(this.errorMessage);

  final String errorMessage;
}

/// Thrown when fails to get owner.
class IslamicAIGetOwnerException extends IslamicAIException {
  /// Thrown when fails to get owner.
  const IslamicAIGetOwnerException(super.errorMessage);
}

/// Thrown when fails to sign up user.
class IslamicAISignUpWithEmailAndPasswordFailure extends IslamicAIException {
  /// Thrown when fails to sign up user.
  const IslamicAISignUpWithEmailAndPasswordFailure(super.errorMessage);
}

/// Thrown when fails to logout.
class IslamicAILogOutFailure extends IslamicAIException {
  /// Thrown when fails to logout.
  const IslamicAILogOutFailure(super.errorMessage);
}

/// Thrown when fails to reset password.
class IslamicAIResetPasswordFailure extends IslamicAIException {
  /// Thrown when fails to reset password.
  const IslamicAIResetPasswordFailure(super.errorMessage);
}

/// Thrown when fails to sign in with google.
class IslamicAISignWithGoogleException extends IslamicAIException {
  /// Thrown when fails to sign in with google.
  const IslamicAISignWithGoogleException(super.errorMessage);
}

/// Thrown when fails to sign in with apple.
class IslamicAISignWithAppleException extends IslamicAIException {
  /// Thrown when fails to sign in with apple.
  const IslamicAISignWithAppleException(super.errorMessage);
}

/// Thrown when fails to sign in with microsoft.
class IslamicAISignWithMicrosoftException extends IslamicAIException {
  /// Thrown when fails to sign in with microsoft.
  const IslamicAISignWithMicrosoftException(super.errorMessage);
}

/// Thrown when fails to sign in anonymously.
class IslamicAISignAnonymouslyException extends IslamicAIException {
  /// Thrown when fails to sign in anonymously.
  const IslamicAISignAnonymouslyException(super.errorMessage);
}
