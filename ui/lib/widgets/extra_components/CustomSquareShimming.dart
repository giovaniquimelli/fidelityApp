import 'package:flutter/material.dart';
// import 'package:flutter_advanced_networkimage/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'dart:io';

class CustomSquareShimming extends StatefulWidget {
  String url;
  double width;
  double height;
  bool active;
  double radius;

  CustomSquareShimming(this.url, this.width, this.height,
      {this.active = true, this.radius = 4});

  @override
  _CustomSquareShimmingState createState() => new _CustomSquareShimmingState();
}

class _CustomSquareShimmingState extends State<CustomSquareShimming> {
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
              .resolve(ImageConfiguration.empty);
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
    } on SocketException catch (_) {
      print('error 1');
    } catch (e) {
      print('error 2');
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_error) {
      return Container(
        width: widget.width,
        height: widget.height,
        color: Colors.grey[200],
      );
    }
    return _checkLoading == true
        ? Shimmer.fromColors(
            enabled: true,
            baseColor: Colors.grey[300],
            highlightColor: Colors.grey[100],
            child: Container(
              width: widget.width,
              height: widget.height,
              color: Colors.grey[200],
            ),
          )
        : ClipRRect(
            borderRadius: BorderRadius.circular(widget.radius),
            child: new Container(
              foregroundDecoration: !widget.active
                  ? BoxDecoration(
                      color: Colors.grey,
                      backgroundBlendMode: BlendMode.saturation)
                  : null,
              width: widget.width,
              height: widget.height,
              decoration: BoxDecoration(
                image: DecorationImage(
                    // image: AdvancedNetworkImage(widget.url), fit: BoxFit.cover),
                    image: NetworkImage(widget.url), fit: BoxFit.cover),
              ),
            ),
          );
  }
}
