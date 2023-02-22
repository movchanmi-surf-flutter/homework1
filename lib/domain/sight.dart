import 'package:places/domain/category.dart';

///Класс, содержащий информацию о рекомендуемом месте
class Sight {
  Sight({
    required this.name,
    required this.latitude,
    required this.longtitude,
    required this.details,
    required this.category,
    required this.url,
  });

  String name;
  double latitude;
  double longtitude;
  String url;
  String details;
  Category category;
}
