part of 'registration_cubit.dart';

enum RegistrationStatus { initial, submitting, success, error }

class RegistrationState extends Equatable {
  final String email;
  final String password;
  final RegistrationStatus status;

  const RegistrationState({
    required this.email,
    required this.password,
    required this.status,
  });

  factory RegistrationState.initial() {
    return const RegistrationState(
      email: '',
      password: '',
      status: RegistrationStatus.initial,
    );
  }

  @override
  List<Object> get props => [email, password, status];

  RegistrationState copyWith({
    String? email,
    String? password,
    RegistrationStatus? status,
  }) {
    return RegistrationState(
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
    );
  }
}
