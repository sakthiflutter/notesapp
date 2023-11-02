import 'package:get/get.dart';

import '../../addnote/widget/savepop_up.dart';
import '../Apiprovider/apiprovider.dart';





class editnotecontroller extends GetxController with StateMixin  {
  ApiProvider apiProvider = ApiProvider();
  RxBool buttonloading=false.obs;


  updatenotes(String id,String title,String description)async{
    // buttonloading.value=true;
    DialogHelper.savechanges(id,title,description);
    // await apiProvider.update(id,title, description).then((response) {
    //   print(response);
    //   buttonloading.value=false;
    //
    // }, onError: (err) {
    //   change(null,status: RxStatus.error(err.toString()));
    // });
    // update();

  }

}