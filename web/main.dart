import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';

import 'package:angular_app/app_component.dart';

import 'main.template.dart' as ng;

void main() {
  bootstrapStatic(
    AppComponent, 
    [
      routerProvidersHash
    ], 
    ng.initReflector);
}
