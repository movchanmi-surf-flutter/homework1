import 'package:places/domain/category.dart';
import 'package:places/domain/sight.dart';

final List<Sight> mocks = [
  Sight(
    name: 'Линдулловская роща',
    latitude: 60.237512,
    longtitude: 29.539790,
    details:
        'Обороудованная экотропа, засаженная по истине огромными лиственницами 18 века.',
    category: categories.first,
    url: 'https://pp.userapi.com/c840629/v840629733/10d1e/HBnWCpZ0dj4.jpg',
  ),
  Sight(
    name: 'Гастропаб Neighbours',
    latitude: 59.869237,
    longtitude: 30.459877,
    details:
        'Уютный гастропаб с дружественной атмосферой и демократичными ценами',
    category: categories[1],
    url:
        'https://avatars.mds.yandex.net/get-altay/235931/2a0000015d7a05220fe4acc11327c89c5c46/XXL',
  ),
  Sight(
    name: 'Пляж у Осиновецкого маяка',
    latitude: 60.119137,
    longtitude: 31.082225,
    details:
        'Оборудованный пляж в Ленинградской области, расположенный у Ладожского озера.',
    category: categories.first,
    url:
        'https://walkday.ru/upload/iblock/04d/04df49979bbc0fa10cf40b2c5636daee.jpg',
  ),
  Sight(
    name: 'Севкабель Порт',
    latitude: 59.9240,
    longtitude: 30.2402,
    details: 'Видовая набережная с отменным фуд-кортом',
    category: categories[3],
    url: 'https://kuda-spb.ru/uploads/bfb415ed5d0d0274c69718e5acd3df9b.jpg',
  ),
  Sight(
    name: 'Исаакиевский собор',
    latitude: 59.93391,
    longtitude: 30.30647,
    details: 'Одна из главных достопримечательностей Петербурга',
    category: categories[2],
    url: 'https://ethnomir.ru/upload/medialibrary/bb0/sobor1.jpg',
  ),
  Sight(
    name: 'Парк 300-летия',
    latitude: 59.982883,
    longtitude: 30.201441,
    details: 'Огромный парк на берегу Финского залива',
    category: categories.first,
    url: 'https://timetraveling.ru/images/saint-petersburg/06-300let.jpg',
  ),
  Sight(
    name: 'Санаторий им.Орджоникидзе',
    latitude: 43.55600000,
    longtitude: 39.76900000,
    details:
        'Заброшенный Санаторий 1938 года постройки в стиле сталинского неоклассицизма',
    category: categories[2],
    url:
        'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/16/2b/20/8d/img-20190119-150608-01.jpg?w=1200&h=-1&s=1',
  ),
  Sight(
    name: 'Seabus Fishzone',
    latitude: 43.588348,
    longtitude: 39.729996,
    details: 'Ресторан морепродуктов',
    category: categories[1],
    url: 'https://10619-2.s.cdn12.com/rests/original/1401_260047.jpg',
  ),
];

final List<Category> categories = [
  Category(categoryName: 'Природа', assetName: 'park'),
  Category(categoryName: 'Заведение', assetName: 'restaurant'),
  Category(categoryName: 'Памятник', assetName: 'museum'),
  Category(categoryName: 'Досуг', assetName: 'specialplace'),
  Category(categoryName: 'Спорт', assetName: 'cafe'),
  Category(categoryName: 'Отель', assetName: 'hotel'),
];
