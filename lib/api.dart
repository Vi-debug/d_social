import 'package:d_social/model/list_newsfeed.dart';
import 'package:d_social/model/newsfeed.dart';
import 'package:dio/dio.dart';

import 'model/account.dart';

class Api {
  static Account account;
  static Future<List<Newsfeed>> fetchListNewsfeed(int index) async {
    int pageSize = 10;
    try {
      var responseNewsfeed = await Dio().get(
        'https://api.kizukimemo.com/trang-chu/newsfeeds',
        queryParameters: {
          'pageNum': index,
          'pageSize': pageSize,
        },
        options: Options(
          headers: {
            'Authorization': 'Bearer ' + account.item.token,
          },
        ),
      );
      return ApiRespone.fromJson(responseNewsfeed.data).listNewsfeed;
    } catch (e) {
      return null;
    }
  }

  static Future<Account> login(String username, String password) async {
    var responseLogin = await Dio().post(
      'https://api.kizukimemo.com/tai-khoan/login',
      data: {
        'email': username,
        'password': password,
      },
    );
    account = Account.fromJson(responseLogin.data);
    return account;
  }
}
