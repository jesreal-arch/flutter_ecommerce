// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'supabase_services.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$loginSupabaseHash() => r'125b64f51068fd023637985448a38a58b43903f4';

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

/// See also [loginSupabase].
@ProviderFor(loginSupabase)
const loginSupabaseProvider = LoginSupabaseFamily();

/// See also [loginSupabase].
class LoginSupabaseFamily extends Family<AsyncValue<void>> {
  /// See also [loginSupabase].
  const LoginSupabaseFamily();

  /// See also [loginSupabase].
  LoginSupabaseProvider call(
    String emailUser,
    String passwordUser,
  ) {
    return LoginSupabaseProvider(
      emailUser,
      passwordUser,
    );
  }

  @override
  LoginSupabaseProvider getProviderOverride(
    covariant LoginSupabaseProvider provider,
  ) {
    return call(
      provider.emailUser,
      provider.passwordUser,
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
  String? get name => r'loginSupabaseProvider';
}

/// See also [loginSupabase].
class LoginSupabaseProvider extends AutoDisposeFutureProvider<void> {
  /// See also [loginSupabase].
  LoginSupabaseProvider(
    String emailUser,
    String passwordUser,
  ) : this._internal(
          (ref) => loginSupabase(
            ref as LoginSupabaseRef,
            emailUser,
            passwordUser,
          ),
          from: loginSupabaseProvider,
          name: r'loginSupabaseProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$loginSupabaseHash,
          dependencies: LoginSupabaseFamily._dependencies,
          allTransitiveDependencies:
              LoginSupabaseFamily._allTransitiveDependencies,
          emailUser: emailUser,
          passwordUser: passwordUser,
        );

  LoginSupabaseProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.emailUser,
    required this.passwordUser,
  }) : super.internal();

  final String emailUser;
  final String passwordUser;

  @override
  Override overrideWith(
    FutureOr<void> Function(LoginSupabaseRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: LoginSupabaseProvider._internal(
        (ref) => create(ref as LoginSupabaseRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        emailUser: emailUser,
        passwordUser: passwordUser,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _LoginSupabaseProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is LoginSupabaseProvider &&
        other.emailUser == emailUser &&
        other.passwordUser == passwordUser;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, emailUser.hashCode);
    hash = _SystemHash.combine(hash, passwordUser.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin LoginSupabaseRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `emailUser` of this provider.
  String get emailUser;

  /// The parameter `passwordUser` of this provider.
  String get passwordUser;
}

class _LoginSupabaseProviderElement
    extends AutoDisposeFutureProviderElement<void> with LoginSupabaseRef {
  _LoginSupabaseProviderElement(super.provider);

  @override
  String get emailUser => (origin as LoginSupabaseProvider).emailUser;
  @override
  String get passwordUser => (origin as LoginSupabaseProvider).passwordUser;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
