class WebtoonModel {
  final String title, thumb, id;

  //named constructor. fromJson이라는 constructor을 추가한다.
  // Use a named constructor to implement multiple constructors for a class or to provide extra clarity:
  WebtoonModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        thumb = json['thumb'],
        id = json['id'];
}
