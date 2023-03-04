// ignore_for_file: public_member_api_docs

class Word {
  final int? id;
  final String? word;
  final String? definition;
  final String? partOfSpeech;
  final String? example;
  final String? relevance;
  final String? image;
  final String? content;
  final String? mongolianWord;
  final String? mongolianDefinition;
  final String? mongolianExample;
  final String? mongolianRelevance;
  final String? mongolianContent;
  final String? sourceUrl;

  Word({
    this.id,
    this.word,
    this.partOfSpeech,
    this.definition,
    this.example,
    this.relevance,
    this.image,
    this.content,
    this.mongolianWord,
    this.mongolianDefinition,
    this.mongolianExample,
    this.mongolianRelevance,
    this.mongolianContent,
    this.sourceUrl,
  });

  static Word dummy() {
    return Word(
      id: 1,
      word: 'Apple',
      partOfSpeech: 'noun',
      definition:
          'a round fruit with red, yellow, or green skin and firm white flesh',
      example: 'She took a bite out of the apple.',
      relevance: 'Apples are often associated with health and nutrition.',
      image: 'https://www.example.com/apple.jpg',
      content: 'Apples are a rich source of antioxidants and dietary fiber.',
      mongolianWord: 'Алим',
      mongolianDefinition:
          'Шар өндөгтэй, шар, шаргалтай ягаан өмсөхийн явцгаас гадна бусад өндөг',
      mongolianExample:
          'Тэр насны хамгийн эрэлт хоолоор ямар алим түүний хандтай хамт орж ирсэн.',
      mongolianRelevance:
          'Алим нь идээр ба бодисын амьдралд багтаан явдаг бөгөөд өнгөрсөн хувилбарууд нь өндөр зөвөлгөөний төлөөлөгч байгаа.',
      mongolianContent:
          'Алим нь антиоксидант болон хоолны судалгаанд дэмжих бага зэрэг хүндэтгэл, амьдралд шинэчлэл болон өндөр зөвөлгөөний төлөөлөгч байгаа.',
      sourceUrl: 'https://www.example.com/apple',
    );
  }
}
