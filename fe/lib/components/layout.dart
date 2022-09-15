import 'package:flutter/material.dart';

class Layout extends StatelessWidget {
  final Widget formElement;
  final bool showThirdParty;
  final bool isLogin;
  final String footerText1;
  final String footerText2;
  final String title;
  final VoidCallback? onFooterText2Click;
  final String subTitle;

  const Layout({
    Key? key,
    required this.formElement,
    required this.title,
    this.footerText1 = '',
    this.footerText2 = '',
    this.showThirdParty = false,
    this.isLogin = false,
    this.subTitle = '',
    this.onFooterText2Click,
  }) : super(key: key);

  Widget renderBackButton(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      borderRadius: const BorderRadius.all(Radius.circular(8.0)),
      splashColor: Colors.brown.withOpacity(0.5),
      child: Ink(
        height: 41,
        width: 41,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(8.0)),
          border: Border.all(
            color: const Color(0xffE8ECF4),
          ),
        ),
        child: const Icon(Icons.arrow_back_ios_new, size: 19),
      ),
    );
  }

  Widget renderTitle() {
    return Text(
      title,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 30,
      ),
    );
  }

  Widget renderSubTitle() {
    if (subTitle == '') {
      return Container();
    }

    return Column(
      children: [
        Container(
          height: 10,
        ),
        Text(
          subTitle,
          style: const TextStyle(
            fontSize: 16,
            color: Color(0xff8391A1),
          ),
        ),
      ],
    );
  }

  Widget renderDivider({double? indent = 0.0, double? endIndent = 0}) {
    return Expanded(
      flex: 1,
      child: Divider(
        thickness: 1,
        color: const Color(0xffE8ECF4),
        endIndent: endIndent,
        indent: indent,
      ),
    );
  }

  Widget renderIconButton({
    required void Function()? onPressed,
    required String icon,
  }) {
    return InkWell(
      onTap: () {},
      borderRadius: const BorderRadius.all(Radius.circular(8.0)),
      splashColor: Colors.brown.withOpacity(0.5),
      child: Ink(
        height: 56,
        width: 105,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(8.0)),
          border: Border.all(
            color: const Color(0xffE8ECF4),
          ),
        ),
        child: Image.asset(
          icon,
          width: 26,
          height: 26,
        ),
      ),
    );
  }

  Widget renderThirdParty() {
    if (!showThirdParty) {
      return Container();
    }

    return Column(
      children: [
        Container(height: 15),
        Row(
          children: [
            renderDivider(endIndent: 12),
            Text(
              'Or ${isLogin ? 'login' : 'register'} with',
              style: const TextStyle(
                color: Color(0xff6A707C),
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            renderDivider(indent: 12),
          ],
        ),
        Container(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            renderIconButton(
              onPressed: () {},
              icon: 'assets/facebook_icon.png',
            ),
            Container(width: 8),
            renderIconButton(
              onPressed: () {},
              icon: 'assets/google_icon.png',
            )
          ],
        ),
      ],
    );
  }

  Widget renderFooter() {
    if (footerText1 != '' && footerText2 != '') {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            footerText1,
            style: const TextStyle(
              color: Color(0xff032426),
              fontSize: 16,
            ),
          ),
          TextButton(
            style: TextButton.styleFrom(
              foregroundColor: const Color(0xff35C2C1),
            ),
            onPressed: onFooterText2Click,
            child: Text(
              footerText2,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      );
    }

    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: viewportConstraints.maxHeight,
              ),
              child: IntrinsicHeight(
                child: SafeArea(
                  child: Container(
                    padding: const EdgeInsets.only(
                      left: 22,
                      top: 12,
                      bottom: 22,
                      right: 22,
                    ),
                    child: Column(
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            renderBackButton(context),
                            Container(height: 15),
                            renderTitle(),
                            renderSubTitle(),
                            Container(height: 15),
                            formElement,
                            renderThirdParty(),
                          ],
                        ),
                        const Spacer(),
                        renderFooter(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
