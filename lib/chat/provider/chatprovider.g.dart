// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chatprovider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$sendMessageHash() => r'f692c027dc953e9aaee5667da1bef97b4944184a';

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

/// See also [sendMessage].
@ProviderFor(sendMessage)
const sendMessageProvider = SendMessageFamily();

/// See also [sendMessage].
class SendMessageFamily extends Family<AsyncValue<void>> {
  /// See also [sendMessage].
  const SendMessageFamily();

  /// See also [sendMessage].
  SendMessageProvider call(
    String receiver,
    String message,
    String receiverAvatar,
    String currentUser,
    String receiverEmail,
  ) {
    return SendMessageProvider(
      receiver,
      message,
      receiverAvatar,
      currentUser,
      receiverEmail,
    );
  }

  @override
  SendMessageProvider getProviderOverride(
    covariant SendMessageProvider provider,
  ) {
    return call(
      provider.receiver,
      provider.message,
      provider.receiverAvatar,
      provider.currentUser,
      provider.receiverEmail,
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
  String? get name => r'sendMessageProvider';
}

/// See also [sendMessage].
class SendMessageProvider extends AutoDisposeFutureProvider<void> {
  /// See also [sendMessage].
  SendMessageProvider(
    String receiver,
    String message,
    String receiverAvatar,
    String currentUser,
    String receiverEmail,
  ) : this._internal(
          (ref) => sendMessage(
            ref as SendMessageRef,
            receiver,
            message,
            receiverAvatar,
            currentUser,
            receiverEmail,
          ),
          from: sendMessageProvider,
          name: r'sendMessageProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$sendMessageHash,
          dependencies: SendMessageFamily._dependencies,
          allTransitiveDependencies:
              SendMessageFamily._allTransitiveDependencies,
          receiver: receiver,
          message: message,
          receiverAvatar: receiverAvatar,
          currentUser: currentUser,
          receiverEmail: receiverEmail,
        );

  SendMessageProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.receiver,
    required this.message,
    required this.receiverAvatar,
    required this.currentUser,
    required this.receiverEmail,
  }) : super.internal();

  final String receiver;
  final String message;
  final String receiverAvatar;
  final String currentUser;
  final String receiverEmail;

  @override
  Override overrideWith(
    FutureOr<void> Function(SendMessageRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SendMessageProvider._internal(
        (ref) => create(ref as SendMessageRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        receiver: receiver,
        message: message,
        receiverAvatar: receiverAvatar,
        currentUser: currentUser,
        receiverEmail: receiverEmail,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _SendMessageProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SendMessageProvider &&
        other.receiver == receiver &&
        other.message == message &&
        other.receiverAvatar == receiverAvatar &&
        other.currentUser == currentUser &&
        other.receiverEmail == receiverEmail;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, receiver.hashCode);
    hash = _SystemHash.combine(hash, message.hashCode);
    hash = _SystemHash.combine(hash, receiverAvatar.hashCode);
    hash = _SystemHash.combine(hash, currentUser.hashCode);
    hash = _SystemHash.combine(hash, receiverEmail.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SendMessageRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `receiver` of this provider.
  String get receiver;

  /// The parameter `message` of this provider.
  String get message;

  /// The parameter `receiverAvatar` of this provider.
  String get receiverAvatar;

  /// The parameter `currentUser` of this provider.
  String get currentUser;

  /// The parameter `receiverEmail` of this provider.
  String get receiverEmail;
}

class _SendMessageProviderElement extends AutoDisposeFutureProviderElement<void>
    with SendMessageRef {
  _SendMessageProviderElement(super.provider);

  @override
  String get receiver => (origin as SendMessageProvider).receiver;
  @override
  String get message => (origin as SendMessageProvider).message;
  @override
  String get receiverAvatar => (origin as SendMessageProvider).receiverAvatar;
  @override
  String get currentUser => (origin as SendMessageProvider).currentUser;
  @override
  String get receiverEmail => (origin as SendMessageProvider).receiverEmail;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
