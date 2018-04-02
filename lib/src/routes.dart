import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';

import 'router_paths.dart' as paths;
import 'hero_list/hero_list_component.template.dart' as hlct;

@Injectable()
class Routes {
  static final _heroes = new RouteDefinition(
    routePath: paths.heroes,
    component: hlct.HeroListComponentNgFactory
  );

  RouteDefinition get heroes => _heroes;

  final List<RouteDefinition> all = [
    _heroes
  ];

  //TODO: https://webdev-dartlang-org-dev.firebaseapp.com/angular/tutorial/toh-pt5#router-outlet
}