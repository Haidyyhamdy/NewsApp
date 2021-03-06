import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/cubit/states.dart';
import 'package:news_app/shared/network/local/cache_helper.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitialStates());
  static AppCubit get(context) => BlocProvider.of(context);

  bool isDark = false;
  void changeAppMode({bool? fromShared}) {
    if (fromShared != null) {
      isDark = fromShared;
      emit(AppChangeMode());
    } else {
      isDark = !isDark;
      CacheHelper.putData(key: 'isDark', value: isDark)!.then((value) {
        // kda na wadet f l sharedPref
        emit(AppChangeMode());
      });
    }
  }
}
