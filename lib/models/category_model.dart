import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';


class Category extends Equatable {
  final String name;
  final String imageUrl;

  const Category({
    required this.name,
    required this.imageUrl,
  });

  @override
  List<Object?> get props => [name, imageUrl];

  static Category fromSnapshot(DocumentSnapshot snap) {
    Category category = Category(
      name: snap['name'],
      imageUrl: snap['imageUrl'],
    );
    return category;
  }

  static List<Category> categories = [
    Category(
      name: 'Pen',
      imageUrl:
          'https://jp.images-monotaro.com/Monotaro3/pi/full/mono57838496-130222-02.jpg',
    ),
    Category(
      name: 'Pencil',
      imageUrl:
          'https://aumento.officemate.co.th/media/catalog/product/O/F/OFM1006346.jpg?imwidth=640',
    ),
    Category(
      name: 'Eraser',
      imageUrl:
          'https://cx.lnwfile.com/_webp_max_images/4096/4096/dk/xq/u3.webp',
    ),
    Category(
      name: 'Ruler',
      imageUrl:
          'https://images.pexels.com/photos/7718657/pexels-photo-7718657.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    ),
  ];
}
