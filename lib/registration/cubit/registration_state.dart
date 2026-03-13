part of 'registration_cubit.dart';

enum RegistrationStatus { initial, submitting, success, error }

class RegistrationState extends Equatable {
  const RegistrationState({
    this.email = '',
    this.password = '',
    this.status = RegistrationStatus.initial,
    this.errorMessage,
  });

  final String email;
  final String password;
  final RegistrationStatus status;
  final String? errorMessage;

  @override
  List<Object?> get props => [email, password, status, errorMessage];

  RegistrationState copyWith({
    String? email,
    String? password,
    RegistrationStatus? status,
    String? errorMessage,
  }) {
    return RegistrationState(
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
