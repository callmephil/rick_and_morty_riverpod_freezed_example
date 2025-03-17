// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$rickAndMortyServiceHash() =>
    r'd16aaae4a327bf286ac40bf4dec2b1be882313b1';

/// See also [rickAndMortyService].
@ProviderFor(rickAndMortyService)
final rickAndMortyServiceProvider =
    AutoDisposeProvider<RickAndMortyService>.internal(
      rickAndMortyService,
      name: r'rickAndMortyServiceProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$rickAndMortyServiceHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef RickAndMortyServiceRef = AutoDisposeProviderRef<RickAndMortyService>;
String _$characterByIdHash() => r'9279e250c81d5c4e3abd9799ac42778381495daa';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// A provider that fetches a specific character by ID
///
/// Copied from [characterById].
@ProviderFor(characterById)
const characterByIdProvider = CharacterByIdFamily();

/// A provider that fetches a specific character by ID
///
/// Copied from [characterById].
class CharacterByIdFamily extends Family<AsyncValue<Character>> {
  /// A provider that fetches a specific character by ID
  ///
  /// Copied from [characterById].
  const CharacterByIdFamily();

  /// A provider that fetches a specific character by ID
  ///
  /// Copied from [characterById].
  CharacterByIdProvider call({required int id}) {
    return CharacterByIdProvider(id: id);
  }

  @override
  CharacterByIdProvider getProviderOverride(
    covariant CharacterByIdProvider provider,
  ) {
    return call(id: provider.id);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'characterByIdProvider';
}

/// A provider that fetches a specific character by ID
///
/// Copied from [characterById].
class CharacterByIdProvider extends AutoDisposeFutureProvider<Character> {
  /// A provider that fetches a specific character by ID
  ///
  /// Copied from [characterById].
  CharacterByIdProvider({required int id})
    : this._internal(
        (ref) => characterById(ref as CharacterByIdRef, id: id),
        from: characterByIdProvider,
        name: r'characterByIdProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$characterByIdHash,
        dependencies: CharacterByIdFamily._dependencies,
        allTransitiveDependencies:
            CharacterByIdFamily._allTransitiveDependencies,
        id: id,
      );

  CharacterByIdProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final int id;

  @override
  Override overrideWith(
    FutureOr<Character> Function(CharacterByIdRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CharacterByIdProvider._internal(
        (ref) => create(ref as CharacterByIdRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Character> createElement() {
    return _CharacterByIdProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CharacterByIdProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin CharacterByIdRef on AutoDisposeFutureProviderRef<Character> {
  /// The parameter `id` of this provider.
  int get id;
}

class _CharacterByIdProviderElement
    extends AutoDisposeFutureProviderElement<Character>
    with CharacterByIdRef {
  _CharacterByIdProviderElement(super.provider);

  @override
  int get id => (origin as CharacterByIdProvider).id;
}

String _$charactersNotifierHash() =>
    r'4d47e60686fbd382381ffb2ffec52cfc3ba6d974';

/// An AsyncNotifier that manages loading characters + a filter string
///
/// Copied from [CharactersNotifier].
@ProviderFor(CharactersNotifier)
final charactersNotifierProvider = AutoDisposeAsyncNotifierProvider<
  CharactersNotifier,
  CharactersState
>.internal(
  CharactersNotifier.new,
  name: r'charactersNotifierProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$charactersNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CharactersNotifier = AutoDisposeAsyncNotifier<CharactersState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
