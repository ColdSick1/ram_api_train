import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ram_api/models/character_model.dart';

class CharacterRepository {
  // final dio = Dio();

  static Future<Either<Exception, List<CharacterModel>>> getHttp(
      List list) async {
    Response response = await Dio()
        .get('https://rickandmortyapi.com/api/character/${list.toString()}');
    final List listCharacters = response.data;
    return Either.cond(
      () => true,
      () => listCharacters.map((e) => CharacterModel.fromJson(e)).toList(),
      () => Exception(),
    );
  }
}
// response.statusCode! >= 200 && response.statusCode! < 300,
