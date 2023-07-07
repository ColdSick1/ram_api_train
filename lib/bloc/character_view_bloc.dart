import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../models/character_model.dart';
import '../models/character_repo.dart';

class CharacterViewBloc extends Bloc<CharacterViewEvent, CharacterViewState> {
  CharacterViewBloc() : super(CharacterViewInitial()) {
    on<CharacterViewInit>((event, emit) {
      emit(
        CharacterViewInitial(),
      );
    });
    on<CharacterViewLoad>((event, emit) async {
      List list = List.generate(
        10,
        (index) => Random().nextInt(500) + 1,
      );
      emit(CharacterViewLoading());
      final characterModelData = await CharacterRepository.getHttp(list);
      characterModelData.fold(
        (l) => emit(ErrorState()),
        (r) => emit(CharacterViewLoaded(r)),
      );
    });
  }
}

@immutable
abstract class CharacterViewEvent {}

class CharacterViewInit extends CharacterViewEvent {}

class CharacterViewLoad extends CharacterViewEvent {}

@immutable
abstract class CharacterViewState {}

class CharacterViewInitial extends CharacterViewState {}

class CharacterViewLoaded extends CharacterViewState {
  final List<CharacterModel> list;
  CharacterViewLoaded(this.list);
}

class CharacterViewLoading extends CharacterViewState {}

class ErrorState extends CharacterViewState {
  ErrorState();
}
