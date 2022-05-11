import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:news_app/modules/web_view/web_view_screen.dart';
import 'package:news_app/shared/cubit/cubit.dart';

Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  void Function(String)? onSubmit,
  void Function(String)? change,
  required String? Function(String? value)? validate,
  bool isPassword = false,
  required String label,
  required IconData prefix,
  IconData? suffix,
  Function? suffixPressed,
  void Function()? onTap,
  bool isClickable = true,
  required context,
}) {
  bool dark = AppCubit.get(context).isDark;
  return TextFormField(
    controller: controller,
    keyboardType: type,
    obscureText: isPassword,
    enabled: isClickable,
    onChanged: change,
    onFieldSubmitted: (s) {
      onSubmit!(s);
    },
    validator: validate,
    onTap: onTap,
    style: Theme.of(context).textTheme.bodyText2,
    decoration: InputDecoration(
      filled: true,
      enabledBorder: dark
          ? OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(25.0))
          : OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(25.0)),
      focusedBorder: dark
          ? OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white, width: 2.0),
              borderRadius: BorderRadius.circular(25.0),
            )
          : OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white54, width: 2.0),
              borderRadius: BorderRadius.circular(25.0),
            ),
      hintText: label,
      hintStyle: Theme.of(context).textTheme.bodyText2!.copyWith(
        color:Colors.grey,
        fontStyle: FontStyle.normal,

      ),
      prefixIcon: Icon(prefix),
      suffixIcon: suffix != null
          ? IconButton(
              icon: Icon(suffix),
              onPressed: () {
                suffixPressed!();
              })
          : null,
      border: OutlineInputBorder(),
    ),
  );
}

Widget myDivider() => Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        height: 1.0,
        color: Colors.grey[300],
      ),
    );
Widget buildArticleItem(article, context) => InkWell(
      onTap: () {
        navigateTo(
          context,
          WebViewScreen(article['url']),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    10.0,
                  ),
                  image:article['urlToImage'] != null ? DecorationImage(
                    image: NetworkImage(
                      '${article['urlToImage']}',
                    ),
                    fit: BoxFit.cover,
                  ):DecorationImage(image: AssetImage('assets/images/news.png'))
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Container(
                height: 120,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        '${article['title']}',
                        style: Theme.of(context).textTheme.bodyText1,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      '${article['publishedAt']}',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
Widget articleBuilder(list, context, {isSearch = false}) => ConditionalBuilder(
      condition: list.length > 0,
      builder: (context) => ListView.separated(
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) =>
              buildArticleItem(list[index], context),
          separatorBuilder: (context, builder) => myDivider(),
          itemCount: list.length),
      fallback: (context) => isSearch
          ? Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Container(
                    height: 5.0,
                    width: 120.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.blue),
                  ),
                  const SizedBox(height: 30.0),
                  Container(
                    height: 4.0,
                    width: 120.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.grey),
                  ),
                  const SizedBox(height: 30.0),
                  Container(
                    height: 4.0,
                    width: 120.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.grey),
                  ),
                ]))
          : Center(child: CircularProgressIndicator()),
    );
void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => widget),
    );
Widget defaultTextButton({
  required String? text,
  required Function press,
}) {
  return TextButton(
    onPressed: press as void Function()?,
    child: Text(
      text!,
      style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
    ),
  );
}

Widget defaultButton({
  Color background = Colors.blue,
  required Function function,
  required String text,
  double radius = 20.0,
}) =>
    Container(
      height: 46,
      width: 250,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: background,
      ),
      child: MaterialButton(
        onPressed: () {
          function();
        },
        child: Text(
         text,
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.white,
            fontFamily: 'Cardo',
          ),
        ),
      ),
    );