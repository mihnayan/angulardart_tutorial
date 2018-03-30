import 'package:angular/angular.dart';

import 'src/hero_list/hero_list_component.dart';
import 'src/services/hero_service.dart';

@Component(
  selector: 'my-app',
  templateUrl: 'app_component.html',
  directives: [HeroListComponent],
  providers: [const ClassProvider(HeroService)]
)
class AppComponent {
  final title = 'Обзор героев';
}