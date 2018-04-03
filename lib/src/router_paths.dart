import 'package:angular_router/angular_router.dart';

const idParam = 'id';

final heroes = new RoutePath(path: 'heroes');

final dashboard = new RoutePath(path: 'dashboard');

final hero = new RoutePath(path: '${heroes.path}/:$idParam');