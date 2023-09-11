import 'package:prune/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:prune/values/dimens.dart';
import 'package:prune/values/strings.dart';
import 'package:prune/values/styles.dart';

class InternetConnectionErrorWidget extends StatelessWidget {
  final Function onClickRetry;

  const InternetConnectionErrorWidget({required this.onClickRetry, super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: LTEdgeInsets.screen,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            const SizedBox(
              height: Dimens.widgetsInterspace,
            ),

            Text(
              Strings.internetConnectionErrorUIMessage,
              style: TextStyles.lighterSecNormalH5.copyWith(color: Colors.white),
              textAlign: TextAlign.center,
            ),

            const SizedBox(
              height: Dimens.widgetsBiggerInterspace,
            ),

            LightPryButton(
                text: Strings.retryButton, onPressed: () => onClickRetry.call())
          ],
        ),
      ),
    );
  }
}

class LightPryButton extends StatelessWidget {
  final String text;
  final Function onPressed;

  const LightPryButton(
      {super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () => onPressed.call(),
      color: LTColors.pryLightButton,
      padding: const EdgeInsets.symmetric(horizontal: Dimens.buttonHozPadding),
      elevation: Dimens.buttonElevation,
      disabledElevation: Dimens.buttonDisabledElevation,
      enableFeedback: true,
      height: Dimens.buttonHeight,
      shape: _shape,
      child: Text(
        text,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyles.lightPryButton,
      ),
    );
  }

  RoundedRectangleBorder get _shape {
    return RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Dimens.buttonBorderRadius),
        side: const BorderSide(
            color: LTColors.pryLightButtonBorder, width: Dimens.borderWidth));
  }
}

SizedBox verticalSpacingWidget() {
  return const SizedBox(height: Dimens.textFieldVerticalSpacing);
}
