
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../../theme/colour.dart';
import '../../addnote/view/add_note.dart';
import '../../editnotes/view/editnots.dart';
import '../controller/Homecontroller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
   var mHeight=MediaQuery.of(context).size.height;
   var mwidth=MediaQuery.of(context).size.width;

   int data=-1;
    HomeController acon=Get.put(HomeController());
   acon.getnotes();
    return Scaffold(

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: RefreshIndicator(
            onRefresh: ()async{
              await Future.delayed(Duration(seconds: 3));
              acon.getnotes();


            },
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Notes',style: TextStyle(fontSize: 40,color: AppColors.testcolour),),
                    Container(
                      child: Row(
                        children: [ Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: InkWell(
                            child: Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Color(0xFF3B3B3B),
                              ),

                              child: const Icon(Icons.search),
                            ),
                          ),
                        ),
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

                                child: const Icon(Icons.info_outline ,),
                              ),
                            ),
                          ),],
                      ),
                    ),
                  ],
                ),

                Container(
                  height: mHeight*0.85,
                  child: controller.obx(
                        (listnote)=>Container(
                          height: mHeight*0.85,
                          child: ListView.builder(

                            itemCount: listnote.data.length,

                            itemBuilder: (context,index){
                               data++;
                              if(AppColors.noteColorList.length==data){;
                                data=0;
                              }
                              return InkWell(
                                onTap: (){
                                  Get.to(Editnote(listnote.data[index].id.toString(),listnote.data[index].title,listnote.data[index].description));
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Dismissible(
                                    key: Key(listnote.data[index].id.toString()),
                                    direction: DismissDirection.endToStart,
                                    onDismissed: (d){
                                      listnote.data.remove(index);
                                      acon.deletenote(listnote.data[index].id.toString());
                                    },
                                    background: Container(alignment:Alignment.centerRight,color: Colors.red,child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Icon(Icons.delete_outline,size: 45,),
                                    ),),
                                    child: Container(
                                      height: 110,
                                      decoration: BoxDecoration(
                                        color: AppColors.noteColorList[data],
                                        borderRadius: BorderRadius.circular(17)
                                      ),
                                      width: mwidth*0.9,

                                      child:  Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                listnote.data[index].title,
                                                style:  TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20.0,
                                                    color: AppColors.testcolour),
                                              ),
                                              const SizedBox(height: 6.0),
                                              Text(
                                                listnote.data[index].description,
                                                style:  TextStyle(
                                                    fontSize: 15.0, color: AppColors.testcolour),
                                              ),


                                            ]),
                                      ),

                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),

                    // here you can put your custom loading indicator, but
                    // by default would be Center(child:CircularProgressIndicator())
                    onLoading: Center(child: CircularProgressIndicator()),
                    onEmpty: Text('No data found'),

                    // here also you can set your own error widget, but by
                    // default will be an Center(child:Text(error))
                    onError: (error)=>Text(error??""),
                  ),
                ),






              ],
            ),
          ),

        ),

      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        elevation: 20,

        onPressed: () {
          Get.to(Addnote(),transition: Transition.leftToRight);
        },child: Icon(Icons.add,),
        backgroundColor: AppColors.background,
      ),
    );
  }
}
