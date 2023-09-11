import 'package:prune/data/sources/shared/models/books.dart';
import 'package:prune/presentation/components/general.dart';
import 'package:prune/utils/general_utils.dart';
import 'package:prune/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:prune/values/strings.dart';
import 'package:prune/values/styles.dart';

class BookItem extends StatelessWidget {
  final Books books;

  const BookItem({required this.books, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Card(
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _contentItem(context,Strings.bookAuthor, books.bookAuthor[0]),
            _space,
            _contentItem(context,Strings.bookTitle, books.bookTitle),
            _space,
            _contentItem(context,Strings.publicationCity, books.publicationCity),
            _space,
            _contentItem(context,Strings.publicationCountry, books.publicationCountry),
            _space,
            _contentItem(context,Strings.bookPages, '${books.bookPage}')
          ],
        ),
      ),
    );
  }

  SizedBox get _space {
    return verticalSpacingWidget();
  }

  _contentItem(BuildContext context, String name, String value){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: GeneralUtils().getScreenWidth(context) * .3,
          child: Text(
            name,
            style: TextStyles.lighterSecBody.copyWith(
              fontSize: 12,
              color: LTColors.pryBodyText,
            ),
          ),
        ),
        SizedBox(
          width: GeneralUtils().getScreenWidth(context) * .4,
          child: Text(
            value,
            textAlign: TextAlign.end,
            style: TextStyles.boldSecSmallBody.copyWith(
              fontSize: 14,
              color: LTColors.pryBodyText,
            ),
          ),
        ),
      ],
    );
  }
}
