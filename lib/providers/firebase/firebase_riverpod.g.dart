// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'firebase_riverpod.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$addtoCartHash() => r'147c990f186a2f66687335c42251ab2581bf4263';

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

/// See also [addtoCart].
@ProviderFor(addtoCart)
const addtoCartProvider = AddtoCartFamily();

/// See also [addtoCart].
class AddtoCartFamily extends Family<AsyncValue<void>> {
  /// See also [addtoCart].
  const AddtoCartFamily();

  /// See also [addtoCart].
  AddtoCartProvider call(
    ProductModel products,
    String currentUser,
  ) {
    return AddtoCartProvider(
      products,
      currentUser,
    );
  }

  @override
  AddtoCartProvider getProviderOverride(
    covariant AddtoCartProvider provider,
  ) {
    return call(
      provider.products,
      provider.currentUser,
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
  String? get name => r'addtoCartProvider';
}

/// See also [addtoCart].
class AddtoCartProvider extends AutoDisposeFutureProvider<void> {
  /// See also [addtoCart].
  AddtoCartProvider(
    ProductModel products,
    String currentUser,
  ) : this._internal(
          (ref) => addtoCart(
            ref as AddtoCartRef,
            products,
            currentUser,
          ),
          from: addtoCartProvider,
          name: r'addtoCartProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$addtoCartHash,
          dependencies: AddtoCartFamily._dependencies,
          allTransitiveDependencies: AddtoCartFamily._allTransitiveDependencies,
          products: products,
          currentUser: currentUser,
        );

  AddtoCartProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.products,
    required this.currentUser,
  }) : super.internal();

  final ProductModel products;
  final String currentUser;

