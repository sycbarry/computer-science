https://maxhalford.github.io/prince/pca/#resources

Generally, PCA is used to reduce the dimensionality of data into their most important or "principal" subcomponents. Great for reducing large (massive) feature sets into the most important ones. 

Can be used with MLC techniques, when we do something like building a corpus of words with scores that match the input text. Then we take those vector scores and compile each into a PCA that fit into something more concise then the raw classified value. 

Original Data

```python
tfidf = TfidfVectorizer()
corpus = training_set['clean_text']
Xfeatures = tfidf.fit_transform(corpus).toarray()
```

```python
dataset = pd.DataFrame(Xfeatures)
X = dataset.iloc[:, :-1].values 
Y = dataset[4050] 
X = pd.DataFrame(X)
```

```python
from sklearn.decomposition import PCA

pca = PCA(n_components=10)
tfidf_train_pca = pca.fit_transform(train_surnames.toarray())
tfidf_test_pca = pca.transform(test_surnames.toarray())

pca_columns = [f'Surname_PCA_{i+1}' for i in range(10)]
df_train_pca = pd.DataFrame(tfidf_train_pca, columns=pca_columns)
df_test_pca = pd.DataFrame(tfidf_test_pca, columns=pca_columns)
```

Note, some of this code is copied from: https://www.kaggle.com/code/ahmadalijamali/twitter-financial-news-nlp-analysis-and-prediction. Referenced as fair-use.