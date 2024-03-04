import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_booking/app/view/onboarding/bloc/onboarding_event.dart';
import 'package:hotel_booking/app/view/onboarding/bloc/onboarding_state.dart';



class OnboardingBloc extends Bloc<OnboardingEvents, OnboardingStates> {
  OnboardingBloc() : super(OnboardingStates()) {
    on<OnboardingEvents>((event, emit) {
      return emit(OnboardingStates(pageIndex: state.pageIndex));
    });
  }
}
