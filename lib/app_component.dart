import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';

import 'src/hero.dart';
import 'src/mock_heroes.dart';
import 'src/hero_component.dart';

@Component(
  selector: 'my-app',
  templateUrl: 'app_component.html',
  styleUrls: ['app_component.css'],
  directives: [coreDirectives, HeroComponent]
)
class AppComponent {
  final title = 'Обзор героев';
  List<Hero> heroes = mockHeroes;
  Hero selectedHero;
  // Hero get myHero => heroes.first;

  void onSelect(Hero hero) => selectedHero = hero;
}
