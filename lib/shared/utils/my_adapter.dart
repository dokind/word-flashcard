import 'dart:typed_data';

import 'package:dio/dio.dart';

/// A custom [HttpClientAdapter] that intercepts and hooks requests to pub.dev.
///
/// The [fetch] method checks if the request is to pub.dev and returns a custom response if true.
class MyAdapter implements HttpClientAdapter {
  final HttpClientAdapter _adapter = HttpClientAdapter();

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    final Uri uri = options.uri;
    // Hook requests to pub.dev
    if (uri.host == 'pub.dev') {
      return ResponseBody.fromString('Welcome to pub.dev', 200);
    }
    return _adapter.fetch(options, requestStream, cancelFuture);
  }

  @override
  void close({bool force = false}) {
    _adapter.close(force: force);
  }
}
