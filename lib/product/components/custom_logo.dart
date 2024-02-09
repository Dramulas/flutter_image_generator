import 'package:flutter/cupertino.dart';

import '../enum/image_enum.dart';

class CustomLogo extends SizedBox {
  CustomLogo({super.key})
      : super(
          height: 50,
          width: 50,
          child: Image.asset(
            AssetsEnum.logo.toPng(),
          ),
        );
}
