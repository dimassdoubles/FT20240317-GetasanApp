import 'package:getasan_app/features/common/constant/error/app_exception.dart';
import 'package:getasan_app/features/common/constant/error/app_failure.dart';

class RepoHelper {
  RepoHelper._();

  static Future<(ResultType?, AppFailure?)> callDatasource<ResultType>(
    Future<ResultType> Function() onTry,
  ) async {
    try {
      final result = await onTry();
      return (result, null);
    } on AppAuthException catch (e) {
      return (null, AuthFailure(e.message));
    } on AppClientException catch (e) {
      return (null, ClientFailure(e.message));
    } on AppServerException catch (e) {
      return (null, ServerFailure(e.message));
    } on AppException catch (e) {
      return (null, AppFailure(e.message));
    } catch (e) {
      return (null, AppFailure(e.toString()));
    }
  }
}
