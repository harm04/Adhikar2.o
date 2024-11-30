import 'package:adhikar2_o/services/postService.dart';
import 'package:adhikar2_o/utils/colors.dart';
import 'package:adhikar2_o/utils/snackbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:popover/popover.dart';

class PostCard extends StatefulWidget {
  final String firstName;
  final String lastName;
  final bool isAnonymous;
  final List downvotes;
  final List upvotes;
  final String uid;
  final String postId;
  final date;
  final String profImage;
  final String post;
  const PostCard(
      {super.key,
      required this.firstName,
      required this.lastName,
      required this.isAnonymous,
      required this.downvotes,
      required this.date,
      required this.profImage,
      required this.upvotes,
      required this.post,
      required this.uid,
      required this.postId});

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return loading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : SizedBox(
            child: Padding(
              padding: const EdgeInsets.only(left: 18, right: 18, top: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          widget.isAnonymous
                              ? CircleAvatar(
                                  radius: 25,
                                  backgroundColor: primaryColor,
                                  backgroundImage: AssetImage(
                                      'assets/icons/ic_anonymous.png'))
                              : CircleAvatar(
                                  radius: 25,
                                  backgroundColor: primaryColor,
                                  backgroundImage: widget.profImage != null
                                      ? NetworkImage(widget.profImage)
                                      : NetworkImage(
                                          'https://image.cdn2.seaart.me/2024-09-16/crjon2de878c739kmukg-2/363d4f7dce80aad62b4b1cdc12bb1ec6_high.webp'),
                                ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            children: [
                              Text(
                                widget.isAnonymous
                                    ? 'Anonymous'
                                    : '${widget.firstName} ${widget.lastName}',
                                style: TextStyle(
                                    color: primaryColor, fontSize: 16),
                              ),
                              Text(
                                DateFormat.yMMMd().format(widget.date.toDate()),
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 14),
                              ),
                            ],
                          ),
                        ],
                      ),
                      widget.uid == _auth.currentUser!.uid
                          ? Builder(builder: (context) {
                              return GestureDetector(
                                  onTap: () {
                                    showPopover(
                                      context: context,
                                      height: 36,
                                      width: 200,
                                      direction: PopoverDirection.top,
                                      backgroundColor: Colors.white,
                                      bodyBuilder: (BuildContext context) {
                                        return Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: [
                                            GestureDetector(
                                              onTap: () async {
                                                setState(() {
                                                  loading = true;
                                                });
                                                String res = await PostService()
                                                    .deletePost(
                                                        postId: widget.postId);
                                                if (res == 'success') {
                                                  Navigator.pop(context);
                                                  setState(() {
                                                    loading = false;
                                                  });
                                                  showSnackbar(
                                                      context, 'Post deleted');
                                                } else {
                                                  Navigator.pop(context);
                                                  setState(() {
                                                    loading = false;
                                                  });
                                                  showSnackbar(context, res);
                                                }
                                              },
                                              child: SizedBox(
                                                height: 30,
                                                child: Center(
                                                    child: Text('Delete')),
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                  child: Icon(Icons.more_vert));
                            })
                          : SizedBox()
                    ],
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Text(
                    widget.post,
                    style: TextStyle(fontSize: 16),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 4,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          PostService().upvote(
                            widget.postId,
                            widget.upvotes,
                            widget.downvotes,
                            _auth.currentUser!.uid,
                          );
                        },
                        child: widget.upvotes.contains(_auth.currentUser!.uid)
                            ? Image.asset(
                                'assets/icons/ic_upvote_filled.png',
                                height: 25,
                                color: Colors.blue,
                              )
                            : Image.asset(
                                'assets/icons/ic_upvote_outline.png',
                                height: 25,
                              ),
                      ),
                      SizedBox(
                        width: 7,
                      ),
                      Text(widget.upvotes.length.toString()),
                      SizedBox(
                        width: 30,
                      ),
                      GestureDetector(
                        onTap: () {
                          PostService().downvote(widget.postId, widget.upvotes,
                              widget.downvotes, _auth.currentUser!.uid);
                        },
                        child: widget.downvotes.contains(_auth.currentUser!.uid)
                            ? Image.asset(
                                'assets/icons/ic_downvote_filled.png',
                                height: 25,
                                color: Colors.red,
                              )
                            : Image.asset(
                                'assets/icons/ic_downvote_outline.png',
                                height: 25,
                              ),
                      ),
                      SizedBox(
                        width: 7,
                      ),
                      Text(widget.downvotes.length.toString()),
                    ],
                  ),
                  Divider()
                ],
              ),
            ),
          );
  }
}
