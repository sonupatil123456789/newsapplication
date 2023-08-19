import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/constants/colorpallets.dart';

class H1text extends StatelessWidget {
  var fonttext;
  var size;
  var weight;

  H1text(
      {super.key,
      required this.fonttext,
      required this.weight,
      required this.size});

  @override
  Widget build(BuildContext context) {
    return Text(fonttext,
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
        style: GoogleFonts.rubik(
          fontWeight: weight,
          fontSize: size,
          color: TheamColors.HtexrtColor1,
        ));
  }
}
