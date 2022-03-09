import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:core_app/features/home/cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState(isLoading: true));

  Future<void> loadInitialData() async {
    final stableState = state;
    try {
      emit(state.copyWith(isLoading: true));

      await Future.delayed(Duration(seconds: 2));

      emit(state.copyWith(isLoading: false));
      await Future.delayed(Duration(seconds: 2));
      emit(state.copyWith(error: "hata"));
    } catch (error) {
      emit(state.copyWith(error: error.toString()));
      emit(stableState.copyWith(isLoading: false));
    }
  }
}
