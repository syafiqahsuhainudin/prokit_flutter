import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/fullApps/eventApp/utils/EAColors.dart';
import 'package:prokit_flutter/fullApps/eventApp/utils/EADataProvider.dart';

import 'EAPurchaseScreen.dart';

class EATodayTicketScreen extends StatefulWidget {
  const EATodayTicketScreen({Key? key}) : super(key: key);

  @override
  _EATodayTicketScreenState createState() => _EATodayTicketScreenState();
}

class _EATodayTicketScreenState extends State<EATodayTicketScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            16.height,
            Text('What tickets Would you like?', style: boldTextStyle()).paddingSymmetric(horizontal: 12,vertical: 8),
            ListView.builder(
              shrinkWrap: true,
              itemCount: ticketList.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
                  decoration: boxDecorationRoundedWithShadow(8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                         height: 100,
                        width: 80,
                        alignment: Alignment.center,
                        decoration: boxDecorationWithRoundedCorners(borderRadius:BorderRadius.only(topLeft: Radius.circular(8),bottomLeft: Radius.circular(8)),backgroundColor:ticketList[index].count==0? grey.withOpacity(0.2):primaryColor1),
                        child: Text(ticketList[index].count.toString(), style: boldTextStyle(size: 50,color: ticketList[index].count==0?grey:white)),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(ticketList[index].name!,style: boldTextStyle(color:ticketList[index].payment=="Sold Out"?grey:black)),
                          8.height,
                          Text(ticketList[index].time!,style: primaryTextStyle(color:ticketList[index].payment=="Sold Out"?grey:black)),
                          8.height,
                          Text(ticketList[index].payment!,style: secondaryTextStyle(color: primaryColor1)),
                        ],
                      ).paddingAll(8).expand(),
                      
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                              alignment: Alignment.center,
                            padding: EdgeInsets.all(12),
                            decoration:boxDecorationWithShadow(borderRadius: BorderRadius.only(topRight: Radius.circular(8))),
                              child: Icon(Icons.add,color: primaryColor1)).onTap((){
                          }),
                          Container(
                            alignment: Alignment.center,
                              padding: EdgeInsets.all(12),
                              decoration:boxDecorationWithShadow(borderRadius: BorderRadius.only(bottomRight: Radius.circular(8))),
                              child: Icon(Icons.minimize,color: primaryColor1)).onTap((){}),
                        ],
                      ).visible(ticketList[index].payment!="Sold Out")
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar:  Container(
        alignment: Alignment.center,
        margin: EdgeInsets.all(20),
        width: context.width(),
        height: 50,
        decoration: boxDecorationWithShadow(borderRadius: radius(24), gradient: LinearGradient(colors: [primaryColor1, primaryColor2])),
        child: Text('Purchase'.toUpperCase(), style: boldTextStyle(color: white, size: 18)),
      ).onTap(() {
        EAPurchaseScreen().launch(context);
      }),
    );
  }
}