import 'package:flutter/material.dart';
import 'package:reham_1/constants/colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Stack(

              ///هنا عملنا stack من اجل ظهور الشكل اللي فيو قلم فوق الدائرة تبع الصورة
              children: [

                ///هنا CircularAvatar من أجل الشكل الدائري وتثبل الصورة التي نختارها ك child بهل
                Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: textColor, width: 3)
                  ),
                  child: CircleAvatar(
                    backgroundColor: primaryColor,
                    radius: getScreenSize(context).width * 0.2,

                    ///هنا نضع الصورة
                    child: FlutterLogo(
                      size: getScreenSize(context).width * 0.2,
                    ),
                  ),
                ),

                ///هنا لنحرك الكونتينر اللي فيه قلم التعديل
                Positioned(
                  right: 0,

                  ///هنا عندما نكبس يجب أن يختار صورة من المعرض
                  child: GestureDetector(
                    onTap: () {
                      //هنا يجي عند الكبس على الزر أن يتيح للمستخدم تغييير الصورة/
                    },
                    child: Container(
                      margin: EdgeInsets.only(
                          top: getScreenSize(context).width * 0.28
                      ),
                      width: 40.0,
                      height: 40.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: textColor,
                      ),

                      ///هنا وضعنا ايقونة
                      child: Icon(Icons.edit, color: Colors.white,),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20.0,),
            ///هنا الاسم تبع المستخدم
            Text('Mohamed Abo Nokta', style: TextStyle(
                fontSize: getScreenSize(context).width * 0.05
            ),),
            Expanded(
                child: ListView.builder(
                  itemCount: 15,
                  itemBuilder: (ctx, index) {
                    return Container(
                      padding: const EdgeInsets.all(10.0),
                      width: double.infinity,
                      height: getScreenSize(context).width *0.5,
                      margin: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          boxShadow: [
                            BoxShadow(color: Colors.black12,
                                blurRadius: 8,
                                offset: Offset(2,
                                4),)
                          ],
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomLeft,
                              colors: [
                                textColor,
                                primaryColor,
                              ]
                          )
                      ),
                      child: Row(
                        children: [
                          Expanded(child: Image.asset('images/logo.png')),
                          Expanded(child: Column(
                            children: [
                              Expanded(
                                  child: Text('Name Item',style: TextStyle(
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold
                              ),)),
                              Expanded(child: Text('Price \$')),
                            ],
                          )),
                        ],
                      ),
                    );
                  },
                ))
          ],
        ),
      ),
    );
  }
}
