import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_icons/flutter_icons.dart';
import 'package:pdp_ui_instagram/models/post_model.dart';
import 'package:pdp_ui_instagram/models/story_model.dart';

class FeedPage extends StatefulWidget {
  static const String id = "feed_page";

  const FeedPage({Key? key}) : super(key: key);

  @override
  _FeedPageState createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {

  final List<Story> _stories = [
    Story("assets/images/my2.jpg", "Yorqin"),
    Story("assets/images/user_1.jpeg", "Jazmin"),
    Story("assets/images/user_2.jpeg", "Sylvester"),
    Story("assets/images/user_3.jpeg", "Lavina"),
    Story("assets/images/user_1.jpeg", "Jazmin"),
    Story("assets/images/user_2.jpeg", "Sylvester"),
    Story("assets/images/user_3.jpeg", "Lavina"),
  ];

  final List<Post> _posts = [
    Post(
        "Yorqin",
        "assets/images/my2.jpg",
        "assets/images/my3.jpg",
        "I have just uploaded my new picture.That was taken in Shakhrisabz"),

    Post(
        "Brianne",
        "assets/images/user_1.jpeg",
        "assets/images/feed_1.jpeg",
        "Conservator neil aliquot oasis conservator."),
    Post(
        "Henri",
        "assets/images/user_2.jpeg",
        "assets/images/feed_2.jpeg",
        "Conservator neil aliquot oasis conservator."),
    Post(
        "Mariano",
        "assets/images/user_3.jpeg",
        "assets/images/feed_3.jpeg",
        "Conservator neil aliquot oasis conservator."),

  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Divider(),
            //#stories watch all
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text("Stories",
                    style: TextStyle(color: Colors.grey, fontSize: 14),),
                  Text("Watch all",
                    style: TextStyle(color: Colors.grey, fontSize: 14),),

                ],
              ),
            ),
            const SizedBox(height: 5,),
            //#stories
            SizedBox(
              height: 120,
              width: MediaQuery.of(context).size.width,
              child: ListView(

                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                children: _stories.map((story){
                  return _itemStory(story);
                }).toList(),
              ),
            ),
            //#postlist
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _posts.length,
                itemBuilder: (ctx,i){
                  return _itemPost(_posts[i]);
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _itemStory(Story story) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          height: 70,
          width: 70,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: const Color(0xFF8e44ad),width: 3),
            image: DecorationImage(
              image: AssetImage(story.image),
              fit: BoxFit.cover,
            )
          ),
        ),
        Text(story.name,style: const TextStyle(color: Colors.grey,fontSize: 15),)
      ],
    );
  }

  Widget _itemPost(Post post){
    return Container(
      color: Colors.black,
      child: Column(
        children: [
          //#header
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      height: 45,
                      width: 45,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage(post.imgProfile),
                          fit: BoxFit.cover
                        )
                      ),
                    ),
                    const SizedBox(width: 10,),
                    Text(post.name,style: const TextStyle(color: Colors.grey,fontSize: 16),)
                  ],
                ),
                IconButton(onPressed: (){}, icon: const Icon(SimpleLineIcons.options,color: Colors.grey,)),
              ],
            ),
          ),
          //#imagepost
          FadeInImage(
            width: MediaQuery.of(context).size.width,
            image: AssetImage(post.imgPost),
            placeholder: const AssetImage("assets/images/placeholder.png"),
          ),

          //#like comment send
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: (){},
                    icon: const Icon(FontAwesome.heart_o,color: Colors.grey,),
                  ),
                  IconButton(
                    onPressed: (){},
                    icon: const Icon(FontAwesome.comment_o,color: Colors.grey),
                  ),
                  IconButton(
                    onPressed: (){},
                    icon: const Icon(FontAwesome.send_o,color: Colors.grey),
                  ),
                ],
              ),
              IconButton(
                onPressed: (){},
                icon: const Icon(FontAwesome.bookmark_o,color: Colors.grey),
              )
            ],
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.symmetric(horizontal: 14),
            child: RichText(
              softWrap: true,
              overflow: TextOverflow.visible,
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: "Liked by ",
                    style: TextStyle(
                      color: Colors.grey,
                    )
                  ),
                  TextSpan(
                    text: "Storm1_007,",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                    )
                  ),
                  TextSpan(
                    text: "Yessenia,",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                    )
                  ),
                  TextSpan(
                    text: "Damara ",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                    )
                  ),
                  TextSpan(
                    text: "and 12360 others",
                    style: TextStyle(
                      color: Colors.grey,
                    )
                  ),
                ]
              ),
            ),
          ),
          //#caption
          Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.symmetric(horizontal: 14,vertical: 5),
            child: RichText(
              softWrap: true,
              overflow: TextOverflow.visible,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: post.name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                    )
                  ),
                  TextSpan(
                    text: post.caption,
                    style: const TextStyle(
                      color: Colors.grey,

                    )
                  ),
                ]
              ),
            ),
          ),
          //#date
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 14),
            alignment: Alignment.centerLeft,
            child: const Text("February 14",style: TextStyle(color: Colors.grey,fontSize: 15),),
          )

        ],
      ),
    );
  }

}
