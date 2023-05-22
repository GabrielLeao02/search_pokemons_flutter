import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pokemon/features/pokemon/data/datasource/pokemon_datasource.dart';
import 'package:pokemon/features/pokemon/data/datasource/pokemons_datasource.dart';
import 'package:pokemon/features/pokemon/data/datasource/pokemons_species.dart';
import 'package:pokemon/features/pokemon/data/repositories/pokemon_repository_impl.dart';
import 'package:pokemon/features/pokemon/data/repositories/pokemon_specie.dart';
import 'package:pokemon/features/pokemon/data/repositories/pokemons_repository_impl.dart';
import 'package:pokemon/features/pokemon/domain/repositories/pekemon_species.dart';
import 'package:pokemon/features/pokemon/domain/repositories/pokemon_repository.dart';
import 'package:pokemon/features/pokemon/domain/repositories/pokemons_repository.dart';
import 'package:pokemon/features/pokemon/domain/usecases/pokemon_specie.dart';
import 'package:pokemon/features/pokemon/domain/usecases/pokemon_usecase.dart';
import 'package:pokemon/features/pokemon/domain/usecases/pokemons_usecase.dart';
import 'package:pokemon/presenter/home/bloc/pokemon_bloc.dart';
import 'package:pokemon/presenter/home/bloc/pokemon_specie_bloc.dart';

class PokemonInjector {
  void call() {
    pokemonInjector();
    pokemonsInjector();
    pokemonsBlocInjector();
    pokemonSpecieInjector();
    pokemonsSpecieBlocInjector();
  }

  void pokemonInjector() {
    GetIt.I.registerSingleton<Dio>(Dio());

    GetIt.I.registerFactory<PokemonDataSource>(
        () => PokemonDataSourceeImpl(GetIt.I<Dio>()));

    GetIt.I.registerFactory<PokemonRepository>(
        () => PokemonRepositoryImpl(GetIt.I<PokemonDataSource>()));

    GetIt.I.registerFactory<PokemonUseCase>(
        () => PokemonUseCaseImpl(GetIt.I<PokemonRepository>()));
  }

  void pokemonsInjector() {
    GetIt.I.registerFactory<PokemonsDataSource>(
        () => PokemonsDataSourceeImpl(GetIt.I<Dio>()));

    GetIt.I.registerFactory<PokemonsRepository>(
        () => PokemonsRepositoryImpl(GetIt.I<PokemonsDataSource>()));

    GetIt.I.registerFactory<PokemonsUseCase>(
        () => PokemonsUseCaseImpl(GetIt.I<PokemonsRepository>()));
  }

  void pokemonSpecieInjector() {
    GetIt.I.registerFactory<PokemonsSpecieDataSource>(
        () => PokemonsSpecieDataSourceImpl(GetIt.I<Dio>()));

    GetIt.I.registerFactory<PokemonSpecieRepository>(
        () => PokemonSpecieRepositoryImpl(GetIt.I<PokemonsSpecieDataSource>()));

    GetIt.I.registerFactory<PokemonSpecieUseCase>(
        () => PokemonSpecieUseCaseImpl(GetIt.I<PokemonSpecieRepository>()));
  }

  void pokemonsBlocInjector() {
    GetIt.I.registerFactory<PokemonBloc>(() =>
        PokemonBloc(GetIt.I<PokemonUseCase>(), GetIt.I<PokemonsUseCase>()));
  }

  void pokemonsSpecieBlocInjector() {
    GetIt.I.registerFactory<PokemonSpecieBloc>(
        () => PokemonSpecieBloc(GetIt.I<PokemonSpecieUseCase>()));
  }
}
