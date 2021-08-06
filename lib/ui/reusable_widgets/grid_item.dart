import 'package:flutter/material.dart';
import 'package:movies_cubit_app/utilities/custom_colors.dart';
import 'package:movies_cubit_app/utilities/size_config.dart';

class GridItem extends StatelessWidget {
  String? titleText;
  String? subtitleText;
  String? imageUrl;
  final VoidCallback? onPress;
  // Function? onPress;
  
  GridItem(
   {
    this.titleText,
    this.subtitleText,
    this.imageUrl,
    this.onPress
    }
    );
  
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      onTap: onPress!,
      child: Ink( // use Ink
        width: 200,
        height: 200,
        color: Colors.transparent,
        child: Card(
          color: whitish,//subjectColors[index],//Color(0xffF5F5F5),
          elevation: 0,
          shape:RoundedRectangleBorder(
            borderRadius: const BorderRadius.all(
              Radius.circular(7.0),
            ),
            ),
            child:Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  height: SizeConfig.convertHeight(context, 50),
                  child: Image.asset(
                    "${imageUrl}.png",
                    height: SizeConfig.convertHeight(context, 50),
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  child: ListTile(
                    title:Text(
                     titleText!,
                      textAlign:TextAlign.center,
                    style: TextStyle(
                      
                      color: darkGray,
                      fontSize: 16,
                      fontWeight: FontWeight.w600
                    )
                  ),
                subtitle:Text(
                  subtitleText!,
                  textAlign:TextAlign.center,
                  style: TextStyle(
                    color: lightGray,
                    fontSize: 12,
                    fontWeight: FontWeight.w500),
                  ),
                ),
                ),
              ],
            ),
          ),
      ),
    );
  }
}
