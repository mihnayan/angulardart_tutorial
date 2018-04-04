import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:http/http.dart';

import 'package:angular_app/app_component.dart';
import 'package:angular_app/src/services/inmemory_data_service.dart';

import 'main.template.dart' as ng;

void main() {
  bootstrapStatic(
    AppComponent, 
    [
      routerProvidersHash,
      const ClassProvider(Client, useClass: InMemoryDataService)
    ], 
    ng.initReflector);
}
