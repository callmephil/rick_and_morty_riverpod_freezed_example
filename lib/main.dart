import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/providers/character_provider.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rick & Morty Filter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
      home: const CharactersScreen(),
    );
  }
}

class CharactersScreen extends ConsumerWidget {
  const CharactersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(charactersNotifierProvider);

    final notifier = ref.read(charactersNotifierProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Rick & Morty Filter Demo'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              ref.invalidate(charactersNotifierProvider);
            },
          ),
          IconButton(
            onPressed: () => unawaited(notifier.loadNextPage()),
            icon: const Icon(Icons.arrow_downward),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: TextField(
              decoration: const InputDecoration(
                labelText: 'Filter by name',
                border: OutlineInputBorder(),
              ),
              onChanged: notifier.setFilter,
              key: const ValueKey('filter-input'),
            ),
          ),
          Expanded(
            child: state.when(
              data: (it) {
                final displayed = notifier.filteredCharacters();
                if (displayed.isEmpty) {
                  return const Center(
                    child: Text('No characters match this filter.'),
                  );
                }
                return ListView.builder(
                  itemCount: displayed.length + 1,
                  itemBuilder: (_, index) {
                    if (index == displayed.length) {
                      return Padding(
                        padding: const EdgeInsets.all(8),
                        child: Center(
                          child: FilledButton(
                            style: FilledButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            onPressed: () => unawaited(notifier.loadNextPage()),
                            child: const Text('Load more'),
                          ),
                        ),
                      );
                    }

                    final character = displayed.elementAtOrNull(index);
                    if (character == null) {
                      return const SizedBox();
                    }

                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(character.image),
                      ),
                      title: Text(character.name),
                      subtitle: Text(
                        '${character.species} • Status: ${character.status}',
                      ),
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute<Widget>(
                            builder: (_) {
                              return CharacterDetailsScreen(
                                characterId: character.id,
                              );
                            },
                          ),
                        );
                      },
                    );
                  },
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (err, stack) {
                return Center(
                  child: Text(
                    'Error: $err',
                    style: const TextStyle(color: Colors.red),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class CharacterDetailsScreen extends ConsumerWidget {
  const CharacterDetailsScreen({super.key, required this.characterId});
  final int characterId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncChar = ref.watch(characterByIdProvider(id: characterId));

    return Scaffold(
      appBar: AppBar(title: Text('Character #$characterId')),
      body: asyncChar.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, st) {
          return Center(
            child: Text(
              'Error: $err',
              style: const TextStyle(color: Colors.red),
            ),
          );
        },
        data: (character) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Material(
                    child: Image.network(
                      character.image,
                      semanticLabel: character.name,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  character.name,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 8),
                Text('Species: ${character.species}'),
                Text('Status: ${character.status}'),
              ],
            ),
          );
        },
      ),
    );
  }
}
