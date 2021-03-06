import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/main/model/AppModel.dart';
import 'package:prokit_flutter/main/screens/ProKitScreenListing.dart';
import 'package:prokit_flutter/main/utils/AppColors.dart';
import 'package:prokit_flutter/main/utils/AppImages.dart';
import 'package:prokit_flutter/main/utils/AppStrings.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

class ThemeItemWidget extends StatefulWidget {
  final int index;
  final ProTheme data;

  ThemeItemWidget(this.index, this.data);

  @override
  _ThemeItemWidgetState createState() => _ThemeItemWidgetState();
}

class _ThemeItemWidgetState extends State<ThemeItemWidget> {
  List<Color> colors = [appCat1, appCat2, appCat3];

  @override
  void initState() {
    init();
    super.initState();
  }

  void init() async {
    //
  }

  @override
  void setState(VoidCallback fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return AnimationConfiguration.staggeredList(
      position: widget.index,
      duration: Duration(milliseconds: 600),
      child: FadeInAnimation(
        child: GestureDetector(
          onTap: () {
            if (appStore.isDarkModeOn) {
              appStore.toggleDarkMode(value: widget.data.darkThemeSupported.validate());
            }

            if (widget.data.sub_kits == null || widget.data.sub_kits!.isEmpty) {
              if (widget.data.widget != null) {
                log('Tag ${widget.data.widget!.key}');

                widget.data.widget.launch(context);
              } else {
                toasty(context, appComingSoon);
              }
            } else {
              ProKitScreenListing(widget.data).launch(context);
            }
          },
          child: Container(
            margin: EdgeInsets.only(left: 16, right: 16, bottom: 16),
            child: Row(
              children: <Widget>[
                Container(
                  width: 80,
                  height: 80,
                  margin: EdgeInsets.only(right: 12),
                  padding: EdgeInsets.all(16),
                  child: Image.asset(icons[widget.index % icons.length], color: Colors.white),
                  decoration: boxDecorationDefault(color: colors[widget.index % colors.length]),
                ),
                Expanded(
                  child: Stack(
                    alignment: Alignment.centerRight,
                    children: <Widget>[
                      Container(
                        width: context.width(),
                        height: 80,
                        padding: EdgeInsets.only(left: 16, right: 16),
                        margin: EdgeInsets.only(right: context.width() / 28),
                        decoration: boxDecorationDefault(color: context.cardColor),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text('${widget.data.name.validate()}', style: boldTextStyle(), maxLines: 2),
                                Text(
                                  widget.data.title_name.validate(),
                                  style: secondaryTextStyle(),
                                ).visible(widget.data.title_name.validate().isNotEmpty),
                              ],
                            ).expand(),
                            Container(
                              alignment: Alignment.center,
                              height: 25,
                              margin: EdgeInsets.only(right: 8),
                              padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                              decoration: widget.data.tag.validate().isNotEmpty ? boxDecorationDefault(color: appDarkRed) : BoxDecoration(),
                              child: text(widget.data.tag.validate(), fontSize: 14.0, textColor: whiteColor),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 30,
                        height: 30,
                        child: Icon(Icons.keyboard_arrow_right, color: Colors.white),
                        decoration: boxDecorationDefault(color: colors[widget.index % colors.length], shape: BoxShape.circle),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
