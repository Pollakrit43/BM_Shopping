import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'product_model.g.dart';

@HiveType(typeId: 0)
class Product extends Equatable {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String category;
  @HiveField(3)
  final String imageUrl;
  @HiveField(4)
  final int price;
  @HiveField(5)
  final bool isRecommended;
  @HiveField(6)
  final bool isPopular;
  @HiveField(7)
  final String? description;

  const Product({
    required this.id,
    required this.name,
    required this.category,
    required this.imageUrl,
    required this.price,
    required this.isPopular,
    required this.isRecommended,
    this.description,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        category,
        imageUrl,
        price,
        isPopular,
        isRecommended,
        description,
      ];

  static Product formSnapshot(DocumentSnapshot snap) {
    Product product = Product(
      id: snap.id,
      name: snap['name'],
      category: snap['category'],
      imageUrl: snap['imageUrl'],
      price: snap['price'],
      isPopular: snap['isPopular'],
      isRecommended: snap['isRecommended'],
      description: snap['description'],
    );
    return product;
  }

  static List<Product> products = [
    Product(
      id: '0',
      name: 'ปากกาน้ำเงิน',
      category: 'Pen',
      imageUrl:
          'https://aumento.officemate.co.th/media/catalog/product/O/F/OFM1031573_X2.jpg?imwidth=640',
      price: 10,
      isRecommended: true,
      isPopular: true,
    ),
    Product(
      id: '1',
      name: 'ปากกาแดง',
      category: 'Pen',
      imageUrl:
          'https://aumento.officemate.co.th/media/catalog/product/O/F/OFM1031572_X2.jpg?imwidth=640',
      price: 10,
      isRecommended: true,
      isPopular: true,
    ),
    Product(
      id: '2',
      name: 'ยางลบ',
      category: 'Eraser',
      imageUrl:
          'https://aumento.officemate.co.th/media/catalog/product/O/F/OFM1521450.jpg?imwidth=640',
      price: 6,
      isRecommended: true,
      isPopular: false,
    ),
    Product(
      id: '3',
      name: 'ยางลบ',
      category: 'Eraser',
      imageUrl:
          'https://www.sahachaioffice.com/wp-content/uploads/2018/01/%E0%B8%A2%E0%B8%B2%E0%B8%87%E0%B8%A5%E0%B8%9A-%E0%B8%94%E0%B8%B3-%E0%B9%80%E0%B8%9F%E0%B9%80%E0%B8%9A%E0%B8%AD%E0%B8%A3%E0%B9%8C.jpg',
      price: 15,
      isRecommended: true,
      isPopular: true,
    ),
    Product(
      id: '4',
      name: 'ดินสอดำ 6B',
      category: 'Pencil',
      imageUrl:
          'https://image.makewebeasy.net/makeweb/0/cR3tP63kr/Product01/7_%E0%B8%94%E0%B8%B4%E0%B8%99%E0%B8%AA%E0%B8%AD%E0%B8%94%E0%B8%B3_Staedtler_6B.jpg?v=202012190947',
      price: 230,
      isRecommended: true,
      isPopular: false,
    ),
    Product(
      id: '5',
      name: 'ดินสอดำ 2B',
      category: 'Pencil',
      imageUrl:
          'https://aumento.officemate.co.th/media/catalog/product/O/F/OFM1502780.jpg?imwidth=640',
      price: 45,
      isRecommended: true,
      isPopular: false,
    ),
    Product(
      id: '6',
      name: 'ไม้บรรทัด',
      category: 'Ruler',
      imageUrl:
          'https://image.makewebeasy.net/makeweb/0/Th2rv0VZ8/office/web_ruler.png',
      price: 150,
      isRecommended: true,
      isPopular: false,
    ),
  ];
}
