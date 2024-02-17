// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_riverpod.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$currentUserHash() => r'f746dd8ff985144a32f589b52ab9ce4bf7bebbaa';

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

/// See also [currentUser].
@ProviderFor(currentUser)
const currentUserProvider = CurrentUserFamily();

/// See also [currentUser].
class CurrentUserFamily extends Family<AsyncValue<UserModel>> {
  /// See also [currentUser].
  const CurrentUserFamily();

  /// See also [currentUser].
  CurrentUserProvider call(
    String userToken,
  ) {
    return CurrentUserProvider(
      userToken,
    );
  }

  @override
  CurrentUserProvider getProviderOverride(
    covariant CurrentUserProvider provider,
  ) {
    return call(
      provider.userToken,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'currentUserProvider';
}

/// See also [currentUser].
class CurrentUserProvider extends AutoDisposeFutureProvider<UserModel> {
  /// See also [currentUser].
  CurrentUserProvider(
    String userToken,
  ) : this._internal(
          (ref) => currentUser(
            ref as CurrentUserRef,
            userToken,
          ),
          from: currentUserProvider,
          name: r'currentUserProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$currentUserHash,
          dependencies: CurrentUserFamily._dependencies,
          allTransitiveDependencies:
              CurrentUserFamily._allTransitiveDependencies,
          userToken: userToken,
        );

  CurrentUserProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.userToken,
  }) : super.internal();

  final String userToken;

  @override
  Override overrideWith(
    FutureOr<UserModel> Function(CurrentUserRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CurrentUserProvider._internal(
        (ref) => create(ref as CurrentUserRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        userToken: userToken,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<UserModel> createElement() {
    return _CurrentUserProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CurrentUserProvider && other.userToken == userToken;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userToken.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CurrentUserRef on AutoDisposeFutureProviderRef<UserModel> {
  /// The parameter `userToken` of this provider.
  String get userToken;
}

class _CurrentUserProviderElement
    extends AutoDisposeFutureProviderElement<UserModel> with CurrentUserRef {
  _CurrentUserProviderElement(super.provider);

  @override
  String get userToken => (origin as CurrentUserProvider).userToken;
}

String _$updateUserHash() => r'd9980fca5f37ffc1bf789a78c2ef2a96a78bd244';

/// See also [updateUser].
@ProviderFor(updateUser)
const updateUserProvider = UpdateUserFamily();

/// See also [updateUser].
class UpdateUserFamily extends Family<AsyncValue<void>> {
  /// See also [updateUser].
  const UpdateUserFamily();

  /// See also [updateUser].
  UpdateUserProvider call(
    int id,
    String upEmail,
    String upName,
    String upPassword,
  ) {
    return UpdateUserProvider(
      id,
      upEmail,
      upName,
      upPassword,
    );
  }

  @override
  UpdateUserProvider getProviderOverride(
    covariant UpdateUserProvider provider,
  ) {
    return call(
      provider.id,
      provider.upEmail,
      provider.upName,
      provider.upPassword,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'updateUserProvider';
}

/// See also [updateUser].
class UpdateUserProvider extends AutoDisposeFutureProvider<void> {
  /// See also [updateUser].
  UpdateUserProvider(
    int id,
    String upEmail,
    String upName,
    String upPassword,
  ) : this._internal(
          (ref) => updateUser(
            ref as UpdateUserRef,
            id,
            upEmail,
            upName,
            upPassword,
          ),
          from: updateUserProvider,
          name: r'updateUserProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$updateUserHash,
          dependencies: UpdateUserFamily._dependencies,
          allTransitiveDependencies:
              UpdateUserFamily._allTransitiveDependencies,
          id: id,
          upEmail: upEmail,
          upName: upName,
          upPassword: upPassword,
        );

  UpdateUserProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
    required this.upEmail,
    required this.upName,
    required this.upPassword,
  }) : super.internal();

  final int id;
  final String upEmail;
  final String upName;
  final String upPassword;

  @override
  Override overrideWith(
    FutureOr<void> Function(UpdateUserRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UpdateUserProvider._internal(
        (ref) => create(ref as UpdateUserRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
        upEmail: upEmail,
        upName: upName,
        upPassword: upPassword,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _UpdateUserProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UpdateUserProvider &&
        other.id == id &&
        other.upEmail == upEmail &&
        other.upName == upName &&
        other.upPassword == upPassword;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);
    hash = _SystemHash.combine(hash, upEmail.hashCode);
    hash = _SystemHash.combine(hash, upName.hashCode);
    hash = _SystemHash.combine(hash, upPassword.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin UpdateUserRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `id` of this provider.
  int get id;

  /// The parameter `upEmail` of this provider.
  String get upEmail;

  /// The parameter `upName` of this provider.
  String get upName;

  /// The parameter `upPassword` of this provider.
  String get upPassword;
}

class _UpdateUserProviderElement extends AutoDisposeFutureProviderElement<void>
    with UpdateUserRef {
  _UpdateUserProviderElement(super.provider);

  @override
  int get id => (origin as UpdateUserProvider).id;
  @override
  String get upEmail => (origin as UpdateUserProvider).upEmail;
  @override
  String get upName => (origin as UpdateUserProvider).upName;
  @override
  String get upPassword => (origin as UpdateUserProvider).upPassword;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
