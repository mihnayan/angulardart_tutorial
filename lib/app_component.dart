import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';

import 'src/services/hero_service.dart';
import 'src/routes.dart';

@Component(
  selector: 'my-app',
  templateUrl: 'app_component.html',
  directives: [
    routerDirectives],
  providers: [
    const ClassProvider(Routes),
    const ClassProvider(HeroService)]
)
class AppComponent {
  final Routes routes;
  final title = 'Обзор героев';

  AppComponent(this.routes);
}