import 'package:flutter/material.dart';
import 'package:nuseapp/models/news_model.dart';
import '../data/base_api.dart';
import '../data/network_api.dart';
import '../utils/constants/api_endpoints.dart';
import '../utils/constants/colorpallets.dart';
import '../utils/listners_utils.dart';

class NewsRepository {
  BaseApi _apiServices = networkApi();

  dynamic apiResponse;
  late NewsModel response;

// function to fetch all products from backend database
  Future getAllNewsHeadlines(context) async {
    try {
      apiResponse = await _apiServices.getApiResponse(
          ApiEndpointsUrl.topHeadLines, context);
      response = NewsModel.fromJson(apiResponse);
      return response;
    } catch (ex) {
      ListnersUtils.showFlushbarMessage("${ex.toString()}", Colors.redAccent,
          TheamColors.PtexrtColor2, "Error", Icons.done, context);
    }
  }

    Future getAllNewsByCategory(context, category) async {
    try {
      apiResponse = await _apiServices.getApiResponse(
          "${ApiEndpointsUrl.categorys}category=$category${ApiEndpointsUrl.apiKey}" , context);
      response = NewsModel.fromJson(apiResponse);
      return response;
    } catch (ex) {
      ListnersUtils.showFlushbarMessage("${ex.toString()}", Colors.redAccent,
          TheamColors.PtexrtColor2, "Error", Icons.done, context);
    }
  }

  // // function to fetch all products from backend database
  Future searchNewsRepo(context, queryData) async {
    try {
      apiResponse = await _apiServices.getApiResponse(
          "${ApiEndpointsUrl.search}q=$queryData${ApiEndpointsUrl.apiKey}", context);
      response = NewsModel.fromJson(apiResponse);
      return response;
    } catch (ex) {
      ListnersUtils.showFlushbarMessage("${ex.toString()}", Colors.redAccent,
          TheamColors.PtexrtColor2, "Error", Icons.done, context);
    }
  }

}