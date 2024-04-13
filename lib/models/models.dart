
class HackerNews{

  final String author;
  final String title;
  final String url;
  final int id;
  final String updatedAt;

  HackerNews({required this.author, required this.title, required this.url, required this.id, required this.updatedAt, });


  factory HackerNews.fromJson(Map<String,dynamic> json)=>
      HackerNews(
          author:json['author'] ?? "",
          title:json['title'] ?? "",
          url:json['url'] ?? "",
          id:json['story_id'] ?? 0,
          updatedAt:json['updated_at'] ?? ""
      );
}