import 'package:flutter/material.dart';

void showSnackBar(context,String message)
{
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(message),),
  );
}

void navigateTo(BuildContext context ,Widget widget)
{
  Navigator.of(context).push(
      MaterialPageRoute(
          builder: (context) => widget)
  );
}
