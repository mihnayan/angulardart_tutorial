import 'dart:async';
import 'dart:convert';

import 'package:angular/angular.dart';
import 'package:http/http.dart';

import '../model/hero.dart';

@Injectable()
class HeroService {
  static const _heroesURL = 'api/heroes';

  final Client _http;

  HeroService(this._http);

  Future<List<Hero>> getAll() async {
    try {
      final response = await _http.get(_heroesURL);
      final heroes = _extractData(response).map(
        (data) => new Hero.fromJson(data)
      ).toList();
      return heroes;
    } catch (e) {
      _handleError(e);
    }
  }

  dynamic _extractData(Response response) => json.decode(response.body)['data'];

  Exception _handleError(dynamic e) {
    print(e);
    return new Exception('Ошибка сервера: $e');
  }

  Future<Hero> get(int id) async => 
      (await getAll()).firstWhere((hero) => hero.id == id);
}