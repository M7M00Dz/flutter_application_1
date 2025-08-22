import 'package:flutter/material.dart';

void main() {
  runApp(const NewsApp());
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: const Color(0xFF0B72FF),
        scaffoldBackgroundColor: const Color(0xFFF7F8FA),
        textTheme: const TextTheme(
          headlineSmall: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
          titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
          titleMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          bodyMedium: TextStyle(fontSize: 14, color: Color(0xFF5C6672)),
        ),
      ),
      home: const HomePage(),
    );
  }
}

class Article {
  final String title;
  final String subtitle;
  final String imagePath;
  final String category;

  Article({
    required this.title,
    required this.subtitle,
    required this.imagePath,
    required this.category,
  });
}

class CategoryItem {
  final String name;
  final String imagePath;

  CategoryItem({required this.name, required this.imagePath});
}

final categories = <CategoryItem>[
  CategoryItem(name: 'General', imagePath: 'assets/image.png'),
  CategoryItem(name: 'Sports', imagePath: 'assets/image.png'),
  CategoryItem(name: 'Business', imagePath: 'assets/image.png'),
  CategoryItem(name: 'Technology', imagePath: 'assets/image.png'),
  CategoryItem(name: 'Entertainment', imagePath: 'assets/image.png'),
  CategoryItem(name: 'Health', imagePath: 'assets/health.jpg'),
];

final articles = <Article>[
  Article(
    title: 'Tech layoffs continue',
    subtitle:
        'Several firms announced new rounds of layoffs across the industry.',
    imagePath: 'assets/image.png',
    category: 'Technology',
  ),
  Article(
    title: 'Stock market volatility returns',
    subtitle: 'Investors brace for more uncertainty as indices swing intraday.',
    imagePath: 'assets/bg.jpg',
    category: 'Business',
  ),
  Article(
    title: 'Small business loans explained',
    subtitle: 'Understanding loan types and how to apply effectively.',
    imagePath: 'assets/image.png',
    category: 'Business',
  ),
  Article(
    title: 'Issue 1: Ohio vote delivers win for abortion rights supporters',
    subtitle:
        'A high-stakes vote to raise the bar to amend Ohio\'s constitution became a pivotal moment.',
    imagePath: 'assets/image.png',
    category: 'General',
  ),
  Article(
    title: 'Stock market today: Live updates',
    subtitle: 'Investors are coming off a down session for the major averages.',
    imagePath: 'assets/image.png',
    category: 'Business',
  ),
];

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News'),
        centerTitle: false,
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
              child: _CategoriesGrid(categories: categories),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 20, 16, 8),
              child: Text(
                'Top stories',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
          ),
          SliverList.builder(
            itemCount: 3,
            itemBuilder: (context, index) {
              final a = articles[index % articles.length];
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 10,
                ),
                child: _BigArticleCard(article: a),
              );
            },
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: Text(
                'Latest',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
          ),
          SliverList.builder(
            itemCount: articles.length,
            itemBuilder: (context, index) {
              final a = articles[index];
              return Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 12),
                child: _SmallArticleTile(article: a),
              );
            },
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 24)),
        ],
      ),
    );
  }
}

class _CategoriesGrid extends StatelessWidget {
  const _CategoriesGrid({required this.categories});
  final List<CategoryItem> categories;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: categories.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 1,
      ),
      itemBuilder: (context, index) {
        final c = categories[index];
        return _CategoryTile(item: c);
      },
    );
  }
}

class _CategoryTile extends StatelessWidget {
  const _CategoryTile({required this.item});
  final CategoryItem item;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(18),
      child: Ink(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          boxShadow: const [
            BoxShadow(
              color: Color(0x14000000),
              blurRadius: 10,
              offset: Offset(0, 6),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(18),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(item.imagePath, fit: BoxFit.cover),
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [Colors.black54, Colors.transparent],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    item.name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      shadows: [Shadow(color: Colors.black26, blurRadius: 8)],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _BigArticleCard extends StatelessWidget {
  const _BigArticleCard({required this.article});
  final Article article;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(20),
      child: Ink(
        height: 150,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Color(0x14000000),
              blurRadius: 10,
              offset: Offset(0, 8),
            ),
          ],
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: const BorderRadiusDirectional.only(
                topStart: Radius.circular(20),
                bottomStart: Radius.circular(20),
              ),
              child: SizedBox(
                width: 150,
                height: double.infinity,
                child: Image.asset(article.imagePath, fit: BoxFit.cover),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 14,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      article.title,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(height: 6),
                    Text(
                      article.subtitle,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SmallArticleTile extends StatelessWidget {
  const _SmallArticleTile({required this.article});
  final Article article;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(18),
      child: Ink(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          boxShadow: const [
            BoxShadow(
              color: Color(0x12000000),
              blurRadius: 10,
              offset: Offset(0, 6),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      article.title,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 6),
                    Text(
                      article.subtitle,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: SizedBox(
                  width: 90,
                  height: 72,
                  child: Image.asset(article.imagePath, fit: BoxFit.cover),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
