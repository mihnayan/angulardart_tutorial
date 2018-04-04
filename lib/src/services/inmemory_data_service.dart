import 'dart:async';
import 'dart:math';
import 'dart:convert';

import 'package:http/http.dart';
import 'package:http/testing.dart';

import '../model/hero.dart';

class InMemoryDataService extends MockClient {
  static final _initialHeroes = [
    { 'id': 10, 'name': 'Илья Муромец' },
    { 'id': 11, 'name': 'Алёша Попович' },
    { 'id': 12, 'name': 'Добрыня Никитич' },
    { 'id': 13, 'name': 'Д\'Артаньян' },
    { 'id': 14, 'name': 'магистр Йода' },
    { 'id': 15, 'name': 'Люк Скайвокер' },
    { 'id': 16, 'name': 'кот Леопольд' },
    { 'id': 17, 'name': 'мистер Бин' },
    { 'id': 18, 'name': 'Вяйнемяйнен' },
    { 'id': 19, 'name': 'Джеймс Бонд' }
  ];
  static List<Hero> _heroesDb;
  static int _nextId;

  static Future<Response> _handler(Request request) async {
    if (_heroesDb == null) resetDb();
    var data;

    switch(request.method) {
      case 'GET':
        final id = int.parse(request.url.pathSegments.last, onError: (_) => null);
        if (id != null) {
          data = _heroesDb.firstWhere(
            (hero) => hero.id == id
          );
        } else {
          String prefix = request.url.queryParameters['name'] ?? '';
          final regExp = new RegExp(prefix, caseSensitive: false);
          data = _heroesDb.where(
            (hero) => hero.name.contains(regExp)
          ).toList();
        }
        break;
      
      case 'POST':
        var name = json.decode(request.body)['name'];
        var newHero = new Hero(_nextId++, name);
        _heroesDb.add(newHero);
        data = newHero;
        break;

      case 'PUT':
        var heroChanges = new Hero.fromJson(json.decode(request.body));
        var targetHero = _heroesDb.firstWhere(
          (hero) => hero.id == heroChanges.id
        );
        targetHero.name = heroChanges.name;
        data = targetHero;
        break;

      case 'DELETE':
        var id = int.parse(request.url.pathSegments.last);
        _heroesDb.removeWhere(
          (hero) => hero.id == id
        );
        break;

      default:
        throw 'Не поддерживаемый HTTP-метод: ${request.method}';
    }

    return new Response(json.encode({'data': data}), 200, headers: {
      'content-type': 'application/json'
    });
  }

  static resetDb() {
    _heroesDb = _initialHeroes.map(
      (json) => new Hero.fromJson(json)
    ).toList();
    _nextId = _heroesDb.map(
      (hero) => hero.id
    ).fold(0, max) + 1;
  }

  InMemoryDataService() : super(_handler);

}