import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';

// LOCAL IMPORTS
import 'package:news/src/resources/news_api_provider.dart';

void main() {
  test('FetchTopIds return a list of ids', () async {
    // setup
    final newsApi = NewsApiProvider();

    newsApi.client = MockClient((request) async {
      return Response(json.encode([1, 2, 3, 4]), 200);
    });

    final ids = await newsApi.fetchTopIds();

    // expectation
    expect(ids, [1, 2, 3, 4]);
  });

  test('fetch item returns a item model', () async {
    // setup
    final newsApi = NewsApiProvider();
    final jsonMap = {'id': 123};

    newsApi.client = MockClient((request) async {
      return Response(json.encode(jsonMap), 200);
    });

    final item = await newsApi.fetchItem(999);

    // expectation
    expect(item.id, 123);
  });
}