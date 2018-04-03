import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';

import 'router_paths.dart' as paths;
import 'hero_list/hero_list_component.template.dart' as hlct;
import 'dashboard/dashboard_component.template.dart' as dct;
import 'hero/hero_component.template.dart' as hct;

@Injectable()
class Routes {
  static final _heroes = new RouteDefinition(
    routePath: paths.heroes,
    component: hlct.HeroListComponentNgFactory
  );
  static final _dashboard = new RouteDefinition(
    routePath: paths.dashboard,
    component: dct.DashboardComponentNgFactory
  );
  static final _hero = new RouteDefinition(
    routePath: paths.hero,
    component: hct.HeroComponentNgFactory
  );

  RouteDefinition get heroes => _heroes;
  RouteDefinition get dashboard => _dashboard;
  RouteDefinition get hero => _hero;

  final List<RouteDefinition> all = [
    new RouteDefinition.redirect(path: '', redirectTo: paths.dashboard.toUrl()),
    _dashboard,
    _hero,
    _heroes
  ];

}