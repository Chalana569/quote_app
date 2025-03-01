import 'dart:math';
import 'package:flutter/material.dart';
import 'package:quote_app/screens/quote_detail_screen.dart';
import 'package:quote_app/models/quote_data.dart';

class QuoteScreen extends StatefulWidget {
  @override
  _QuoteScreenState createState() => _QuoteScreenState();
}

class _QuoteScreenState extends State<QuoteScreen> {
  final Random _random = Random();

  final Map<String, List<Quote>> _quotesByCategory = {
    "Motivation": [
  Quote(
    text: "Believe you can and you're halfway there.",
    author: "Theodore Roosevelt",
    category: "Motivation",
    details: "This quote emphasizes the power of belief and confidence.",
    imageUrl: "https://via.placeholder.com/150",
  ),
  Quote(
    text: "The only way to do great work is to love what you do.",
    author: "Steve Jobs",
    category: "Motivation",
    details: "Loving your work leads to greatness and fulfillment.",
    imageUrl: "https://via.placeholder.com/150",
  ),
  Quote(
    text: "It always seems impossible until it's done.",
    author: "Nelson Mandela",
    category: "Motivation",
    details: "Overcoming challenges makes the impossible possible.",
    imageUrl: "https://via.placeholder.com/150",
  ),
  Quote(
    text: "Start where you are. Use what you have. Do what you can.",
    author: "Arthur Ashe",
    category: "Motivation",
    details: "Take action with the resources you have now.",
    imageUrl: "https://via.placeholder.com/150",
  ),
  Quote(
    text: "Success is not the key to happiness. Happiness is the key to success.",
    author: "Albert Schweitzer",
    category: "Motivation",
    details: "Find joy in your journey to achieve success.",
    imageUrl: "https://via.placeholder.com/150",
  ),
],

  "Love": [
  Quote(
    text: "Love all, trust a few, do wrong to none.",
    author: "William Shakespeare",
    category: "Love",
    details: "A powerful message about love and trust.",
    imageUrl: "https://via.placeholder.com/150",
  ),
  Quote(
    text: "The best thing to hold onto in life is each other.",
    author: "Audrey Hepburn",
    category: "Love",
    details: "A beautiful reminder of the power of love.",
    imageUrl: "https://via.placeholder.com/150",
  ),
  Quote(
    text: "We accept the love we think we deserve.",
    author: "Stephen Chbosky",
    category: "Love",
    details: "An introspective thought on self-worth and love.",
    imageUrl: "https://via.placeholder.com/150",
  ),
  Quote(
    text: "Love is not about possession, it’s all about appreciation.",
    author: "Unknown",
    category: "Love",
    details: "True love is about valuing the other person.",
    imageUrl: "https://via.placeholder.com/150",
  ),
  Quote(
    text: "Being deeply loved by someone gives you strength.",
    author: "Lao Tzu",
    category: "Love",
    details: "Love empowers and strengthens the soul.",
    imageUrl: "https://via.placeholder.com/150",
  ),
],
"Wisdom": [
  Quote(
    text: "An unexamined life is not worth living.",
    author: "Socrates",
    category: "Wisdom",
    details: "Encourages self-reflection and living with purpose.",
    imageUrl: "https://via.placeholder.com/150",
  ),
  Quote(
    text: "Do not dwell in the past, do not dream of the future, concentrate the mind on the present moment.",
    author: "Buddha",
    category: "Wisdom",
    details: "A lesson on mindfulness and living in the present.",
    imageUrl: "https://via.placeholder.com/150",
  ),
  Quote(
    text: "Knowledge speaks, but wisdom listens.",
    author: "Jimi Hendrix",
    category: "Wisdom",
    details: "True wisdom is in understanding and listening.",
    imageUrl: "https://via.placeholder.com/150",
  ),
  Quote(
    text: "Turn your wounds into wisdom.",
    author: "Oprah Winfrey",
    category: "Wisdom",
    details: "Learn from life's challenges and grow stronger.",
    imageUrl: "https://via.placeholder.com/150",
  ),
  Quote(
    text: "The only true wisdom is in knowing you know nothing.",
    author: "Socrates",
    category: "Wisdom",
    details: "A humbling realization about the vastness of knowledge.",
    imageUrl: "https://via.placeholder.com/150",
  ),
],
    
  };

  String _selectedCategory = "Motivation";
  late Quote _currentQuote;

  @override
  void initState() {
    super.initState();
    _currentQuote = _getRandomQuote(_selectedCategory);
  }

  Quote _getRandomQuote(String category) {
    List<Quote> quotes = _quotesByCategory[category]!;
    return quotes[_random.nextInt(quotes.length)];
  }

  void _changeQuote() {
    setState(() {
      _currentQuote = _getRandomQuote(_selectedCategory);
    });
  }

  void _changeCategory(String? newCategory) {
    if (newCategory != null) {
      setState(() {
        _selectedCategory = newCategory;
        _currentQuote = _getRandomQuote(_selectedCategory);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Random Quote Generator")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButton<String>(
              value: _selectedCategory,
              items: _quotesByCategory.keys.map((String category) {
                return DropdownMenuItem<String>(
                  value: category,
                  child: Text(category),
                );
              }).toList(),
              onChanged: _changeCategory,
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "\"${_currentQuote.text}\"",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
              ),
            ),
            Text(
              "- ${_currentQuote.author}",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _changeQuote,
              child: Text("New Quote"),
            ),
            


            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QuoteDetailsScreen(
                      quote: _currentQuote.text,
                      author: _currentQuote.author,
                      details: _currentQuote.details,
                      imageUrl: _currentQuote.imageUrl,
                    ),
                  ),
                );
              },
              child: Text("See Details"),
            ),
          ],
        ),
      ),
    );
  }
}
