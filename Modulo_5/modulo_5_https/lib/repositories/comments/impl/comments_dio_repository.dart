// import 'package:dio/dio.dart';
import 'package:trilhaapp/model/comment_model.dart';
import 'package:trilhaapp/repositories/commens_repository.dart';


class CommentsDioRepsositoy implements CommentsRepository {
  @override
  Future<List<CommentModel>> retornaComentarios(int postId) async {
    var jsonPlaceHolderCustonDio = JsonPlaceHolderCustonDio();
    var response =
        await jsonPlaceHolderCustonDio.dio.get("/posts/$postId/comments");
    return (response.data as List)
        .map((e) => CommentModel.fromJson(e))
        .toList();
  }
}