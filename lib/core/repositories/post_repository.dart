import '../models/post/Content.dart';

abstract class PostRepository {
  Future<List<Content>> getAllPosts({String?page, String? limit, String? status});
}
