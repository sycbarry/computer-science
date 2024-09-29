https://maxhalford.github.io/prince/pca/#resources

Generally, PCA is used to reduce the dimensionality of data into their most optimal, or "principal" subcomponents.

Can be used with MLC techniques, when we do something like building a corpus of words with scores that match the input text. Then we take those vector scores and compile each into a PCA that fit into something more concise then the raw classified value. 

Original Data

```
tfidf = TfidfVectorizer()
corpus = training_set['clean_text']
Xfeatures = tfidf.fit_transform(corpus).toarray()
```

```
dataset = pd.DataFrame(Xfeatures)
X = dataset.iloc[:, :-1].values 
Y = dataset[4050] 
X = pd.DataFrame(X)
```

```
    pca = prince.PCA(
         n_components=20,
         n_iter=10,
         rescale_with_mean=False,
         rescale_with_std=False,
         copy=True,
         check_input=True,
         engine='sklearn',
         random_state=234
     )
    pca = pca.fit(X_train)
```

Note, some of this code is copied from: https://www.kaggle.com/code/ahmadalijamali/twitter-financial-news-nlp-analysis-and-prediction. Referenced as fair-use.