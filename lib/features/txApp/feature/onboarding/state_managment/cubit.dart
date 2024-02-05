import 'package:exodus/features/txApp/feature/onboarding/state_managment/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(OnboardingState.initial());

  void index() {
    emit(state.copyWith(index: state.index + 1));
  }
}
