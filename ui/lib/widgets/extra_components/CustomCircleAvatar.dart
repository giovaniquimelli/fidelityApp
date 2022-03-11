import 'package:flutter/material.dart';
// import 'package:flutter_advanced_networkimage/provider.dart';

class CustomCircleAvatar extends StatefulWidget {
  String url;
  String initials;
  Color backgroundColor;
  double size;
  double fontSize;

  CustomCircleAvatar(
      this.url, this.initials, this.backgroundColor, this.size, this.fontSize);

  @override
  _CustomCircleAvatarState createState() => new _CustomCircleAvatarState();
}

class _CustomCircleAvatarState extends State<CustomCircleAvatar> {
  bool _checkLoading = true;
  bool _error = false;

  @override
  void initState() {
    _getImage();
  }

  void _getImage() {
    try {
      final ImageStream stream =
          // AdvancedNetworkImage(widget.url, retryLimit: 3, printError: true)
          NetworkImage(widget.url)
              .resolve(ImageConfiguration());
      stream.addListener(
        ImageStreamListener(
          (info, call) {
            if (mounted) {
              setState(() {
                _checkLoading = false;
              });
            }
          },
          onError: (dynamic exception, StackTrace stackTrace) {
            print(exception);
            print(stackTrace);
            setState(() {
              _error = true;
            });
          },
        ),
      );
    } catch (e) {
      print('error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return _checkLoading == true
        ? new Container(
            height: widget.size,
            width: widget.size,
            child: CircleAvatar(
              child: Center(
                child: Text(
                  widget.initials,
                  style: TextStyle(
                      fontSize: widget.fontSize,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              backgroundColor: widget.backgroundColor,
            ),
          )
        : Container(
            height: widget.size,
            width: widget.size,
            child: new CircleAvatar(
              // backgroundImage: AdvancedNetworkImage(widget.url),
              backgroundImage: NetworkImage(widget.url),
            ),
          );
  }
}
