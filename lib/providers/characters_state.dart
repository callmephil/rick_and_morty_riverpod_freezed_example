// lib/models/characters_state.dart

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_example/models/character.dart';

part 'characters_state.freezed.dart';

@freezed
abstract class CharactersState with _$CharactersState {
  const factory CharactersState({
    @Default(AsyncValue<List<Character>>.loading())
    AsyncValue<List<Character>> characters,
    @Default('') String filter,
    @Default(false) bool isLoadingMore,
  }) = _CharactersState;
}
