import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

/// Firebase storage of recipe details, etc.
class RecipesRecord extends FirestoreRecord {
  RecipesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "category" field.
  List<String>? _category;
  List<String> get category => _category ?? const [];
  bool hasCategory() => _category != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "rating" field.
  double? _rating;
  double get rating => _rating ?? 0.0;
  bool hasRating() => _rating != null;

  // "cooktime" field.
  int? _cooktime;
  int get cooktime => _cooktime ?? 0;
  bool hasCooktime() => _cooktime != null;

  // "ingredients" field.
  String? _ingredients;
  String get ingredients => _ingredients ?? '';
  bool hasIngredients() => _ingredients != null;

  // "recipe" field.
  String? _recipe;
  String get recipe => _recipe ?? '';
  bool hasRecipe() => _recipe != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _description = snapshotData['description'] as String?;
    _category = getDataList(snapshotData['category']);
    _image = snapshotData['image'] as String?;
    _rating = castToType<double>(snapshotData['rating']);
    _cooktime = castToType<int>(snapshotData['cooktime']);
    _ingredients = snapshotData['ingredients'] as String?;
    _recipe = snapshotData['recipe'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('recipes');

  static Stream<RecipesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RecipesRecord.fromSnapshot(s));

  static Future<RecipesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RecipesRecord.fromSnapshot(s));

  static RecipesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RecipesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RecipesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RecipesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RecipesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RecipesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRecipesRecordData({
  String? name,
  String? description,
  String? image,
  double? rating,
  int? cooktime,
  String? ingredients,
  String? recipe,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'description': description,
      'image': image,
      'rating': rating,
      'cooktime': cooktime,
      'ingredients': ingredients,
      'recipe': recipe,
    }.withoutNulls,
  );

  return firestoreData;
}

class RecipesRecordDocumentEquality implements Equality<RecipesRecord> {
  const RecipesRecordDocumentEquality();

  @override
  bool equals(RecipesRecord? e1, RecipesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        e1?.description == e2?.description &&
        listEquality.equals(e1?.category, e2?.category) &&
        e1?.image == e2?.image &&
        e1?.rating == e2?.rating &&
        e1?.cooktime == e2?.cooktime &&
        e1?.ingredients == e2?.ingredients &&
        e1?.recipe == e2?.recipe;
  }

  @override
  int hash(RecipesRecord? e) => const ListEquality().hash([
        e?.name,
        e?.description,
        e?.category,
        e?.image,
        e?.rating,
        e?.cooktime,
        e?.ingredients,
        e?.recipe
      ]);

  @override
  bool isValidKey(Object? o) => o is RecipesRecord;
}
