import 'dart:developer';

import 'package:bloc/bloc.dart';

class IsFavoriteCubit extends Cubit<bool> {
  IsFavoriteCubit() : super(false);

  tapLike(bool value) {
    emit(value);
    if (value) {
      log('лайк поставлен');
    } else {
      log('лайк убран');
    }
  }
}
