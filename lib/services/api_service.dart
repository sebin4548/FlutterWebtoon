import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:testproject/models/webtoon_detail_model.dart';
import 'package:testproject/models/webtoon_episode_model.dart';
import 'package:testproject/models/webtoon_model.dart';

class ApiService {
  static const String baseUrl =
      "https://webtoon-crawler.nomadcoders.workers.dev/";
  static const String today = "today";

  //비동기 함수이므로 Future을 붙인다.
  Future<List<WebtoonModel>> getTodaysToons() async {
    List<WebtoonModel> webToonInstances = [];
    final url = Uri.parse('$baseUrl$today');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      //이렇게 리스트를 만들고
      final webtoons = jsonDecode(response.body);
      for (var webtoon in webtoons) {
        // print(webtoon);
        webToonInstances.add(WebtoonModel.fromJson(webtoon));
      }
      return webToonInstances;
    }
    throw Error();
  }

  static Future<WebtoonDetailModel> getToonById(String id) async {
    final url = Uri.parse("$baseUrl/$id");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final webtoon = jsonDecode(response.body);
      return WebtoonDetailModel.fromJson(webtoon);
    }
    throw Error();
  }

  static Future<List<WebtoonEpisodeModel>> getLatestEpisodesById(
      String id) async {
    List<WebtoonEpisodeModel> episodesInstances = [];
    final url = Uri.parse("$baseUrl/$id/episodes");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final episodes = jsonDecode(response.body);
      for (var episode in episodes) {
        episodesInstances.add(WebtoonEpisodeModel.fromJson(episode));
      }
      return episodesInstances;
    }
    throw Error();
  }
}
