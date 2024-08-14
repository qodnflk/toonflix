class WebtoonEpisodeModel {
  final String id, title, ration, data;

  WebtoonEpisodeModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        ration = json['ration'].toString(),
        data = json['data'].toString();
}
