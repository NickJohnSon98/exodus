import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class OnboardingState extends Equatable {
  int index;
  OnboardingState({
    required this.index,
  });

  @override
  List<Object> get props => [index];

  OnboardingState copyWith({
    int? index,
  }) {
    return OnboardingState(index: index ?? this.index);
  }

  factory OnboardingState.initial() {
    return OnboardingState(index: 0);
  }
}
