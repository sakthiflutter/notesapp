import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notesapp/theme/colour.dart';

import '../../../core/common/test.dart';
import '../../Home_Page/view/Homepage.dart';
import '../../editnotes/Apiprovider/apiprovider.dart';


class DialogHelper {
  //show error dialog
  static void showErroDialog(
      {String title = 'Error', String? description = 'Something went wrong'}) {
    Get.dialog(
      Dialog(
        backgroundColor: Colors.transparent,
        child: Container(

          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(30)),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Txt(
                  text: title,
                  weight: FontWeight.bold,
                  color: Get.theme.primaryColor,
                ),
                Txt(
                  text: description ?? '',
                  fsize: 12,
                  weight: FontWeight.bold,
                  color: Colors.black,
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: () {
                      if (Get.isDialogOpen ?? true) Get.back();
                    },
                    child: const Text(
                      'Okay',
                      style: TextStyle(color: Colors.white),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  //show loading
  static void showLoading([String? message]) {
    Get.dialog(
      Dialog(
        backgroundColor: Colors.transparent,
        elevation: 0,
        child: Center(
          child: Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(15)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Loader(),
                  const Center(child: CupertinoActivityIndicator()),
                    const SizedBox(height: 10),
                  Text(message ?? 'Loading...'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  static void savepopup([String? message]) {
    Get.dialog(
      Dialog(
        backgroundColor: Colors.transparent,
        elevation: 0,
        child: Center(
          child: Container(
            height: 150,
            width: 200,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(15)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Loader(),
                   Center(child: Icon(Icons.info_outline,color: AppColors.testcolour,)),
                  const SizedBox(height: 10),
                  Text("Notes Saved Successfully"),
                  SizedBox(
                    height: 5,
                  ),
                  ElevatedButton(onPressed: (){
                    Get.offAll(HomePage());

                  }, child: Text('ok'))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  static  void savechanges(String id,String title,String description) {
    ApiProvider apiProvider = ApiProvider();
    Get.dialog(
      Dialog(
        backgroundColor: Colors.transparent,
        elevation: 0,
        child: Center(
          child: Container(
            height: 150,
            width: 230,
            decoration: BoxDecoration(
                color: Colors.black, borderRadius: BorderRadius.circular(15)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Loader(),
                  Center(child: Icon(Icons.info_outline,color: AppColors.testcolour,)),
                  const SizedBox(height: 10),
                  Text("Save changes??",style: TextStyle(color: AppColors.testcolour),),
                  SizedBox(
                    height: 10,
                  ),
                 Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       ElevatedButton(onPressed: (){

                         Get.to(HomePage(),transition: Transition.rightToLeft);
                       },
                         child: Text('Discard'),style: ButtonStyle(
                             backgroundColor:  MaterialStateProperty.all<Color>(Colors.redAccent)
                         ),),
                       ElevatedButton(onPressed: ()async{
                         await apiProvider.update(id,title, description);

                         Get.to(HomePage(),transition: Transition.rightToLeft);
                       },
                           child: Text('save'),style: ButtonStyle(
                           backgroundColor:  MaterialStateProperty.all<Color>(Colors.green)
                         ),)
                     ],
                   ),
                 )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  //hide loading
  static void hideLoading() {
    if (Get.isDialogOpen ?? true) Get.back();
  }
}