// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$showProductsHash() => r'b1319b45f789a4e482f581a4e620573853cc1f94';

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

/// See also [showProducts].
@ProviderFor(showProducts)
const showProductsProvider = ShowProductsFamily();

/// See also [showProducts].
class ShowProductsFamily extends Family<AsyncValue<List<ProductModel>>> {
  /// See also [showProducts].
  const ShowProductsFamily();

  /// See also [showProducts].
  ShowProductsProvider call(
    String idProduct,
    String productName,
  ) {
    return ShowProductsProvider(
      idProduct,
      productName,
    );
  }

  @override
  ShowProductsProvider getProviderOverride(
    covariant ShowProductsProvider provider,
  ) {
    return call(
      provider.idProduct,
      provider.productName,
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
  String? get name => r'showProductsProvider';
}

/// See also [showProducts].
class ShowProductsProvider
    extends AutoDisposeFutureProvider<List<ProductModel>> {
  /// See also [showProducts].
  ShowProductsProvider(
    String idProduct,
    String productName,
  ) : this._internal(
          (ref) => showProducts(
            ref as ShowProductsRef,
            idProduct,
            productName,
          ),
          from: showProductsProvider,
          name: r'showProductsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$showProductsHash,
          dependencies: ShowProductsFamily._dependencies,
          allTransitiveDependencies:
              ShowProductsFamily._allTransitiveDependencies,
          idProduct: idProduct,
          productName: productName,
        );

  ShowProductsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.idProduct,
    required this.productName,
  }) : super.internal();

  final String idProduct;
  final String productName;

  @override
  Override overrideWith(
    FutureOr<List<ProductModel>> Function(ShowProductsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ShowProductsProvider._internal(
        (ref) => create(ref as ShowProductsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        idProduct: idProduct,
        productName: productName,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<ProductModel>> createElement() {
    return _ShowProductsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ShowProductsProvider &&
        other.idProduct == idProduct &&
        other.productName == productName;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, idProduct.hashCode);
    hash = _SystemHash.combine(hash, productName.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ShowProductsRef on AutoDisposeFutureProviderRef<List<ProductModel>> {
  /// The parameter `idProduct` of this provider.
  String get idProduct;

  /// The parameter `productName` of this provider.
  String get productName;
}

class _ShowProductsProviderElement
    extends AutoDisposeFutureProviderElement<List<ProductModel>>
    with ShowProductsRef {
  _ShowProductsProviderElement(super.provider);

  @override
  String get idProduct => (origin as ShowProductsProvider).idProduct;
  @override
  String get productName => (origin as ShowProductsProvider).productName;
}

String _$showCategoriesHash() => r'4e3f9461337a0e5ade61917d71420265ceeeb60f';

/// See also [showCategories].
@ProviderFor(showCategories)
final showCategoriesProvider =
    AutoDisposeFutureProvider<List<CategoryModel>>.internal(
  showCategories,
  name: r'showCategoriesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$showCategoriesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ShowCategoriesRef = AutoDisposeFutureProviderRef<List<CategoryModel>>;
String _$showcategoryHash() => r'6545d18b87bd6557c2baeb98e36d35c1f932f26b';

/// See also [showcategory].
@ProviderFor(showcategory)
final showcategoryProvider =
    AutoDisposeFutureProvider<List<CategoryModel>>.internal(
  showcategory,
  name: r'showcategoryProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$showcategoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ShowcategoryRef = AutoDisposeFutureProviderRef<List<CategoryModel>>;
String _$usersHash() => r'86b96d0c1db523fd7c57dfe0cbbcfe54c08c221c';

/// See also [users].
@ProviderFor(users)
final usersProvider = AutoDisposeFutureProvider<List<UserModel>>.internal(
  users,
  name: r'usersProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$usersHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef UsersRef = AutoDisposeFutureProviderRef<List<UserModel>>;
String _$userauthHash() => r'3d83efa38945244605f73d55bd201274826aff52';

/// See also [userauth].
@ProviderFor(userauth)
const userauthProvider = UserauthFamily();

/// See also [userauth].
class UserauthFamily extends Family<AsyncValue<TokenModel>> {
  /// See also [userauth].
  const UserauthFamily();

  /// See also [userauth].
  UserauthProvider call(
    String email,
    String password,
  ) {
    return UserauthProvider(
      email,
      password,
    );
  }

  @override
  UserauthProvider getProviderOverride(
    covariant UserauthProvider provider,
  ) {
    return call(
      provider.email,
      provider.password,
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
  String? get name => r'userauthProvider';
}

/// See also [userauth].
class UserauthProvider extends AutoDisposeFutureProvider<TokenModel> {
  /// See also [userauth].
  UserauthProvider(
    String email,
    String password,
  ) : this._internal(
          (ref) => userauth(
            ref as UserauthRef,
            email,
            password,
          ),
          from: userauthProvider,
          name: r'userauthProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$userauthHash,
          dependencies: UserauthFamily._dependencies,
          allTransitiveDependencies: UserauthFamily._allTransitiveDependencies,
          email: email,
          password: password,
        );

  UserauthProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.email,
    required this.password,
  }) : super.internal();

  final String email;
  final String password;

  @override
  Override overrideWith(
    FutureOr<TokenModel> Function(UserauthRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UserauthProvider._internal(
        (ref) => create(ref as UserauthRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        email: email,
        password: password,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<TokenModel> createElement() {
    return _UserauthProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UserauthProvider &&
        other.email == email &&
        other.password == password;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, email.hashCode);
    hash = _SystemHash.combine(hash, password.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin UserauthRef on AutoDisposeFutureProviderRef<TokenModel> {
  /// The parameter `email` of this provider.
  String get email;

  /// The parameter `password` of this provider.
  String get password;
}

class _UserauthProviderElement
    extends AutoDisposeFutureProviderElement<TokenModel> with UserauthRef {
  _UserauthProviderElement(super.provider);

  @override
  String get email => (origin as UserauthProvider).email;
  @override
  String get password => (origin as UserauthProvider).password;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
