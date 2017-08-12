John Hopkins Coursera: Data Science Capstone Presentation
========================================================
author: Javier Padilla
date: 8/9/2017
autosize: true

Overview
========================================================

If you have not tried the app, go [here](https://javi9tf.shinyapps.io/Capstone/) to try it!

- Predicts next word
- Shows you top 3 other possibilities
- Can be used to string together continuous, sensible sentences (even with the limited amount of data it's using now)

How To Use the App
========================================================

-Simply input a word for the application to predict.

Underlying Algorithm
========================================================

- N-gram model with "Stupid Backoff" ([Brants et al 2007](http://www.cs.columbia.edu/~smaskey/CS6998-0412/supportmaterial/langmodel_mapreduce.pdf))
- Checks if highest-order (in this case, n=4) n-gram has been seen. If not "degrades" to a lower-order model (n=3, 2); we could use even higher orders, but ShinyApps caps app data size to 100mb

<div style="align:center"><img src="images/algo-flow.png" alt="algorithm flow" /></div>

Fast and Scaleable for This Purpose
========================================================

- The underlying code stores the n-gram and frequency tables in an SQLite database. 
-N-gram queries use SQL, which is
optimized for this type of table retrieval/lookup (can also be adapted for even larger production-scale databases
like PostgreSQL)
- "Stupid Backoff" is designed for scale. Remember we are restricted to 100mb on ShinyApps, but the 
[original paper](http://www.cs.columbia.edu/~smaskey/CS6998-0412/supportmaterial/langmodel_mapreduce.pdf)
trained on 2 trillion tokens
-Only 1.5% of the data provided by SwiftKey and Coursera is able to fit into the 100mb data limit

Further Exploration
========================================================

- The code (for processing into a database and prediction) is available on my github ur: 
- Further work can expand the main weakness of this approach: long-range context
    1. Current algorithm discards contextual information past 4-grams
    2. We can incorporate this into future work through clustering underlying training corpus/data and predicting what cluster the entire sentence would fall into
    3. This allows us to predict using ONLY the data subset that fits the long-range context of the sentence, while still preserving the performance characteristics of an n-gram and Stupid Backoff model
 
 Conclusion
=========================================================
 
 Hope you enjoyed my project and best wishes!
