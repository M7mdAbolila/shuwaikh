import 'package:dartz/dartz.dart';
import 'package:shuwaikh/features/home/data/models/get_categories/get_categories_response.dart';

import '../../../../core/networking/api_result.dart';
import '../models/get_categories/get_categories_requset_body.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<Category>?>> getCategoriess(
    GetCategoriesRequsetBody getCategoriesRequsetBody,
  );
}
