import 'package:flutter/material.dart';

import '../../../model/SourceResponse.dart';

class SourceName extends StatelessWidget{
  final Source source;
  final bool isSelected;

  const SourceName({super.key,required this.source,
  required this.isSelected});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text(source.name??'',
    style: isSelected?
      Theme.of(context).textTheme.bodyLarge:
      Theme.of(context).textTheme.bodyMedium,);
  }

}