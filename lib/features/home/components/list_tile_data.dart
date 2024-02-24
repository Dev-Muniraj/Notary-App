import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notary_app/constants/size.dart';
import 'package:notary_app/features/home/response/notary_response.dart';
import 'package:notary_app/features/home/widgets/listtile_widget.dart';

class ListTileData extends StatelessWidget {

final   Leads leadData;
  const ListTileData({super.key,required this.leadData});

  @override
  Widget build(BuildContext context) {
    return   Container(
      margin: const EdgeInsets.symmetric(horizontal: Sizes.xs,vertical: Sizes.sm),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Sizes.sm),color: Colors.blue[50],
      ),
      padding: const EdgeInsets.symmetric(horizontal: Sizes.md,vertical:
      Sizes.md),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
              radius: 40,
              child: ClipRRect(
                  borderRadius:BorderRadius.circular(100),
                  child: Image(image: AssetImage("assets/images/profile.jpg"),fit: BoxFit.fill,))),
          const SizedBox(width: Sizes.xl),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                        flex: 1,
                        child:
                        ListTileWidget(title:"First Name")),

                    Flexible(
                        flex:2,
                        child:
                        ListTileWidget(title:": ${leadData.firstName}")
                    ) ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                        flex: 1,
                        child:
                        ListTileWidget(title:"Last Name")),

                    Flexible(
                      flex: 2,
                      child:
                      ListTileWidget(title:": ${leadData.lastName}"),
                    ) ],
                ),

                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                        flex: 1,

                        child:
                        ListTileWidget(title:"E-mail")),

                    Flexible(
                        flex: 2,
                        child:
                        ListTileWidget(title:": ${leadData.email}")),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
