import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:api_mask/model/store.dart';

class StoreRepository{

  Future<List<Store>> fetch() async{
    final stores = <Store>[];

    var url = 'https://gist.githubusercontent.com/junsuk5/bb7485d5f70974deee920b8f0cd1e2f0/raw/063f64d9b343120c2cb01a6555cf9b38761b1d94/sample.json';
    var response = await http.get(url);
    final jsonResult = jsonDecode(response.body);
    final jsonStores = jsonResult['stores'];

    jsonStores.forEach((e){
      stores.add(Store.fromJson(e));
    });
    print('fetch완료');

    return stores.where((e){
      return e.remainStat == 'plenty' || e.remainStat == 'some';
    }).toList();
    //json 형태의 데이터로 변환 + 한글처리
    // print('Response status: ${response.statusCode}');
    // print('Response body: ${jsonDecode(utf8.decode(response.bodyBytes))}');
  }

}