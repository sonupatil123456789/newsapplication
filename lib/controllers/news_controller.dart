import 'package:flutter/foundation.dart';
import 'package:nuseapp/models/news_model.dart';
import '../repository/news_repo.dart';

class NewsController with ChangeNotifier {
  final newsRepo = NewsRepository();

  bool _loading = false;
  bool get loading => _loading;

  late NewsModel _news = NewsModel();
  NewsModel get news => _news;

  late NewsModel _categoryNews = NewsModel();
  NewsModel get categoryNews => _categoryNews;

  late NewsModel _searchNews = new NewsModel();
  NewsModel get searchNews => _searchNews;

  setLoadingState(bool val) {
    _loading = val;
  }

  // product  controller for fetching all products
  Future getAllNewsHeadlinesController(context) async {
    try {
      setLoadingState(true);
      var productsRes = await newsRepo.getAllNewsHeadlines(context);
      _news = productsRes;
      setLoadingState(false);
      notifyListeners();
      if (kDebugMode) {
        print("_news : ${_news.status}");
      }
    } catch (exception) {
      print("exception : $exception");
      setLoadingState(false);
    }
  }

  Future getAllNewsByCategoryController(context, category) async {
    try {
      setLoadingState(true);
      var productsRes = await newsRepo.getAllNewsByCategory(context, category);
      _categoryNews = productsRes;
      setLoadingState(false);
      notifyListeners();
      if (kDebugMode) {
        print("_categoryNews : ${_categoryNews.status}");
      }
    } catch (exception) {
      print("exception : $exception");
      setLoadingState(false);
    }
  }

  // // product controller for searching product insearch bar
  Future searchNewsController(context, searchInputData) async {
    try {
      setLoadingState(true);
      var productsRes = await newsRepo.searchNewsRepo(context, searchInputData);
      _searchNews = productsRes;
      setLoadingState(false);
      notifyListeners();
      if (kDebugMode) {
        print("_searchProducts : ${_searchNews.status}");
      }
    } catch (exception) {
      print("exception : $exception");
      setLoadingState(false);
    }
  }
}
