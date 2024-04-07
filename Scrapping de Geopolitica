import urllib.request
from html.parser import HTMLParser
import sqlite3

class GeopoliticsHTMLParser(HTMLParser):
    def __init__(self):
        super().__init__()
        self.articles = []

    def handle_starttag(self, tag, attrs):
        if tag == 'a':
            for attr in attrs:
                if attr[0] == 'href' and attr[1].startswith('/wiki/') and 'Portal:Geography' not in attr[1]:
                    self.articles.append(attr[1])

def scrape_geopolitics_articles():
    url = "https://en.wikipedia.org/wiki/Portal:Geography"
    response = urllib.request.urlopen(url)
    html = response.read().decode('utf-8')

    parser = GeopoliticsHTMLParser()
    parser.feed(html)

    articles = []
    for article in parser.articles:
        article_url = "https://en.wikipedia.org" + article
        article_title = article.split('/')[-1].replace('_', ' ')
        articles.append((article_title, article_url))

    return articles

def create_database():
    connection = sqlite3.connect('geopolitics_articles.db')
    cursor = connection.cursor()

    cursor.execute('''
        CREATE TABLE IF NOT EXISTS articulos (
            id INTEGER PRIMARY KEY,
            titulo TEXT,
            url TEXT
        )
    ''')

    connection.commit()
    connection.close()

def insert_articles(articles):
    connection = sqlite3.connect('geopolitics_articles.db')
    cursor = connection.cursor()

    cursor.executemany('INSERT INTO articulos (titulo, url) VALUES (?, ?)', articles)

    connection.commit()
    connection.close()

def main():
    create_database()
    articles = scrape_geopolitics_articles()
    insert_articles(articles)
    print("Datos almacenados correctamente.")

if __name__ == "__main__":
    main()
