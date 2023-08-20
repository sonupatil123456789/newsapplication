import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:nuseapp/models/news_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
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

  late List<String>? _items = [];
   List<String>? get items => _items;

  setLoadingState(bool val) {
    _loading = val;
  }

  // news controller for fetching all latest news and displaying it to frountend home scree in crowsel component
  Future getAllNewsHeadlinesController(context) async {
    try {
      setLoadingState(true);
      var newsRes = await newsRepo.getAllNewsHeadlines(context);
      _news = newsRes;
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

// news category controller for displaying the news in frountend according to category chips
  Future getAllNewsByCategoryController(context, category) async {
    try {
      setLoadingState(true);
      var newsRes = await newsRepo.getAllNewsByCategory(context, category);
      _categoryNews = newsRes;
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

  // search news controller for searching news according to search querry
  Future searchNewsController(context, searchInputData) async {
    try {
      setLoadingState(true);
      var newsRes = await newsRepo.searchNewsRepo(context, searchInputData);
      _searchNews = newsRes;
      setLoadingState(false);
      notifyListeners();
      if (kDebugMode) {
        print("_searchProducts : ${_searchNews.status}");
      }
    } catch (exception, stack) {
      print("exception : $exception  ==== $stack" );
      setLoadingState(false);
    }
  }
   //  book mark controller function used to to store the list of book mark in local database (shared prifference)
  Future bookMarkDataController(context, map) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    List<String>? listString = prefs.getStringList('itemslist');
    if (listString == null) {
      String rawJson = jsonEncode(map);
      await prefs.setStringList('itemslist', <String>[rawJson]);
    } else {
      String rawJson = jsonEncode(map);
      listString?.add(rawJson);
      await prefs.setStringList('itemslist', listString);
    }
    notifyListeners();
  }

  
  // get book mark list controll get the stored book mark list from local database (shared prifference and display in frountend)
  Future getBookMarklistitemsController() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    _items = await prefs.getStringList('itemslist');
    print(items.runtimeType);
    notifyListeners();
  }
}
