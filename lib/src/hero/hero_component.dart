import 'dart:async';

import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:angular_router/angular_router.dart';

import '../model/hero.dart';
import '../services/hero_service.dart';
import '../router_paths.dart' as paths;

@Component(
  selector: 'my-hero',
  templateUrl: 'hero_component.html',
  directives: [coreDirectives, formDirectives]
)
class HeroComponent implements OnActivate {
  
  Hero hero;
  final HeroService _heroSerivice;
  final Location _location;

  HeroComponent(this._heroSerivice, this._location);

  @override
  Future<void> onActivate(_, RouterState current) async {
    final id = _getId(current);
    if (id != null) hero = await (_heroSerivice.get(id));
  }

  void goBack() => _location.back();

  int _getId(RouterState routerState) => int
      .parse(routerState.parameters[paths.idParam] ?? '', onError:  (_) => null);

}