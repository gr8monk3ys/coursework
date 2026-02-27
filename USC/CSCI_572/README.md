# CSCI 572 - Information Retrieval and Web Search Engines

This repository contains homework assignments for USC's CSCI 572 course focusing on information retrieval and web search engine technologies.

## Course Content

The course covers:
- Web crawling and data collection
- Document indexing with MapReduce
- Search engine comparison and evaluation
- Vector databases and semantic search

## Assignments

### HW1: Search Engine Comparison
- Compares search results from DuckDuckGo vs. Google across 100 queries
- Calculates Spearman rank correlation coefficients
- Measures overlap percentage between search engines
- **Tools:** Python, BeautifulSoup, requests

### HW2: Web Crawling
- Crawls USA Today website (up to 10,000 URLs with depth control)
- Collects URLs, HTTP status codes, page sizes, outlinks, and content types
- Generates fetch, visit, and URL reports with crawl statistics
- **Tools:** Python (requests, BeautifulSoup)

### HW3: Document Indexing with Hadoop MapReduce
- Implements unigram and bigram inverted indices using MapReduce
- Tracks document frequency for each word/phrase
- Includes word counting utility
- **Tools:** Java, Apache Hadoop MapReduce

### HW4: Vector Databases and Semantic Search
- Q1: Weaviate vector database with semantic similarity search using `text2vec-transformers` and GraphQL
- Q2: Web content crawler (GPT-Crawler) scraping Reddit's r/USC subreddit
- Q3–Q4: Text analysis and PDF document processing
- **Tools:** Weaviate, GPT-Crawler (TypeScript), GraphQL

## Technologies Used
- Python (BeautifulSoup, requests)
- Java (Hadoop MapReduce)
- Weaviate (vector database)
- TypeScript (GPT-Crawler)
