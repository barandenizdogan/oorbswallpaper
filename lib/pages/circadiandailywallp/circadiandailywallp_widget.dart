import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/admob_util.dart' as admob;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'circadiandailywallp_model.dart';
export 'circadiandailywallp_model.dart';

class CircadiandailywallpWidget extends StatefulWidget {
  const CircadiandailywallpWidget({super.key});

  @override
  State<CircadiandailywallpWidget> createState() =>
      _CircadiandailywallpWidgetState();
}

class _CircadiandailywallpWidgetState extends State<CircadiandailywallpWidget> {
  late CircadiandailywallpModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CircadiandailywallpModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      admob.loadInterstitialAd(
        "ca-app-pub-5455528914159263/3156240592",
        "ca-app-pub-5455528914159263/2165774311",
        false,
      );
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFF14181B),
      appBar: AppBar(
        backgroundColor: Color(0x40161616),
        automaticallyImplyLeading: false,
        title: Text(
          FFLocalizations.of(context).getText(
            'kpmbqcrp' /* Circadian */,
          ),
          style: FlutterFlowTheme.of(context).displaySmall.override(
                fontFamily: 'Montserrat',
                color: Color(0xCDFFFFFF),
                fontSize: 28.0,
                letterSpacing: 10.0,
                fontWeight: FontWeight.w200,
              ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 0.0,
      ),
      body: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Image.network(
          'https://picsum.photos/seed/923/600',
          width: 200.0,
          height: 200.0,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
