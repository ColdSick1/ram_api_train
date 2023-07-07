import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

class IsFavoriteCubit extends Cubit<IsFavoriteState> {
  IsFavoriteCubit() : super(IsFavoriteInitial());
  bool isFavorite = false;

  tapLike(bool value) {
    isFavorite = value;
    emit(IsFavoriteInitial());
    if (isFavorite) {
      log('лайк поставлен');
    } else {
      log('лайк убран');
    }
  }
}

@immutable
abstract class IsFavoriteState {}

class IsFavoriteInitial extends IsFavoriteState {}
