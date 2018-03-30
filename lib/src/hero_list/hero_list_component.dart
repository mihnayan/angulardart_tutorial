import 'package:angular/angular.dart';
import 'dart:async';

import '../model/hero.dart';
import '../hero/hero_component.dart';
import '../services/hero_service.dart';

@Component(
  selector: 'my-heroes',
  templateUrl: 'hero_list_component.html',
  styleUrls: ['hero_list_component.css'],
  directives: [coreDirectives, HeroComponent],
  providers: [const ClassProvider(HeroService)]
)
class HeroListComponent implements OnInit {
  final HeroService _heroService;
  List<Hero> heroes;
  Hero selectedHero;
  
  HeroListComponent(this._heroService);
  
  @override
  void ngOnInit() => _getHeroes();

  void onSelect(Hero hero) => selectedHero = hero;

  Future<void> _getHeroes() async {
    heroes = await _heroService.getAll();
  }

}
