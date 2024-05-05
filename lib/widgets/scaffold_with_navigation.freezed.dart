// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'scaffold_with_navigation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$NavigationItem {
  /// Path in the router.
  String get path => throw _privateConstructorUsedError;

  /// Widget to show when navigating to this [path].
  WidgetBuilder get body => throw _privateConstructorUsedError;

  /// Icon in the navigation bar.
  IconData get icon => throw _privateConstructorUsedError;

  /// Icon in the navigation bar when selected.
  IconData? get selectedIcon => throw _privateConstructorUsedError;

  /// Label in the navigation bar.
  String get label => throw _privateConstructorUsedError;

  /// The subroutes of the route from this [path].
  List<RouteBase> get routes => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NavigationItemCopyWith<NavigationItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NavigationItemCopyWith<$Res> {
  factory $NavigationItemCopyWith(
          NavigationItem value, $Res Function(NavigationItem) then) =
      _$NavigationItemCopyWithImpl<$Res, NavigationItem>;
  @useResult
  $Res call(
      {String path,
      WidgetBuilder body,
      IconData icon,
      IconData? selectedIcon,
      String label,
      List<RouteBase> routes});
}

/// @nodoc
class _$NavigationItemCopyWithImpl<$Res, $Val extends NavigationItem>
    implements $NavigationItemCopyWith<$Res> {
  _$NavigationItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? path = null,
    Object? body = null,
    Object? icon = null,
    Object? selectedIcon = freezed,
    Object? label = null,
    Object? routes = null,
  }) {
    return _then(_value.copyWith(
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      body: null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as WidgetBuilder,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as IconData,
      selectedIcon: freezed == selectedIcon
          ? _value.selectedIcon
          : selectedIcon // ignore: cast_nullable_to_non_nullable
              as IconData?,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      routes: null == routes
          ? _value.routes
          : routes // ignore: cast_nullable_to_non_nullable
              as List<RouteBase>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NavigationItemImplCopyWith<$Res>
    implements $NavigationItemCopyWith<$Res> {
  factory _$$NavigationItemImplCopyWith(_$NavigationItemImpl value,
          $Res Function(_$NavigationItemImpl) then) =
      __$$NavigationItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String path,
      WidgetBuilder body,
      IconData icon,
      IconData? selectedIcon,
      String label,
      List<RouteBase> routes});
}

/// @nodoc
class __$$NavigationItemImplCopyWithImpl<$Res>
    extends _$NavigationItemCopyWithImpl<$Res, _$NavigationItemImpl>
    implements _$$NavigationItemImplCopyWith<$Res> {
  __$$NavigationItemImplCopyWithImpl(
      _$NavigationItemImpl _value, $Res Function(_$NavigationItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? path = null,
    Object? body = null,
    Object? icon = null,
    Object? selectedIcon = freezed,
    Object? label = null,
    Object? routes = null,
  }) {
    return _then(_$NavigationItemImpl(
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      body: null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as WidgetBuilder,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as IconData,
      selectedIcon: freezed == selectedIcon
          ? _value.selectedIcon
          : selectedIcon // ignore: cast_nullable_to_non_nullable
              as IconData?,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      routes: null == routes
          ? _value._routes
          : routes // ignore: cast_nullable_to_non_nullable
              as List<RouteBase>,
    ));
  }
}

/// @nodoc

class _$NavigationItemImpl implements _NavigationItem {
  _$NavigationItemImpl(
      {required this.path,
      required this.body,
      required this.icon,
      this.selectedIcon,
      required this.label,
      final List<RouteBase> routes = const <RouteBase>[]})
      : _routes = routes;

  /// Path in the router.
  @override
  final String path;

  /// Widget to show when navigating to this [path].
  @override
  final WidgetBuilder body;

  /// Icon in the navigation bar.
  @override
  final IconData icon;

  /// Icon in the navigation bar when selected.
  @override
  final IconData? selectedIcon;

  /// Label in the navigation bar.
  @override
  final String label;

  /// The subroutes of the route from this [path].
  final List<RouteBase> _routes;

  /// The subroutes of the route from this [path].
  @override
  @JsonKey()
  List<RouteBase> get routes {
    if (_routes is EqualUnmodifiableListView) return _routes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_routes);
  }

  @override
  String toString() {
    return 'NavigationItem(path: $path, body: $body, icon: $icon, selectedIcon: $selectedIcon, label: $label, routes: $routes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NavigationItemImpl &&
            (identical(other.path, path) || other.path == path) &&
            (identical(other.body, body) || other.body == body) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.selectedIcon, selectedIcon) ||
                other.selectedIcon == selectedIcon) &&
            (identical(other.label, label) || other.label == label) &&
            const DeepCollectionEquality().equals(other._routes, _routes));
  }

  @override
  int get hashCode => Object.hash(runtimeType, path, body, icon, selectedIcon,
      label, const DeepCollectionEquality().hash(_routes));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NavigationItemImplCopyWith<_$NavigationItemImpl> get copyWith =>
      __$$NavigationItemImplCopyWithImpl<_$NavigationItemImpl>(
          this, _$identity);
}

abstract class _NavigationItem implements NavigationItem {
  factory _NavigationItem(
      {required final String path,
      required final WidgetBuilder body,
      required final IconData icon,
      final IconData? selectedIcon,
      required final String label,
      final List<RouteBase> routes}) = _$NavigationItemImpl;

  @override

  /// Path in the router.
  String get path;
  @override

  /// Widget to show when navigating to this [path].
  WidgetBuilder get body;
  @override

  /// Icon in the navigation bar.
  IconData get icon;
  @override

  /// Icon in the navigation bar when selected.
  IconData? get selectedIcon;
  @override

  /// Label in the navigation bar.
  String get label;
  @override

  /// The subroutes of the route from this [path].
  List<RouteBase> get routes;
  @override
  @JsonKey(ignore: true)
  _$$NavigationItemImplCopyWith<_$NavigationItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
