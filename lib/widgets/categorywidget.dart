import 'package:drapp/theme/sharedcolors.dart';
import 'package:drapp/theme/texttheme.dart';
import 'package:flutter/material.dart';


class CategoryItem extends StatefulWidget {

  final String categoryImage;
  final String categoryName;

  CategoryItem(this.categoryImage, this.categoryName);

  @override
  _CategoryItemState createState() => _CategoryItemState();
}

class _CategoryItemState extends State<CategoryItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 100.0,
          width: 100.0,
          margin: EdgeInsets.only(bottom: 5.0),
          decoration: BoxDecoration(
            color: categoryIconBackGroundColor,
            shape: BoxShape.circle,
            image: DecorationImage(
              image: NetworkImage(widget.categoryImage),
              fit: BoxFit.fill
            )
          ),
        ),
        Text(
          widget.categoryName,
          style: mainTextStyle,
        )
      ],
    );
  }
}