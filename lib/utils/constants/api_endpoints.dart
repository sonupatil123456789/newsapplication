class ApiEndpointsUrl {

  static const baseUrl = "https://newsapi.org/v2";
  static const apiKey = "&apiKey=3707cd4fcff64061a60c3b7dde3bdab4";

  //////////// get all news endpoints

  static const topHeadLines =
      "$baseUrl/top-headlines?country=us&apiKey=3707cd4fcff64061a60c3b7dde3bdab4";

  static const categorys = "$baseUrl/top-headlines?country=us&";

  static const search = "$baseUrl/everything?";

  static const sources =
      "$baseUrl/top-headlines/sources?apiKey=3707cd4fcff64061a60c3b7dde3bdab4";

// business  entertainment  general  health   science  sports  technology.
}
