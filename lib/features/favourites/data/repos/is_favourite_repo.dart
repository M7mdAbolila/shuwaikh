import 'package:shuwaikh/core/networking/api_service.dart';
import 'package:shuwaikh/features/favourites/data/models/is_favourite/is_favourite_request_body.dart';
import 'package:shuwaikh/features/favourites/data/models/is_favourite/is_favourite_response.dart';

class IsFavouriteRepo {
  final ApiService _apiService;

  IsFavouriteRepo(this._apiService);
  Future<IsFavouritResponse> isFavourite(
    String? token,
    IsFavouriteRequestBody isFavouriteRequestBody,
  ) async {
    var response =
        await _apiService.isFavourites(token, isFavouriteRequestBody);
    return response;
  }
}
