import 'package:hive/hive.dart';
import 'package:laza_commerce/Helper/hive_helper.dart';

class ReviewAdapter extends TypeAdapter<Review> {
  @override
  int get typeId => 0; // You can assign a unique ID for the Review class

  @override
  Review read(BinaryReader reader) {
    final name = reader.readString();
    final description = reader.readString();
    final starRating = reader.readDouble();

    return Review(
      name: name,
      description: description,
      starRating: starRating,
    );
  }

  @override
  void write(BinaryWriter writer, Review obj) {
    writer.writeString(obj.name);
    writer.writeString(obj.description);
    writer.writeDouble(obj.starRating);
  }
}