import 'package:api_mask/repository/store_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:api_mask/model/store.dart';

class StoreModel with ChangeNotifier{ //with:상속이랑 비슷
  var isLoading = true;
  List<Store> stores = [];
  final _storeRepository = StoreRepository();

  StoreModel(){
    fetch();
  }
  Future fetch() async{
    isLoading = true;
    notifyListeners(); //값이 바뀌었다고 통지

    stores = await _storeRepository.fetch();
    isLoading = false;
    notifyListeners();
  }
}