import 'package:angular/angular.dart';
import 'dart:async';

import 'hero.dart';
import 'mock_heroes.dart';

@Injectable()
class HeroService {
  Future<List<Hero>> getAll() async => mockHeroes;
}