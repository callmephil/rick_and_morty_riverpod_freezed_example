// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'characters_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CharactersState {

 AsyncValue<List<Character>> get characters; String get filter; bool get isLoadingMore;
/// Create a copy of CharactersState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CharactersStateCopyWith<CharactersState> get copyWith => _$CharactersStateCopyWithImpl<CharactersState>(this as CharactersState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CharactersState&&(identical(other.characters, characters) || other.characters == characters)&&(identical(other.filter, filter) || other.filter == filter)&&(identical(other.isLoadingMore, isLoadingMore) || other.isLoadingMore == isLoadingMore));
}


@override
int get hashCode => Object.hash(runtimeType,characters,filter,isLoadingMore);

@override
String toString() {
  return 'CharactersState(characters: $characters, filter: $filter, isLoadingMore: $isLoadingMore)';
}


}

/// @nodoc
abstract mixin class $CharactersStateCopyWith<$Res>  {
  factory $CharactersStateCopyWith(CharactersState value, $Res Function(CharactersState) _then) = _$CharactersStateCopyWithImpl;
@useResult
$Res call({
 AsyncValue<List<Character>> characters, String filter, bool isLoadingMore
});




}
/// @nodoc
class _$CharactersStateCopyWithImpl<$Res>
    implements $CharactersStateCopyWith<$Res> {
  _$CharactersStateCopyWithImpl(this._self, this._then);

  final CharactersState _self;
  final $Res Function(CharactersState) _then;

/// Create a copy of CharactersState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? characters = null,Object? filter = null,Object? isLoadingMore = null,}) {
  return _then(_self.copyWith(
characters: null == characters ? _self.characters : characters // ignore: cast_nullable_to_non_nullable
as AsyncValue<List<Character>>,filter: null == filter ? _self.filter : filter // ignore: cast_nullable_to_non_nullable
as String,isLoadingMore: null == isLoadingMore ? _self.isLoadingMore : isLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// @nodoc


class _CharactersState implements CharactersState {
  const _CharactersState({this.characters = const AsyncValue<List<Character>>.loading(), this.filter = '', this.isLoadingMore = false});
  

@override@JsonKey() final  AsyncValue<List<Character>> characters;
@override@JsonKey() final  String filter;
@override@JsonKey() final  bool isLoadingMore;

/// Create a copy of CharactersState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CharactersStateCopyWith<_CharactersState> get copyWith => __$CharactersStateCopyWithImpl<_CharactersState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CharactersState&&(identical(other.characters, characters) || other.characters == characters)&&(identical(other.filter, filter) || other.filter == filter)&&(identical(other.isLoadingMore, isLoadingMore) || other.isLoadingMore == isLoadingMore));
}


@override
int get hashCode => Object.hash(runtimeType,characters,filter,isLoadingMore);

@override
String toString() {
  return 'CharactersState(characters: $characters, filter: $filter, isLoadingMore: $isLoadingMore)';
}


}

/// @nodoc
abstract mixin class _$CharactersStateCopyWith<$Res> implements $CharactersStateCopyWith<$Res> {
  factory _$CharactersStateCopyWith(_CharactersState value, $Res Function(_CharactersState) _then) = __$CharactersStateCopyWithImpl;
@override @useResult
$Res call({
 AsyncValue<List<Character>> characters, String filter, bool isLoadingMore
});




}
/// @nodoc
class __$CharactersStateCopyWithImpl<$Res>
    implements _$CharactersStateCopyWith<$Res> {
  __$CharactersStateCopyWithImpl(this._self, this._then);

  final _CharactersState _self;
  final $Res Function(_CharactersState) _then;

/// Create a copy of CharactersState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? characters = null,Object? filter = null,Object? isLoadingMore = null,}) {
  return _then(_CharactersState(
characters: null == characters ? _self.characters : characters // ignore: cast_nullable_to_non_nullable
as AsyncValue<List<Character>>,filter: null == filter ? _self.filter : filter // ignore: cast_nullable_to_non_nullable
as String,isLoadingMore: null == isLoadingMore ? _self.isLoadingMore : isLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
