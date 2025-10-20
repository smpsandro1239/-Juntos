// +JUNTOS
// Ficheiro: lib/data/local/daos/reviews_dao.dart
// Descrição: DAO para interagir com a tabela de avaliações
// Autor: Jules
// Locale: pt_PT

import 'package:drift/drift.dart';
import '../database/app_database.dart';
import '../models/review.dart';

part 'reviews_dao.g.dart';

@DriftAccessor(tables: [Reviews])
class ReviewsDao extends DatabaseAccessor<AppDatabase> with _$ReviewsDaoMixin {
  ReviewsDao(AppDatabase db) : super(db);

  Future<List<Review>> getReviewsForPoi(int poiId) {
    return (select(reviews)..where((tbl) => tbl.poiId.equals(poiId))).get();
  }

  Future<void> addReview(ReviewsCompanion entry) {
    return into(reviews).insert(entry);
  }
}
