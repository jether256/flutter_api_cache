
import 'package:api_cache/models/models.dart';
import 'package:sqflite/sqflite.dart';

class LocalDatabase{


  ///create and open new database
  static Future<Database> createDatabase() async{

    return await openDatabase(
      "hacker_news.db",
      version: 1,
      onCreate: (db,version) async{

        await db.execute(
            'CREATE TABLE news (id INTEGER PRIMARY KEY,title TEXT,url TEXT,author VARCAR(244) updateAt TEXT)'
        );
      },
    );
  }


  /// insert new news in database

static Future insertNews(HackerNews hackerNews) async{
    var db= await createDatabase();

    return await db.insert(
        "news",
        {
          "id":hackerNews.id,
          "title":hackerNews.title,
          "url":hackerNews.url,
          "author":hackerNews.author,
          "updatedAt":hackerNews.updatedAt
        },
      conflictAlgorithm: ConflictAlgorithm.replace
    );
}


///read first 20 news from local database
static Future <List<Map<String,dynamic>>> getNews() async{
    var db= await createDatabase();

    return await db.query("news",orderBy:'updateAt DESC',limit: 20);
  }


  ///get more data but in the limit of 20
  static Future <List<Map<String,dynamic>>> getMoreNews(int lastNo) async{
    var db= await createDatabase();

    return await db.query(
        "news",
        orderBy:'updateAt DESC',
        limit: 20,
      offset: lastNo
    );
  }

}