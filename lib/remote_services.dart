import 'package:portscout/post.dart';
import 'package:http/http.dart' as http;



class remoteServices {
  Future<List<Post>?> getPosts() async {
 http.Response response= await http.get(Uri.parse('https://api.github.com/users/ShaukatDodia'));
    if(response.statusCode == 200) {
var json = response.body;
return Post.fromJson(json);
}
  }
}


// var client = http.Client();
//
// var uri = Uri.parse('https://api.github.com/users/ShaukatDodia');
// var response = await client.get(uri);
//
// if(response.statusCode == 200) {
// var json = response.body;
// return Post.FromJson(json);
// }