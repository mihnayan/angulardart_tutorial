import 'package:angular/angular.dart';
import 'dart:async';

import '../model/hero.dart';
import '../model/mock_heroes.dart';

@Injectable()
class HeroService {
  Future<List<Hero>> getAll() async => mockHeroes;

  Future<List<Hero>> getAllSlowly() {
    return new Future.delayed(const Duration(seconds:  2), getAll);
  }
}