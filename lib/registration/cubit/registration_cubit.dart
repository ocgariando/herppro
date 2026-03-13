import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:herppro/auth/repository/auth_repository.dart';

part 'registration_state.dart';

class RegistrationCubit extends Cubit<RegistrationState> {
  final AuthRepository _authRepository;

  RegistrationCubit(this._authRepository) : super(const RegistrationState());

  void emailChanged(String value) {
    emit(state.copyWith(email: value, status: RegistrationStatus.initial));
  }

  void passwordChanged(String value) {
    emit(state.copyWith(password: value, status: RegistrationStatus.initial));
  }

  Future<void> signUpWithCredentials() async {
    if (state.status == RegistrationStatus.submitting) return;
    emit(state.copyWith(status: RegistrationStatus.submitting));
    try {
      await _authRepository.signUp(email: state.email, password: state.password);
      emit(state.copyWith(status: RegistrationStatus.success));
    } on Exception catch (e) {
      emit(
        state.copyWith(
          status: RegistrationStatus.error,
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
