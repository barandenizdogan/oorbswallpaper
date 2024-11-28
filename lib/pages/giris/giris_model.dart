import '/components/collections_component_widget.dart';
import '/flutter_flow/flutter_flow_ad_banner.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'giris_widget.dart' show GirisWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class GirisModel extends FlutterFlowModel<GirisWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for collectionsComponent component.
  late CollectionsComponentModel collectionsComponentModel;

  @override
  void initState(BuildContext context) {
    collectionsComponentModel =
        createModel(context, () => CollectionsComponentModel());
  }

  @override
  void dispose() {
    collectionsComponentModel.dispose();
  }
}
