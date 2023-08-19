class ApiEndpointsUrl {

  static const baseUrl = "https://newsapi.org/v2";
  static const apiKey = "&apiKey=2e84bca55c074be98bd9802fc81002f6";

  //////////// get all news endpoints

  static const topHeadLines =
      "$baseUrl/top-headlines?country=us&apiKey=2e84bca55c074be98bd9802fc81002f6";

  static const categorys = "$baseUrl/top-headlines?country=us&";

  static const search = "$baseUrl/everything?";

  static const sources =
      "$baseUrl/top-headlines/sources?apiKey=2e84bca55c074be98bd9802fc81002f6";

// business  entertainment  general  health   science  sports  technology.
}
