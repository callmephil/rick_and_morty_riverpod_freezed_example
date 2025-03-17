// lib/providers/character_provider.dart

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_example/models/character.dart';
import 'package:riverpod_example/providers/characters_state.dart';
import 'package:riverpod_example/services/rick_and_morty_service.dart';

part 'character_provider.g.dart';

@riverpod
RickAndMortyService rickAndMortyService(Ref _) {
  return RickAndMortyService();
}

/// An AsyncNotifier that manages loading characters + a filter string
@riverpod
class CharactersNotifier extends _$CharactersNotifier {
  @override
  FutureOr<CharactersState> build() async {
    // This is called once when the provider is first created.
    // We'll load our characters from the API and return the state.
    final service = ref.read(rickAndMortyServiceProvider);

    try {
      final list = await service.fetchCharacters();
      return CharactersState(characters: AsyncData(list));
    } on Exception catch (err, st) {
      return CharactersState(characters: AsyncError(err, st));
    }
  }

  /// Load the next page of characters
  Future<void> loadNextPage() async {
    final currentState = state.valueOrNull;
    if (currentState == null || currentState.characters.isLoading) return;

    // Indicate that we're loading more while keeping current data
    state = AsyncValue.data(currentState.copyWith(isLoadingMore: true));

    final service = ref.read(rickAndMortyServiceProvider);
    final currentCharacters = currentState.characters.valueOrNull ?? [];
    final nextPage = (currentCharacters.length ~/ 20) + 1;

    // Use AsyncValue.guard to handle network errors elegantly
    final result = await AsyncValue.guard(
      () => service.fetchNextPage(nextPage),
    );

    // Update state based on the result
    state = AsyncValue.data(
      currentState.copyWith(
        isLoadingMore: false,
        characters: result.when(
          data: (newCharacters) {
            return AsyncData([...currentCharacters, ...newCharacters]);
          },
          error: AsyncError.new,
          loading: () => currentState.characters,
        ),
      ),
    );
  }

  /// Update the filter
  void setFilter(String newFilter) {
    // We read the old data from the state
    final oldState = state.valueOrNull;
    if (oldState == null) return;

    // Keep the same characters, but update filter
    final updated = oldState.copyWith(filter: newFilter);

    // Wrap in AsyncValue so UI can still do asyncValue checks
    state = AsyncValue.data(updated);
  }

  /// Return the filtered list from the current state
  List<Character> filteredCharacters() {
    final s = state.valueOrNull;
    if (s == null) return [];

    final list = s.characters.valueOrNull ?? [];
    final f = s.filter.trim().toLowerCase();

    if (f.isEmpty) {
      return list;
    }

    return list.where((c) => c.name.toLowerCase().contains(f)).toList();
  }
}

/// A provider that fetches a specific character by ID
@riverpod
Future<Character> characterById(Ref ref, {required int id}) {
  final service = ref.watch(rickAndMortyServiceProvider);
  return service.fetchCharacterById(id);
}
