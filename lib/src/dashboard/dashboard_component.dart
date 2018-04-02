import 'dart:async';

import 'package:angular/angular.dart';

import '../model/hero.dart';
import '../services/hero_service.dart';

@Component(
  selector: 'hero-dashboard',
  templateUrl: 'dashboard_component.html',
  directives: [coreDirectives]
)
class DashboardComponent implements OnInit {
  List<Hero> heroes;

  final HeroService _heroService;

  DashboardComponent(this._heroService);
  
  @override
  Future<void> ngOnInit() async {
    heroes = (await _heroService.getAll()).skip(1).take(4).toList();
  }

}