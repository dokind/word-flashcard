import 'package:flutter/material.dart';

import '../../../main.dart';
import '../../shared.dart';

Future<bool?> showModal(BuildContext context, {required Widget child}) async =>
    await showModalBottomSheet(
      context: context,
      backgroundColor: $styles.colors.greyStrong,
      builder: (_) => child,
    ) ??
    false;

class LoadingModal extends StatelessWidget {
  const LoadingModal({Key? key, this.title, this.msg, this.child})
      : super(key: key);
  final String? title;
  final String? msg;
  final Widget? child;

  @override
  Widget build(BuildContext context) => _BaseContentModal(
        title: title,
        msg: msg,
        buttons: const [],
        child: child,
      );
}

class OkModal extends StatelessWidget {
  const OkModal({Key? key, this.title, this.msg, this.child}) : super(key: key);
  final String? title;
  final String? msg;
  final Widget? child;

  @override
  Widget build(BuildContext context) => _BaseContentModal(
        title: title,
        msg: msg,
        buttons: [
          AppBtn.from(
              text: 'Ok',
              expand: true,
              isSecondary: true,
              onPressed: () => Navigator.of(context).pop(true)),
        ],
        child: child,
      );
}

class OkCancelModal extends StatelessWidget {
  const OkCancelModal({Key? key, this.title, this.msg, this.child})
      : super(key: key);
  final String? title;
  final String? msg;
  final Widget? child;

  @override
  Widget build(BuildContext context) => _BaseContentModal(
        title: title,
        msg: msg,
        buttons: [
          AppBtn.from(
              text: 'ok',
              expand: true,
              isSecondary: true,
              onPressed: () => Navigator.of(context).pop(true)),
          SizedBox(width: $styles.insets.xs),
          AppBtn.from(
              text: 'cancel',
              expand: true,
              onPressed: () => Navigator.of(context).pop(false)),
        ],
        child: child,
      );
}

/// Allows for a title, msg and body widget
class _BaseContentModal extends StatelessWidget {
  final String? title;
  final String? msg;
  final Widget? child;
  final List<Widget> buttons;

  const _BaseContentModal(
      {Key? key, this.title, this.msg, required this.buttons, this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) => IntrinsicHeight(
        child: Center(
          child: SizedBox(
            width: $styles.sizes.maxContentWidth3,
            child: Padding(
              padding: EdgeInsets.all($styles.insets.lg),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (title != null) Text(title!, style: $styles.text.h2),
                  if (child != null) child!,
                  if (msg != null) Text(msg!, style: $styles.text.body),
                  Column(children: buttons.map((e) => e).toList())
                ],
              ),
            ),
          ),
        ),
      );
}
