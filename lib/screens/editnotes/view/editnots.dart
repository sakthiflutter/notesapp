

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notesapp/theme/colour.dart';

import '../../../theme/dimension.dart';
import '../controllers/editnotecontroller.dart';


class Editnote extends StatelessWidget {
  String id;
  String tittle;
  String description;
   Editnote(this.id,this.tittle,this.description ,{super.key});

  @override
  Widget build(BuildContext context) {
    editnotecontroller editcon= Get.put(editnotecontroller());

    TextEditingController titlecon=TextEditingController(text: tittle);
    TextEditingController descriptioncon=TextEditingController(text: description);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: InkWell(
                      onTap: (){
                        Get.back();
                      },
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Color(0xFF3B3B3B),
                        ),

                        child: const Icon(Icons.arrow_back_ios_new_rounded),
                      ),
                    ),
                  ),
                  Container(
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: InkWell(
                            child: Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Color(0xFF3B3B3B),
                              ),

                              child: const Icon(Icons.remove_red_eye_outlined),
                            ),
                          ),
                        ),
                      Obx(() =>editcon.buttonloading.value   ?CircularProgressIndicator():Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: InkWell(
                          onTap: (){
                            editcon.updatenotes(id,titlecon.text,descriptioncon.text);

                          },
                          child: Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Color(0xFF3B3B3B),
                            ),

                            child: const Icon(Icons.save ,),
                          ),
                        ),
                      ))

                        ,],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Form(
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal:10),
                        child: TextFormField(
                          cursorColor: AppColors.testcolour,
                          controller: titlecon,
                          maxLines: 3,




                          style:  TextStyle(fontSize: 40.0, fontWeight: FontWeight.w500,color: AppColors.testcolour),
                          decoration:  InputDecoration(
                              hintStyle:
                              TextStyle(fontSize: 40.0, fontWeight: FontWeight.w500,color: AppColors.testcolour),
                              hintText: "Title",
                              border: InputBorder.none),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: TextFormField(
                          cursorColor: AppColors.testcolour,
                          controller: descriptioncon,


                          maxLines: 1000,
                          style: TextStyle(fontSize: AppDimentions.bodyTextMedium,color: AppColors.testcolour),
                          decoration: InputDecoration(
                              hintStyle: TextStyle(fontSize: AppDimentions.bodyTextMedium,color: AppColors.testcolour),
                              hintText: "Write something here!",
                              border: InputBorder.none),
                        ),
                      ),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
