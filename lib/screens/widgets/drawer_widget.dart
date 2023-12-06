import 'package:flutter/material.dart';
class DrawerWidget extends StatelessWidget {
 Function onDrawerClick;
 DrawerWidget(this.onDrawerClick);
static int CATEGORY=1;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: MediaQuery.of(context).size.width*.7,
        color: Color(0xff2a2929),
        child: Column(
          children: [
             Container(
               width: double.infinity,
               padding: const EdgeInsets.symmetric(vertical: 40.0),
               color: Color(0xff000000),
             child: Center(
               child: Text(" _News_ ",style: TextStyle(
                 fontSize: 18,
                 color: Colors.white

               ),),
             ),),
            InkWell(
              onTap: (){
                onDrawerClick(CATEGORY);
              },
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text("Categories",
                  style: TextStyle(
                      fontSize: 16,fontWeight: FontWeight.bold,color: Colors.white),),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
