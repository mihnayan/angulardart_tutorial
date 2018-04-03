import 'dart:async';

import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';

import '../model/hero.dart';
import '../services/hero_service.dart';
import '../router_paths.dart' as paths;

@Component(
  selector: 'my-heroes',
  templateUrl: 'hero_list_component.html',
  styleUrls: ['hero_list_component.css'],
  pipes: [UpperCasePipe],
  directives: [coreDirectives],
  providers: [const ClassProvider(HeroService)]
)
class HeroListComponent implements OnInit {
  final HeroService _heroService;
  final Router _router;
  List<Hero> heroes;
  Hero selectedHero;
  
  HeroListComponent(this._heroService, this._router);
  
  @override
  void ngOnInit() => _getHeroes();

  void onSelect(Hero hero) => selectedHero = hero;

  Future<void> _getHeroes() async {
    heroes = await _heroService.getAll();
  }

  Future<NavigationResult> gotoDetail() => 
      _router.navigate(_heroUrl(selectedHero.id));

  String _heroUrl(int id) => 
      paths.hero.toUrl(parameters: {paths.idParam: id.toString()});

}
