import 'package:flutter/material.dart';
import 'package:qiita_me/models/article.dart';
import 'package:intl/intl.dart';

class ArticleContainer extends StatelessWidget {
  const ArticleContainer({super.key, required this.article});

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        decoration: const BoxDecoration(
          color: Color(0xFF55C500),
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              DateFormat('yyyy/MM/dd').format(article.createdAt),
              style: const TextStyle(color: Colors.white, fontSize: 12),
            ),
            Text(
              article.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Text(
              '#${article.tags.join(' #')}', // ←文字列の配列をjoinで結合
              style: const TextStyle(
                fontSize: 12,
                color: Colors.white,
                fontStyle: FontStyle.italic, // ←フォントスタイルを斜体に変更
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // ハートアイコンといいね数
                Column(
                  children: [
                    const Icon(Icons.favorite, color: Colors.white),
                    Text(
                      article.likesCount.toString(),
                      style: const TextStyle(fontSize: 12, color: Colors.white),
                    ),
                  ],
                ),
                // 投稿者のアイコンと投稿者名
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    CircleAvatar(
                      radius: 26,
                      backgroundImage: NetworkImage(
                        article.user.profileImageUrl,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      article.user.id,
                      style: const TextStyle(fontSize: 12, color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
