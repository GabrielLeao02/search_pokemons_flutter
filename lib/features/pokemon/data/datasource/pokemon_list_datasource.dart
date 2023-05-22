import 'package:dio/dio.dart';
import 'package:pokemon/features/pokemon/data/model/pokemon_model.dart';
import 'package:pokemon/share/base/datasource/data_source.dart';

abstract class PokemonListDataSource implements DataSource<List<PokemonModel>> {}

class PokemonListDataSourceeImpl implements PokemonListDataSource {
  final endPoint = 'https://pokeapi.co/api/v2/pokemon/?offset=0&limit=50';
  final Dio _httpFacade;

  PokemonListDataSourceeImpl(this._httpFacade);

  @override
  Future<List<PokemonModel>> call(
      {Map<String, dynamic>? param, FromJson? fromJson}) async {
    Response response = await _httpFacade.get(endPoint);
    Map<String, dynamic> data = response.data;
    return fromJson!(data);
  }
}