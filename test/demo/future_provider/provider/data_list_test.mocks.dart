// Mocks generated by Mockito 5.4.5 from annotations
// in flutter_riverpod_demo/test/demo/future_provider/provider/data_list_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:flutter_riverpod_demo/demo/future_provider/repository/data_repository.dart'
    as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:mockito/src/dummies.dart' as _i4;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: must_be_immutable
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

/// A class which mocks [DataRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockDataRepository extends _i1.Mock implements _i2.DataRepository {
  @override
  _i3.Future<String> fetchData() =>
      (super.noSuchMethod(
            Invocation.method(#fetchData, []),
            returnValue: _i3.Future<String>.value(
              _i4.dummyValue<String>(this, Invocation.method(#fetchData, [])),
            ),
            returnValueForMissingStub: _i3.Future<String>.value(
              _i4.dummyValue<String>(this, Invocation.method(#fetchData, [])),
            ),
          )
          as _i3.Future<String>);

  @override
  _i3.Future<String> fetchError() =>
      (super.noSuchMethod(
            Invocation.method(#fetchError, []),
            returnValue: _i3.Future<String>.value(
              _i4.dummyValue<String>(this, Invocation.method(#fetchError, [])),
            ),
            returnValueForMissingStub: _i3.Future<String>.value(
              _i4.dummyValue<String>(this, Invocation.method(#fetchError, [])),
            ),
          )
          as _i3.Future<String>);

  @override
  String fetchCacheData() =>
      (super.noSuchMethod(
            Invocation.method(#fetchCacheData, []),
            returnValue: _i4.dummyValue<String>(
              this,
              Invocation.method(#fetchCacheData, []),
            ),
            returnValueForMissingStub: _i4.dummyValue<String>(
              this,
              Invocation.method(#fetchCacheData, []),
            ),
          )
          as String);
}
