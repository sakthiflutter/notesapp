import 'package:get/get.dart';

import '../Apiprovider/Api_privider.dart';
import '../models/listofnote.dart';
class HomeController extends GetxController with StateMixin  {
  ApiProvider apiProvider = ApiProvider();

  @override
  void onInit() {
    super.onInit();

      apiProvider.fetchnotes().then((response) {

      change(response, status: RxStatus.success());
    }, onError: (err) {
      change(null,status: RxStatus.error(err.toString()));
    });
  }
  getnotes()async{
   await apiProvider.fetchnotes().then((response) {

      change(response, status: RxStatus.success());
    }, onError: (err) {
      change(null,status: RxStatus.error(err.toString()));
    });
    update();

  }
  deletenote(String id)async{
    await   apiProvider.deletenotes(id);
  }

}