class SignUpWithEmailAndPasswordFailure {
  final String message;

  const SignUpWithEmailAndPasswordFailure([this.message = "Lỗi"]);
  factory SignUpWithEmailAndPasswordFailure.code(String code) {
    switch (code) {
      case "email-already-in-use":
        return const SignUpWithEmailAndPasswordFailure("Email đã được sử dụng");
      case "weak-password":
        return const SignUpWithEmailAndPasswordFailure("Mật khẩu quá yếu");
      default:
        return const SignUpWithEmailAndPasswordFailure();
    }
  }
}
