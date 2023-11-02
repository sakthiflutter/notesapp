import 'package:get/get.dart';


import '../Apiprovider/Apiprovider.dart';
import '../widget/savepop_up.dart';

class Addnotecontroller extends GetxController with StateMixin  {
  ApiProvider apiProvider = ApiProvider();
  RxBool buttonloading=false.obs;


  savenotes(String title,String description)async{
    buttonloading.value=true;
    await apiProvider.addnotes(title, description).then((response) {
      buttonloading.value=false;
      DialogHelper.savepopup();
    }, onError: (err) {
      change(null,status: RxStatus.error(err.toString()));
    });
    update();

  }

}