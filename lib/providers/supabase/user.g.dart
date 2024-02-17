// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$userAddHash() => r'138ca5adf2a912bbc86f79696b04d450b5b773c3';

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

/// See also [userAdd].
@ProviderFor(userAdd)
const userAddProvider = UserAddFamily();

/// See also [userAdd].
class UserAddFamily extends Family<AsyncValue<void>> {
  /// See also [userAdd].
  const UserAddFamily();

  /// See also [userAdd].
  UserAddProvider call(
    String currentUserToken,
  ) {
    return UserAddProvider(
      currentUserToken,
    );
  }

  @override
  UserAddProvider getProviderOverride(
    covariant UserAddProvider provider,
  ) {
    return call(
      provider.currentUserToken,
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
  String? get name => r'userAddProvider';
}

/// See also [userAdd].
class UserAddProvider extends AutoDisposeFutureProvider<void> {
  /// See also [userAdd].
  UserAddProvider(
    String currentUserToken,
  ) : this._internal(
          (ref) => userAdd(
            ref as UserAddRef,
            currentUserToken,
          ),
          from: userAddProvider,
          name: r'userAddProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$userAddHash,
          dependencies: UserAddFamily._dependencies,
          allTransitiveDependencies: UserAddFamily._allTransitiveDependencies,
          currentUserToken: currentUserToken,
        );

  UserAddProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.currentUserToken,
  }) : super.internal();

  final String currentUserToken;

  @override
  Override overrideWith(
    FutureOr<void> Function(UserAddRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UserAddProvider._internal(
        (ref) => create(ref as UserAddRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        currentUserToken: currentUserToken,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _UserAddProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UserAddProvider &&
        other.currentUserToken == currentUserToken;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, currentUserToken.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin UserAddRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `currentUserToken` of this provider.
  String get currentUserToken;
}

class _UserAddProviderElement extends AutoDisposeFutureProviderElement<void>
    with UserAddRef {
  _UserAddProviderElement(super.provider);

  @override
  String get currentUserToken => (origin as UserAddProvider).currentUserToken;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