  @override
  Override overrideWith(
    FutureOr<void> Function(AddtoCartRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: AddtoCartProvider._internal(
        (ref) => create(ref as AddtoCartRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        products: products,
        currentUser: currentUser,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _AddtoCartProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AddtoCartProvider &&
        other.products == products &&
        other.currentUser == currentUser;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, products.hashCode);
    hash = _SystemHash.combine(hash, currentUser.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin AddtoCartRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `products` of this provider.
  ProductModel get products;

  /// The parameter `currentUser` of this provider.
  String get currentUser;
}

class _AddtoCartProviderElement extends AutoDisposeFutureProviderElement<void>
    with AddtoCartRef {
  _AddtoCartProviderElement(super.provider);

  @override
  ProductModel get products => (origin as AddtoCartProvider).products;
  @override
  String get currentUser => (origin as AddtoCartProvider).currentUser;
}

String _$updateQuanityHash() => r'116b924b0579a603774c2116952252a536456bdf';

/// See also [updateQuanity].
@ProviderFor(updateQuanity)
const updateQuanityProvider = UpdateQuanityFamily();

/// See also [updateQuanity].
class UpdateQuanityFamily extends Family<AsyncValue<void>> {
  /// See also [updateQuanity].
  const UpdateQuanityFamily();

  /// See also [updateQuanity].
  UpdateQuanityProvider call(
    String currentUser,
    String docId,
    double quantity,
  ) {
    return UpdateQuanityProvider(
      currentUser,
      docId,
      quantity,
    );
  }

  @override
  UpdateQuanityProvider getProviderOverride(
    covariant UpdateQuanityProvider provider,
  ) {
    return call(
      provider.currentUser,
      provider.docId,
      provider.quantity,
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
  String? get name => r'updateQuanityProvider';
}

/// See also [updateQuanity].
class UpdateQuanityProvider extends AutoDisposeFutureProvider<void> {
  /// See also [updateQuanity].
  UpdateQuanityProvider(
    String currentUser,
    String docId,
    double quantity,
  ) : this._internal(
          (ref) => updateQuanity(
            ref as UpdateQuanityRef,
            currentUser,
            docId,
            quantity,
          ),
          from: updateQuanityProvider,
          name: r'updateQuanityProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$updateQuanityHash,
          dependencies: UpdateQuanityFamily._dependencies,
          allTransitiveDependencies:
              UpdateQuanityFamily._allTransitiveDependencies,
          currentUser: currentUser,
          docId: docId,
          quantity: quantity,
        );

  UpdateQuanityProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.currentUser,
    required this.docId,
    required this.quantity,
  }) : super.internal();

  final String currentUser;
  final String docId;
  final double quantity;

  @override
  Override overrideWith(
    FutureOr<void> Function(UpdateQuanityRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UpdateQuanityProvider._internal(
        (ref) => create(ref as UpdateQuanityRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        currentUser: currentUser,
        docId: docId,
        quantity: quantity,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _UpdateQuanityProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UpdateQuanityProvider &&
        other.currentUser == currentUser &&
        other.docId == docId &&
        other.quantity == quantity;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, currentUser.hashCode);
    hash = _SystemHash.combine(hash, docId.hashCode);
    hash = _SystemHash.combine(hash, quantity.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin UpdateQuanityRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `currentUser` of this provider.
  String get currentUser;

  /// The parameter `docId` of this provider.
  String get docId;

  /// The parameter `quantity` of this provider.
  double get quantity;
}

class _UpdateQuanityProviderElement
    extends AutoDisposeFutureProviderElement<void> with UpdateQuanityRef {
  _UpdateQuanityProviderElement(super.provider);

  @override
  String get currentUser => (origin as UpdateQuanityProvider).currentUser;
  @override
  String get docId => (origin as UpdateQuanityProvider).docId;
  @override
  double get quantity => (origin as UpdateQuanityProvider).quantity;
}

String _$deleteCartHash() => r'59affc8f0d78fb0182dad5f7ebf6cf8e3a934571';

/// See also [deleteCart].
@ProviderFor(deleteCart)
const deleteCartProvider = DeleteCartFamily();

/// See also [deleteCart].
class DeleteCartFamily extends Family<AsyncValue<void>> {
  /// See also [deleteCart].
  const DeleteCartFamily();

  /// See also [deleteCart].
  DeleteCartProvider call(
    String currentUser,
    String product,
  ) {
    return DeleteCartProvider(
      currentUser,
      product,
    );
  }

  @override
  DeleteCartProvider getProviderOverride(
    covariant DeleteCartProvider provider,
  ) {
    return call(
      provider.currentUser,
      provider.product,
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
  String? get name => r'deleteCartProvider';
}

/// See also [deleteCart].
class DeleteCartProvider extends AutoDisposeFutureProvider<void> {
  /// See also [deleteCart].
  DeleteCartProvider(
    String currentUser,
    String product,
  ) : this._internal(
          (ref) => deleteCart(
            ref as DeleteCartRef,
            currentUser,
            product,
          ),
          from: deleteCartProvider,
          name: r'deleteCartProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$deleteCartHash,
          dependencies: DeleteCartFamily._dependencies,
          allTransitiveDependencies:
              DeleteCartFamily._allTransitiveDependencies,
          currentUser: currentUser,
          product: product,
        );

  DeleteCartProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.currentUser,
    required this.product,
  }) : super.internal();

  final String currentUser;
  final String product;

  @override
  Override overrideWith(
    FutureOr<void> Function(DeleteCartRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: DeleteCartProvider._internal(
        (ref) => create(ref as DeleteCartRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        currentUser: currentUser,
        product: product,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _DeleteCartProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DeleteCartProvider &&
        other.currentUser == currentUser &&
        other.product == product;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, currentUser.hashCode);
    hash = _SystemHash.combine(hash, product.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin DeleteCartRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `currentUser` of this provider.
  String get currentUser;

  /// The parameter `product` of this provider.
  String get product;
}

class _DeleteCartProviderElement extends AutoDisposeFutureProviderElement<void>
    with DeleteCartRef {
  _DeleteCartProviderElement(super.provider);

  @override
  String get currentUser => (origin as DeleteCartProvider).currentUser;
  @override
  String get product => (origin as DeleteCartProvider).product;
}

String _$getIdCartHash() => r'87da04a04c1631ff37719ccda7731f5ee8527028';

/// See also [getIdCart].
@ProviderFor(getIdCart)
const getIdCartProvider = GetIdCartFamily();

/// See also [getIdCart].
class GetIdCartFamily extends Family<AsyncValue<List<String>>> {
  /// See also [getIdCart].
  const GetIdCartFamily();

  /// See also [getIdCart].
  GetIdCartProvider call(
    String currentUser,
  ) {
    return GetIdCartProvider(
      currentUser,
    );
  }

  @override
  GetIdCartProvider getProviderOverride(
    covariant GetIdCartProvider provider,
  ) {
    return call(
      provider.currentUser,
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
  String? get name => r'getIdCartProvider';
}

/// See also [getIdCart].
class GetIdCartProvider extends AutoDisposeFutureProvider<List<String>> {
  /// See also [getIdCart].
  GetIdCartProvider(
    String currentUser,
  ) : this._internal(
          (ref) => getIdCart(
            ref as GetIdCartRef,
            currentUser,
          ),
          from: getIdCartProvider,
          name: r'getIdCartProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getIdCartHash,
          dependencies: GetIdCartFamily._dependencies,
          allTransitiveDependencies: GetIdCartFamily._allTransitiveDependencies,
          currentUser: currentUser,
        );

  GetIdCartProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.currentUser,
  }) : super.internal();

  final String currentUser;

  @override
  Override overrideWith(
    FutureOr<List<String>> Function(GetIdCartRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetIdCartProvider._internal(
        (ref) => create(ref as GetIdCartRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        currentUser: currentUser,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<String>> createElement() {
    return _GetIdCartProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetIdCartProvider && other.currentUser == currentUser;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, currentUser.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetIdCartRef on AutoDisposeFutureProviderRef<List<String>> {
  /// The parameter `currentUser` of this provider.
  String get currentUser;
}

class _GetIdCartProviderElement
    extends AutoDisposeFutureProviderElement<List<String>> with GetIdCartRef {
  _GetIdCartProviderElement(super.provider);

  @override
  String get currentUser => (origin as GetIdCartProvider).currentUser;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
