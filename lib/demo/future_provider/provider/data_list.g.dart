// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_list.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$dataListHash() => r'47a667347997e366649c301865d88d8e5529e159';

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

abstract class _$DataList extends BuildlessAutoDisposeAsyncNotifier<String> {
  late final DataRepository repo;

  FutureOr<String> build({required DataRepository repo});
}

/// See also [DataList].
@ProviderFor(DataList)
const dataListProvider = DataListFamily();

/// See also [DataList].
class DataListFamily extends Family<AsyncValue<String>> {
  /// See also [DataList].
  const DataListFamily();

  /// See also [DataList].
  DataListProvider call({required DataRepository repo}) {
    return DataListProvider(repo: repo);
  }

  @override
  DataListProvider getProviderOverride(covariant DataListProvider provider) {
    return call(repo: provider.repo);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'dataListProvider';
}

/// See also [DataList].
class DataListProvider
    extends AutoDisposeAsyncNotifierProviderImpl<DataList, String> {
  /// See also [DataList].
  DataListProvider({required DataRepository repo})
    : this._internal(
        () => DataList()..repo = repo,
        from: dataListProvider,
        name: r'dataListProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$dataListHash,
        dependencies: DataListFamily._dependencies,
        allTransitiveDependencies: DataListFamily._allTransitiveDependencies,
        repo: repo,
      );

  DataListProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.repo,
  }) : super.internal();

  final DataRepository repo;

  @override
  FutureOr<String> runNotifierBuild(covariant DataList notifier) {
    return notifier.build(repo: repo);
  }

  @override
  Override overrideWith(DataList Function() create) {
    return ProviderOverride(
      origin: this,
      override: DataListProvider._internal(
        () => create()..repo = repo,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        repo: repo,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<DataList, String> createElement() {
    return _DataListProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DataListProvider && other.repo == repo;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, repo.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin DataListRef on AutoDisposeAsyncNotifierProviderRef<String> {
  /// The parameter `repo` of this provider.
  DataRepository get repo;
}

class _DataListProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<DataList, String>
    with DataListRef {
  _DataListProviderElement(super.provider);

  @override
  DataRepository get repo => (origin as DataListProvider).repo;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
