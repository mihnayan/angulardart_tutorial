import 'package:angular/angular.dart';
import 'dart:async';

import 'src/hero.dart';
import 'src/hero_component.dart';
import 'src/hero_service.dart';

@Component(
  selector: 'my-app',
  templateUrl: 'app_component.html',
  styleUrls: ['app_component.css'],
  directives: [coreDirectives, HeroComponent],
  providers: [const ClassProvider(HeroService)]
)
class AppComponent implements OnInit {
  final title = 'Обзор героев';
  final HeroService _heroService;
  List<Hero> heroes;
  Hero selectedHero;
  
  AppComponent(this._heroService);
  
  @override
  void ngOnInit() => _getHeroes();

  void onSelect(Hero hero) => selectedHero = hero;

  Future<void> _getHeroes() async {
    heroes = await _heroService.getAll();
  }

}
