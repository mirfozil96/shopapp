import '../../../features/auth/models/login.dart';

import '../../../features/products/models/product.dart';
import '../../../features/profile/models/profile.dart';

import '../api_client.dart';

part 'mocked_api_client_repository.dart';

class MockedApiClient implements ApiClient {
  final Duration _delay;

  final List<Product> _products = _MockedApiClientRepository.getProducts();
  // final List<Todo> _todos = _MockedApiClientRepository.getTodos();
  // final List<Post> _posts = _MockedApiClientRepository.getPosts();
  final List<Map<String, Object?>> _usersRaw =
      _MockedApiClientRepository.getUsersRaw();

  MockedApiClient({Duration? delay})
      : _delay = delay ?? const Duration(milliseconds: 500);

  @override
  Future<(Profile, String)> login(Login data) async {
    await Future.delayed(_delay);
    try {
      final profileRaw = _usersRaw.singleWhere((user) =>
          user['username'] == data.username &&
          user['password'] == data.password);
      final profile = Profile.fromJson(profileRaw);
      final token = 'fakeTokenForUser${profile.id}';
      return (profile, token);
    } on StateError {
      final requestOptions = ApiClientRequestOptions();
      throw ApiClientException(
        requestOptions: requestOptions,
        response: ApiClientResponse(
          requestOptions: requestOptions,
          data: {'message': 'Invalid credentials'},
        ),
      );
    }
  }

  @override
  Future<List<Product>> fetchProducts() async {
    await Future.delayed(_delay);
    return _products;
  }

  @override
  Future<Product> fetchProduct(int id) async {
    await Future.delayed(_delay);
    return _products.singleWhere((product) => product.id == id);
  }

//   @override
//   Future<List<Todo>> fetchTodos() async {
//     await Future.delayed(_delay);
//     return _todos;
//   }

//   @override
//   Future<Todo> fetchTodo(int id) async {
//     await Future.delayed(_delay);
//     return _todos.singleWhere((todo) => todo.id == id);
//   }

//   @override
//   Future<Todo> addTodo(Todo todo) async {
//     await Future.delayed(_delay);
//     final id = (_todos.lastOrNull?.id ?? 0) + 1;
//     final addedTodo = todo.copyWith(id: id);
//     _todos.add(addedTodo);
//     return addedTodo;
//   }

//   @override
//   Future<Todo> updateTodo(int id, Todo todo) async {
//     await Future.delayed(_delay);
//     final index = _todos.indexWhere((todo) => todo.id == id);
//     final updatedTodo = todo.copyWith(id: id);
//     _todos[index] = updatedTodo;
//     return updatedTodo;
//   }

//   @override
//   Future<Todo> deleteTodo(int id) async {
//     await Future.delayed(_delay);
//     final todo = _todos.singleWhere((todo) => todo.id == id);
//     _todos.remove(todo);
//     return todo;
//   }

//   @override
//   Future<List<Post>> fetchPosts({String? search, int? limit}) async {
//     await Future.delayed(_delay);
//     var posts = _posts;
//     if (search != null && search.isNotEmpty) {
//       posts = posts
//           .where((post) => post.title.find(search) || post.body.find(search))
//           .toList();
//     }
//     if (limit != null) {
//       posts = posts.sublist(0, min(limit, posts.length));
//     }
//     return posts;
//   }

//   @override
//   Future<Post> fetchPost(int id) async {
//     await Future.delayed(_delay);
//     return _posts.singleWhere((post) => post.id == id);
//   }
// }

// extension on String {
//   /// Checks if this contains [query], case-insensitively.
//   bool find(String query) => toLowerCase().contains(query.toLowerCase());
// }
}
