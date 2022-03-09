import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'next_state.dart';

class NextCubit extends Cubit<NextState> {
  NextCubit() : super(NextInitial()) {}
  void init() {
    print(" next init ");
  }
}
