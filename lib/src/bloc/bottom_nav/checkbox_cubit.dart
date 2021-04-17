import 'package:bloc/bloc.dart';

class CheckboxCubit extends Cubit<bool> {
  CheckboxCubit() : super(false);
  void selectCheckBox(bool value) {
    emit(value);
  }
}
