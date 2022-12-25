import 'package:api_mask/ui/widget/remain_stat_listTile.dart';
import 'package:api_mask/viewmodel/store_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final storeModel = Provider.of<StoreModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('마스크 재고 있는 곳: ${storeModel.stores.length}곳'),
        actions: [IconButton(
            onPressed: () {
              storeModel.fetch();
            },
            icon: Icon(Icons.refresh))
        ],
      ),
      body: storeModel.isLoading
          ? loading()
          : ListView(
        children: storeModel.stores.map((e) {
          return ListTile(
            title: Text(e.name),
            subtitle: Text(e.addr),
            trailing: RemainStatListTile(e),
          );
        }).toList(),
      ),

    );
  }

  Widget loading(){
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('정보를 가져오는 중'),
          CircularProgressIndicator()
        ],
      ),
    );
  }
}