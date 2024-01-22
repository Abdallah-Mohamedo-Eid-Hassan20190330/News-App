import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_new_sdk/shop_app/register_cubit/temp_state.dart';

class TempCubit extends Cubit<TempStates> {
  TempCubit() : super(TempStates());

  static TempCubit get(context) => BlocProvider.of(context);

  bool isSecure = true;
  bool loginIsSecure = true;

  void toggleVisibility() {
    isSecure = !isSecure;
    emit(ToggleVisibility());
  }

  void toggleLoginVisibility() {
    loginIsSecure = !loginIsSecure;
    emit(ToggleVisibility());
  }
}
