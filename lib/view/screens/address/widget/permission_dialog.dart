import 'package:flutter/material.dart';
import 'package:flutter_restaurant/localization/language_constrants.dart';
import 'package:flutter_restaurant/utill/dimensions.dart';
import 'package:flutter_restaurant/utill/styles.dart';
import 'package:flutter_restaurant/view/base/custom_button.dart';
import 'package:geolocator/geolocator.dart';

class PermissionDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: EdgeInsets.all(Dimensions.PADDING_SIZE_LARGE),
        child: Column(mainAxisSize: MainAxisSize.min, children: [

          Icon(Icons.add_location_alt_rounded, color: Theme.of(context).primaryColor, size: 100),
          SizedBox(height: Dimensions.PADDING_SIZE_LARGE),

          Text(
            getTranslated('you_denied_location_permission', context)!, textAlign: TextAlign.justify,
            style: rubikMedium.copyWith(fontSize: Dimensions.FONT_SIZE_LARGE),
          ),
          SizedBox(height: Dimensions.PADDING_SIZE_LARGE),

          Row(children: [
            Expanded(
              child: TextButton(
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10), side: BorderSide(width: 2, color: Theme.of(context).primaryColor)),
                  minimumSize: Size(1, 50),
                ),
                child: Text(getTranslated('no', context)!),
                onPressed: () => Navigator.pop(context),
              ),
            ),
            SizedBox(width: Dimensions.PADDING_SIZE_SMALL),
            Expanded(child: CustomButton(btnTxt: getTranslated('yes', context), onTap: () async {
              await Geolocator.openLocationSettings();
              Navigator.pop(context);
            })),
          ]),

        ]),
      ),
    );
  }
}
