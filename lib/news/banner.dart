import 'dart:async';

import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

const MAX_COUNT = 0x7fffffff;

///
/// Item的点击事件
///
typedef void OnBannerItemClick(int position, BannerItem entity);

///
/// 自定义ViewPager的每个页面显示
///
typedef Widget CustomBuild(int position, BannerItem entity);

class BannerWidget extends StatefulWidget {
  final double height;
  final List<BannerItem> datas;
  int duration;
  double pointRadius;
  Color selectedColor;
  Color unSelectedColor;
  Color textBackgroundColor;
  bool isHorizontal;

  OnBannerItemClick bannerPress;
  CustomBuild build;

  BannerWidget(double this.height, List<BannerItem> this.datas,
      {Key key,
        int this.duration = 5000,
        double this.pointRadius = 3.0,
        Color this.selectedColor = Colors.red,
        Color this.unSelectedColor = Colors.white,
        Color this.textBackgroundColor = const Color(0x99000000),
        bool this.isHorizontal = true,
        OnBannerItemClick this.bannerPress,
        CustomBuild this.build})
      : super(key: key);

  @override
  BannerState createState() {
    return new BannerState();
  }
}

class BannerState extends State<BannerWidget> {
  Timer timer;
  int selectedIndex = 0;
  PageController controller;

  @override
  void initState() {
    double current = widget.datas.length > 0
        ? (MAX_COUNT / 2) - ((MAX_COUNT / 2) % widget.datas.length)
        : 0.0;
    controller = PageController(initialPage: current.toInt());
    _initPageAutoScroll();
    super.initState();
  }

  _initPageAutoScroll() {
    start();
  }

  @override
  void didUpdateWidget(BannerWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('didUpdateWidget----------------------banner');
  }

  start() {
    stop();
    timer = Timer.periodic(Duration(milliseconds: widget.duration), (timer) {
      if(widget.datas.length > 0 && controller != null && controller.page != null) {
        controller.animateToPage(controller.page.toInt() + 1,
            duration: Duration(milliseconds: 300), curve: Curves.linear);
      }
    });
  }

  stop() {
    timer?.cancel();
    timer = null;
  }

  @override
  void dispose() {
    stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      height: widget.height,
      color: Colors.black12,
      child: Stack(
        children: <Widget>[
          getViewPager(),
          new Align(
            alignment: Alignment.bottomCenter,
            child: IntrinsicHeight(
              child: Container(
                padding: EdgeInsets.all(6.0),
                color: widget.textBackgroundColor,
                child: getBannerTextInfoWidget(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget getViewPager() {
    return PageView.builder(
      itemCount: widget.datas.length > 0 ? MAX_COUNT : 0,
      controller: controller,
      onPageChanged: onPageChanged,
      itemBuilder: (context, index) {
        return InkWell(
            onTap: () {
              if (widget.bannerPress != null)
                widget.bannerPress(selectedIndex, widget.datas[selectedIndex]);
            },
            child: widget.build == null
                ? FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image:
                widget.datas[index % widget.datas.length].itemImagePath,
                fit: BoxFit.cover)
                : widget.build(
                index, widget.datas[index % widget.datas.length]));
      },
    );
  }

  Widget getSelectedIndexTextWidget() {
    return widget.datas.length > 0 && selectedIndex < widget.datas.length
        ? widget.datas[selectedIndex].itemText
        : Text('');
  }

  Widget getBannerTextInfoWidget() {
    if (widget.isHorizontal) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          new Expanded(
            flex: 1,
            child: getSelectedIndexTextWidget(),
          ),
          Expanded(
            flex: 0,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: circle(),
            ),
          ),
        ],
      );
    } else {
      return new Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          getSelectedIndexTextWidget(),
          IntrinsicWidth(
            child: Row(
              children: circle(),
            ),
          ),
        ],
      );
    }
  }

  List<Widget> circle() {
    List<Widget> circle = [];
    for (var i = 0; i < widget.datas.length; i++) {
      circle.add(Container(
        margin: EdgeInsets.all(2.0),
        width: widget.pointRadius * 2,
        height: widget.pointRadius * 2,
        decoration: new BoxDecoration(
          shape: BoxShape.circle,
          color: selectedIndex == i
              ? widget.selectedColor
              : widget.unSelectedColor,
        ),
      ));
    }
    return circle;
  }

  onPageChanged(index) {
    selectedIndex = index % widget.datas.length;
    setState(() {});
  }
}

class BannerItem {
  String itemImagePath;
  Widget itemText;

  static BannerItem defaultBannerItem(String image, String text) {
    BannerItem item = new BannerItem();
    item.itemImagePath = image;
    Text textWidget = new Text(
      text,
      softWrap: true,
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
          color: Colors.white, fontSize: 12.0, decoration: TextDecoration.none),
    );

    item.itemText = textWidget;

    return item;
  }
}
